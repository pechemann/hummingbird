/////////////////////////////////////////////////////////////////////////////////////
//
//    Simplified BSD License
//    ======================
//    
//    Copyright 2013-2014 Pascal ECHEMANN. All rights reserved.
//    
//    Redistribution and use in source and binary forms, with or without modification,
//    are permitted provided that the following conditions are met:
//    
//    1. Redistributions of source code must retain the above copyright notice, this
//       list of conditions and the following disclaimer. 
//    
//    2. Redistributions in binary form must reproduce the above copyright notice,
//       this list of conditions and the following disclaimer in the documentation
//       and/or other materials provided with the distribution. 
//    
//    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//    ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//    WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//    DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
//    ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//    (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//    ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//    SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//    
//    The views and conclusions contained in the software and documentation are those
//    of the authors and should not be interpreted as representing official policies, 
//    either expressed or implied, of the copyright holders.
//    
/////////////////////////////////////////////////////////////////////////////////////

package org.flashapi.hummingbird.utils {
	
	// -----------------------------------------------------------
	//  MetadataParser.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.1.2, 20/10/2013 16:30
	 *  @see http://www.flashapi.org/
	 */
	
	import flash.utils.describeType;
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	import org.flashapi.hummingbird.controller.IController;
	import org.flashapi.hummingbird.core.HummingbirdBase;
	import org.flashapi.hummingbird.core.IApplicationContext;
	import org.flashapi.hummingbird.core.IMVCObject;
	import org.flashapi.hummingbird.core.MVCReference;
	import org.flashapi.hummingbird.enum.InterfaceReferenceEnum;
	import org.flashapi.hummingbird.enum.MetadataReferenceEnum;
	import org.flashapi.hummingbird.events.DependencyEvent;
	import org.flashapi.hummingbird.exceptions.InvalidTypeException;
	import org.flashapi.hummingbird.exceptions.MetadataException;
	import org.flashapi.hummingbird.exceptions.NoSuchDefinitionException;
	import org.flashapi.hummingbird.model.IModel;
	import org.flashapi.hummingbird.orchestrator.IOrchestrator;
	import org.flashapi.hummingbird.service.IService;
	import org.flashapi.hummingbird.utils.constants.MetadataConstant;
	import org.flashapi.hummingbird.view.IStarlingView;
	import org.flashapi.hummingbird.view.IView;
	
	/**
	 * 	Metadata parser for Hummingbird framework. Translates Metadata emitted by
	 * 	the Flash compiler into ActionScript objects that support mapping configuration  
	 * 	with Hummingbird IoC containers.
	 */
	public class MetadataParser {
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	Sets the reference to the dependency Event class used by the Starling
		 * 	version of the Hummingbird framework to notify dependecy injection
		 * 	events.
		 * 
		 * 	@param	starlingEventRef 	The reference to the dependency Event class 
		 * 								for the Starling version of the Hummingbird
		 * 								framework.
		 */
		public static function setStarlingEventRef(starlingEventRef:Class):void {
			HummingbirdBase.getLogger().config("Starling event reference added");
			MetadataParser.StarlingEventRef = starlingEventRef;
		}
		
		/**
		 * 	Parses and maps the Metadata defined within the specified object.
		 * 
		 * 	@param	obj						The MVC object for which to parse Metadata.
		 * 	@param	singletonInstances		The collection of singleton MVC instances
		 * 									stored in a Hummingbird IoC container.
		 * 	@param	singletonReferences		The collection of singleton class references
		 * 									registered in a Hummingbird IoC container.
		 * 
		 * 	@throws org.flashapi.hummingbird.exceptions.MetadataException
		 * 			Throws a <code>MetadataException</code> exception if the specified
		 * 			object contains invalid Metadata.
		 * 	@throws org.flashapi.hummingbird.exceptions.InvalidTypeException
		 * 			Throws a <code>InvalidTypeException</code> exception if the specified
		 * 			object implements an invalid MVC interface.
		 * 	@throws ReferenceError 
		 * 			Throws a <code>ReferenceError</code> error if the specified
		 * 			class for a <code>RegisterClass</code> Metadata declaration is
		 * 			undefined.
		 */
		public static function parseMetadata(obj:Object, singletonInstances:Dictionary, singletonReferences:Dictionary):void {
			_dependentObj = new Vector.<Object>();
			try {
				if (obj is IApplicationContext) {
					MetadataParser._contextRef = obj as IApplicationContext;
				} else if(MetadataParser._contextRef == null) {
					HummingbirdBase.getLogger()
					.warn("The object '" + obj + "' is not of type IApplicationContext on MetadataParser.parseMetadata()");
				}
				MetadataParser.parseSingletons(obj, singletonInstances, singletonReferences);
				while (_dependentObj.length > 0) {
					MetadataParser.injectDependencies(_dependentObj.shift(), singletonInstances);
				}
				_contextRef = null;
				_dependentObj = null;
				_singletonType = null;
				_metadataRef = null;
			} catch (e:MetadataException) {
				throw e;
			} catch (e:InvalidTypeException) {
				throw e;
			} catch (e:ReferenceError) {
				throw new MetadataException(
					new MetadataErrorBuilder()
					.message("type", "", " ")
					.message(_singletonType, "'", "'")
					.message("is not defined on", " ", " ")
					.message(_metadataRef)
					.dot()
					.build()
				);
			} catch (e:Error) {
				throw e;
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	The reference to the dependency Event class for the Starling version of
		 * 	the Hummingbird framework.
		 */
		private static var StarlingEventRef:Class;
		
		/**
		 * 	@private
		 * 
		 * 	A temporary collection used by the parser to store object for which to
		 * 	inject dependencies.
		 */
		private static var _dependentObj:Vector.<Object>;
		
		/**
		 * 	@private
		 * 
		 * 	The temporary reference to the type of the current singleton.
		 */
		private static var _singletonType:String;
		
		/**
		 * 	@private
		 * 
		 * 	The temporary reference to metadata currently being processed.
		 */
		private static var _metadataRef:String;
		
		/**
		 * 	@private
		 * 
		 * 	The temporary reference to applications context currently being processed.
		 */
		private static var _contextRef:IApplicationContext;
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Parses the specified instance for retrieving and instantiating the classes
		 * 	declared with the RegisterClass metadata. This method is recursive.
		 * 
		 * 	@param	obj						The object to parse.
		 * 	@param	singletonInstances		The collection of singleton MVC instances
		 * 									stored in a Hummingbird IoC container.
		 * 	@param	singletonReferences		The collection of singleton class references
		 * 									registered in a Hummingbird IoC container.
		 */
		private static function parseSingletons(obj:Object, singletonInstances:Dictionary, singletonReferences:Dictionary):void {
			_dependentObj.push(obj);
			var reflection:XML = describeType(obj);
			var metadata:XMLList = reflection..metadata;
			_metadataRef = MetadataConstant.REGISTER_CLASS;
			var list:XMLList = metadata.(@name == _metadataRef);
			var len:int = list.length() - 1;
			var arg:XML;
			var key:String = MetadataConstant.TYPE;
			var argList:XMLList;
			var buffer:Vector.<Object> = new Vector.<Object>();
			buffer.push(obj);
			var singleton:Object;
			for (; len >= 0; len--) {
				argList = list[len].arg;
				MetadataParser.checkArgumentsCount(argList.length(), 1);
				arg = argList[0];
				MetadataParser.checkKeyArgument(String(arg.@key), key);
				_singletonType = String(arg.@value);
				if (singletonReferences[_singletonType]) {
					continue;
				} else {
					singleton = MetadataParser.createSingleton(_singletonType, singletonInstances, singletonReferences);
					MetadataParser.parseSingletons(singleton, singletonInstances, singletonReferences);
				}
			}
		}
		
		/**
		 * 	@private
		 * 
		 * 	Creates a new MVC singleton instance of type specified by the <code>type</code>
		 * 	parameter.
		 * 
		 * 	@param	type					The type of the singleton instance.
		 * 	@param	singletonInstances		The collection of singleton MVC instances
		 * 									stored in a Hummingbird IoC container.
		 * 	@param	singletonReferences		The collection of singleton class references
		 * 									registered in a Hummingbird IoC container.
		 * 
		 * 	@return	The created singleton instance.
		 * 
		 * 	@throws org.flashapi.hummingbird.exceptions.MetadataException
		 * 			Throws a <code>MetadataException</code> exception if the specified
		 * 			object contains invalid Metadata.
		 * 	@throws ReferenceError 
		 * 			Throws a <code>ReferenceError</code> error if the specified
		 * 			class for a <code>RegisterClass</code> Metadata declaration is
		 * 			undefined.
		 * 	@throws org.flashapi.hummingbird.exceptions.NoSuchDefinitionException
		 * 			Throws a <code>NoSuchDefinitionException</code> exception if the 
		 * 			specified object contains invalid aliases.
		 */
		private static function createSingleton(type:String, singletonInstances:Dictionary, singletonReferences:Dictionary):Object {
			var ClassRef:Class = getDefinitionByName(type) as Class;
			var singleton:Object = new ClassRef();
			var reflection:XML = describeType(singleton);
			var metadata:XMLList = reflection..metadata;
			_metadataRef = MetadataConstant.QUALIFIER;
			var list:XMLList = metadata.(@name == _metadataRef);
			MetadataParser.checkMetadata(_metadataRef, list.length(), singleton);
			var arg:XML;
			var argList:XMLList = list.arg;
			MetadataParser.checkArgumentsCount(argList.length(), 1);
			arg = argList[0];
			MetadataParser.checkKeyArgument(String(arg.@key), MetadataConstant.ALIAS);
			var alias:String = String(arg.@value);
			MetadataParser.checkAlias(alias, singleton);
			singletonInstances[alias] = MetadataParser.getMVCReference(alias, singleton as IMVCObject, type);
			singletonReferences[type] = type;
			return singleton;
		}
		
		/**
		 * 	Returns a <code>MVCReference</code> instance initialized from the specified
		 * 	parameters.
		 * 
		 * 	@param	alias			The alias for the associated MVC object.
		 * 	@param	mvcObject		The MVC object associated to the new <code>MVCReference</code>
		 * 							instance.
		 * 	@param	typeDefinition	A string that represents the fully qualified class
		 * 							name for the associated MVC object.
		 * 
		 * 	@return	A <code>MVCReference</code> instance.
		 */
		private static function getMVCReference(alias:String, mvcObject:IMVCObject, typeDefinition:String):MVCReference {
			var reference:MVCReference = new MVCReference();
			reference.context = MetadataParser._contextRef;
			reference.alias = alias;
			reference.mvcObject = mvcObject;
			reference.typeDefinition = typeDefinition
			return reference;
		}
		
		/**
		 * 	@private
		 * 
		 * 	Inject MVC dependencies, based on metadata declarations, in the specified
		 * 	object.
		 * 
		 * 	@param	obj					The object for which to inject MVC
		 * 								dependencies.
		 * 	@param	singletonInstances	The collection of singleton MVC instances
		 * 								stored in a Hummingbird IoC container.
		 */
		private static function injectDependencies(obj:Object, singletonInstances:Dictionary):void {
			var reflection:XML = describeType(obj);
			var interfaceType:String;
			//--> Model objects must be created before controller and orchestrator objects:
			if (obj is IStarlingView) {
				interfaceType = InterfaceReferenceEnum.STARLING_VIEW.getInterfaceType();
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.MODEL);
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.CONTROLLER);
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.ORCHESTRATOR);
				MetadataParser.checkInvalidDependencies(obj, reflection, MetadataConstant.SERVICE, interfaceType);
				obj.dispatchEvent(new MetadataParser.StarlingEventRef(MetadataParser.StarlingEventRef.DEPENDENCY_COMPLETE));
			} else if (obj is IView) {
				interfaceType = InterfaceReferenceEnum.VIEW.getInterfaceType();
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.MODEL);
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.CONTROLLER);
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.ORCHESTRATOR);
				MetadataParser.checkInvalidDependencies(obj, reflection, MetadataConstant.SERVICE, interfaceType);
				obj.dispatchEvent(new DependencyEvent(DependencyEvent.DEPENDENCY_COMPLETE));
			} else if (obj is IApplicationContext) {
				interfaceType = InterfaceReferenceEnum.APPLICATION_CONTEXT.getInterfaceType();
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.MODEL);
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.CONTROLLER);
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.ORCHESTRATOR);
				MetadataParser.checkInvalidDependencies(obj, reflection, MetadataConstant.SERVICE, interfaceType);
				obj.dispatchEvent(new DependencyEvent(DependencyEvent.DEPENDENCY_COMPLETE));
			} else if (obj is IController) {
				interfaceType = InterfaceReferenceEnum.CONTROLLER.getInterfaceType();
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.MODEL);
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.SERVICE);
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.ORCHESTRATOR);
				MetadataParser.checkInvalidDependencies(obj, reflection, MetadataConstant.CONTROLLER, interfaceType);
				obj.dispatchEvent(new DependencyEvent(DependencyEvent.DEPENDENCY_COMPLETE));
			} else if (obj is IOrchestrator) {
				interfaceType = InterfaceReferenceEnum.ORCHESTRATOR.getInterfaceType();
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.MODEL);
				MetadataParser.checkInvalidDependencies(obj, reflection, MetadataConstant.CONTROLLER, interfaceType);
				MetadataParser.checkInvalidDependencies(obj, reflection, MetadataConstant.SERVICE, interfaceType);
				MetadataParser.checkInvalidDependencies(obj, reflection, MetadataConstant.ORCHESTRATOR, interfaceType);
				obj.dispatchEvent(new DependencyEvent(DependencyEvent.DEPENDENCY_COMPLETE));
			} else if (obj is IModel) {
				interfaceType = InterfaceReferenceEnum.MODEL.getInterfaceType();
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.SERVICE);
				MetadataParser.checkInvalidDependencies(obj, reflection, MetadataConstant.MODEL, interfaceType);
				MetadataParser.checkInvalidDependencies(obj, reflection, MetadataConstant.CONTROLLER, interfaceType);
				MetadataParser.checkInvalidDependencies(obj, reflection, MetadataConstant.ORCHESTRATOR, interfaceType);
				obj.dispatchEvent(new DependencyEvent(DependencyEvent.DEPENDENCY_COMPLETE));
			} else if (obj is IService) {
				interfaceType = InterfaceReferenceEnum.SERVICE.getInterfaceType();
				MetadataParser.checkInvalidDependencies(obj, reflection, MetadataConstant.MODEL, interfaceType);
				MetadataParser.checkInvalidDependencies(obj, reflection, MetadataConstant.CONTROLLER, interfaceType);
				MetadataParser.checkInvalidDependencies(obj, reflection, MetadataConstant.ORCHESTRATOR, interfaceType);
				MetadataParser.checkInvalidDependencies(obj, reflection, MetadataConstant.SERVICE, interfaceType);
			}
		}
		
		/**
		 * 	@private
		 * 
		 * 	Inject all MVC dependencies, based on metadata declarations, in the specified
		 * 	object.
		 * 
		 * 	@param	obj					The object for which to inject MVC
		 * 								dependencies.
		 * 	@param	reflection			The desciption of the object extract from
		 * 								the AS3 reflection API.
		 * 	@param	singletonInstances	The collection of singleton MVC instances
		 * 								stored in a Hummingbird IoC container.
		 * 	@param	metadataRef			The metadata tag considered for this injection
		 * 								of dependecies; must be MetadataConstant.MODEL
		 * 								MetadataConstant.CONTROLLER or MetadataConstant.SERVICE.
		 * 
		 * 	@throws org.flashapi.hummingbird.exceptions.NoSuchDefinitionException
		 * 			Throws a <code>NoSuchDefinitionException</code> exception if an alias in the 
		 * 			specified object has not been found.
		 */
		private static function injectInstances(obj:Object, reflection:XML, singletonInstances:Dictionary, metadataRef:String):void {
			var dependencyList:XMLList = reflection..metadata.(@name == metadataRef);
			var len:int = dependencyList.length() - 1;
			var dependency:XML;
			var parent:XML;
			var propName:String;
			var alias:String;
			var mvcRef:MVCReference;
			var singleton:Object;
			for (; len >= 0; len--) {
				dependency = dependencyList[len];
				parent = dependency.parent();
				propName = parent.@name;
				alias = dependency.arg[0].@value;
				mvcRef = singletonInstances[alias];
				if (mvcRef != null) {
					singleton = mvcRef.mvcObject;
					MetadataParser.checkInvalidMVCMetadata(metadataRef, singleton, alias);
					obj[propName] = singleton;
				} else {
					throw new NoSuchDefinitionException(
						new MetadataErrorBuilder()
						.message("the alias")
						.message(alias, " '", "'")
						.message(" has not been found")
						.dot()
						.build()
					);
				}
			}
		}
		
		/**
		 * 	@private
		 * 
		 * 	Checks whether the specified object uses invalid MVC metadata declarations,
		 * 	or not.
		 * 
		 * 	@param	metadataRef			The metadata tag considered for the specified
		 * 								object.
		 * 	@param	obj					The object for which to check the MVC metadata.
		 * 	@param	alias				The alias of the specified object.
		 * 
		 * 	@throws org.flashapi.hummingbird.exceptions.MetadataException
		 * 			Throws a <code>MetadataException</code> exception if the specified
		 * 			object contains invalid MVC metadata.
		 * 	@throws org.flashapi.hummingbird.exceptions.InvalidTypeException
		 * 			Throws a <code>InvalidTypeException</code> exception if the specified
		 * 			object implements an invalid MVC interface.
		 */
		private static function checkInvalidMVCMetadata(metadataRef:String, obj:Object, alias:String) :void {
			var isValidInterface:Boolean = true;
			var isMetadataValid:Boolean = true;
			var expectedValue:String;
			if (metadataRef == MetadataConstant.MODEL) {
				isValidInterface = Boolean(obj is IModel);
				expectedValue = MetadataConstant.MODEL;
				isMetadataValid = MetadataParser.isValidMetadata(metadataRef, expectedValue);
			} else if (metadataRef == MetadataConstant.CONTROLLER) {
				isValidInterface = Boolean(obj is IController);
				expectedValue = MetadataConstant.CONTROLLER;
				isMetadataValid = MetadataParser.isValidMetadata(metadataRef, expectedValue);
			} else if (metadataRef == MetadataConstant.ORCHESTRATOR) {
				isValidInterface = Boolean(obj is IOrchestrator);
				expectedValue = MetadataConstant.ORCHESTRATOR;
				isMetadataValid = MetadataParser.isValidMetadata(metadataRef, expectedValue);
			} else if (metadataRef == MetadataConstant.SERVICE) {
				isValidInterface = Boolean(obj is IService);
				expectedValue = MetadataConstant.SERVICE;
				isMetadataValid = MetadataParser.isValidMetadata(metadataRef, expectedValue);
			}
			if (isValidInterface == false) {
				throw new InvalidTypeException(
					new MetadataErrorBuilder()
					.message("invalid interface declaration")
					.message(alias, " on '","'")
					.dot()
					.expected(MetadataParser.geInterfaceFromMetadata(expectedValue), " ")
					.dot()
					.build()
				);
			} else if (isMetadataValid == false) {
				throw new MetadataException(
					new MetadataErrorBuilder()
					.message("invalid metadata declaration")
					.message(metadataRef, " '", "'")
					.message(alias, " on '","'")
					.dot()
					.expected(MetadataParser.getMetadataFromInterface(obj), " ")
					.dot()
					.build()
				);
			}
		}
		
		/**
		 * 	@private
		 * 
		 * 	Compares the metadata found on a MVC object with the expected value.
		 * 
		 * 	@param	metadataRef	A metadata reference found on a MVC object.
		 * 	@param	expectedValue	The expected metadata value.
		 * 
		 * 	@return	<code>true</code> whether <code>metadataRef</code> matches
		 * 			<code>expectedValue</code>; <code>false</code> otherwise.
		 */
		private static function isValidMetadata(metadataRef:String, expectedValue:String):Boolean {
			var isValid:Boolean = Boolean(metadataRef == expectedValue);
			return isValid;
		}
		
		/**
		 * 	@private
		 * 
		 * 	Returns the expected interface retreived from the specified MVC metadata.
		 * 
		 * 	@param	metadata	A MVC metadata reference.
		 * 	
		 * 	@return	The expected interface.
		 */
		private static function geInterfaceFromMetadata(metadata:String):String {
			var interfaceReference:String;
			if (metadata == MetadataReferenceEnum.CONTROLLER.metadataReference) {
				interfaceReference = MetadataReferenceEnum.CONTROLLER.interfaceReference;
			} else if (metadata == MetadataReferenceEnum.MODEL.metadataReference) {
				interfaceReference = MetadataReferenceEnum.MODEL.interfaceReference;
			} else if (metadata == MetadataReferenceEnum.CONTROLLER.metadataReference) {
				interfaceReference = MetadataReferenceEnum.CONTROLLER.interfaceReference;
			} else if (metadata == MetadataReferenceEnum.ORCHESTRATOR.metadataReference) {
				interfaceReference = MetadataReferenceEnum.ORCHESTRATOR.interfaceReference;
			} else if (metadata == MetadataReferenceEnum.SERVICE.metadataReference) {
				interfaceReference = MetadataReferenceEnum.SERVICE.interfaceReference;
			}
			return interfaceReference;
		}
		
		/**
		 * 	@private
		 * 
		 * 	Returns the expected MVC metadata retreived from the interface implemented
		 *  by the specified MVC object.
		 * 
		 * 	@param	obj	The MVC object for which to find the MVC interface and metadata.
		 * 	
		 * 	@return	A MVC metadata reference.
		 */
		private static function getMetadataFromInterface(obj:Object):String {
			var reflection:XML = describeType(obj);
			var interfaces:XMLList = reflection..implementsInterface;
			var metadataDeclaration:String;
			if (interfaces.(@type == MetadataReferenceEnum.CONTROLLER.interfaceReference) != null) {
				metadataDeclaration = MetadataReferenceEnum.CONTROLLER.metadataReference;
			} else if (interfaces.(@type == MetadataReferenceEnum.MODEL.interfaceReference) != null) {
				metadataDeclaration = MetadataReferenceEnum.MODEL.metadataReference;
			} else if (interfaces.(@type == MetadataReferenceEnum.CONTROLLER.interfaceReference) != null) {
				metadataDeclaration = MetadataReferenceEnum.CONTROLLER.metadataReference;
			} else if (interfaces.(@type == MetadataReferenceEnum.ORCHESTRATOR.interfaceReference) != null) {
				metadataDeclaration = MetadataReferenceEnum.ORCHESTRATOR.metadataReference;
			} else if (interfaces.(@type == MetadataReferenceEnum.SERVICE.interfaceReference) != null) {
				metadataDeclaration = MetadataReferenceEnum.SERVICE.metadataReference;
			}
			return metadataDeclaration;
		}
		
		/**
		 * 	@private
		 * 
		 * 	Checks whether the specified object contains invalid dependency declarations,
		 * 	or not.
		 * 
		 * 	@param	obj					The object for which to inject MVC
		 * 								dependencies.
		 * 	@param	reflection			The desciption of the object extract from
		 * 								the AS3 reflection API.
		 * 	@param	metadataRef			The metadata tag considered for this injection
		 * 								of dependecies; must be MetadataConstant.MODEL
		 * 								MetadataConstant.CONTROLLER or MetadataConstant.SERVICE.
		 * 	@param	type				The MVC markup interface for this object.
		 * 
		 * 	@throws org.flashapi.hummingbird.exceptions.MetadataException
		 * 			Throws a <code>MetadataException</code> exception if the specified
		 * 			object contains invalid dependency declarations.
		 */
		private static function checkInvalidDependencies(obj:Object, reflection:XML, metadataRef:String, type:String):void {
			var dependencyList:XMLList = reflection..metadata.(@name == metadataRef);
			var len:int = dependencyList.length();
			if (len > 0) {
				throw new MetadataException(
					new MetadataErrorBuilder()
					.message("illegal dependency declaration on")
					.message(obj.toString(), " ", ":")
					.message(metadataRef, " ")
					.message("is not allowed in", " ", " ")
					.message(type)
					.message("objects"," " )
					.dot()
					.build()
				);
			}
		}
		
		/**
		 * 	@private
		 * 
		 * 	Checks whether the number of argument for the current metadata is valid,
		 * or not.
		 * 
		 * 	@param	length				The number of arguments for the metadata
		 * 								to check. 
		 * 	@param	expectactedValue	The expected number of arguments for the
		 * 								metadata to check. 
		 * 
		 * 	@throws org.flashapi.hummingbird.exceptions.MetadataException
		 * 			Throws a <code>MetadataException</code> exception if the specified
		 * 			object contains invalid Metadata.
		 */
		private static function checkArgumentsCount(length:int, expectactedValue:int):void {
			if (length != expectactedValue) {
				throw new MetadataException(
					new MetadataErrorBuilder()
					.message("argument count mismatch on")
					.message(_metadataRef, " ", " ")
					.dot()
					.expected(expectactedValue, " ")
					.comma()
					.got(length)
					.dot()
					.build()
				);
			}
		}
		
		/**
		 * 	@private
		 * 
		 * 	Checks whether the argument key property for the current metadata is valid,
		 *  or not.
		 * 
		 * 	@param	argKey				The argument key property for the metadata
		 * 								to check.
		 * 	@param	expectactedValue	The expected argument key property for the
		 * 								metadata to check.
		 * 
		 * 	@throws org.flashapi.hummingbird.exceptions.MetadataException
		 * 			Throws a <code>MetadataException</code> exception if the specified
		 * 			object contains invalid Metadata.
		 */
		private static function checkKeyArgument(argKey:String, expectactedValue:String):void {
			if (argKey != expectactedValue) {
				throw new MetadataException(
					new MetadataErrorBuilder()
					.message("invalid property on")
					.message(_metadataRef, " ", " ")
					.dot()
					.expected(expectactedValue, " ")
					.comma()
					.got(argKey)
					.dot()
					.build()
				);
			}
		}
		
		/**
		 * 	@private
		 * 
		 * 	Checks whether an object contains the specified metadata.
		 * 
		 * 	@param	metadata	The metadata to check.
		 * 	@param	length		The number of metadata for the object to
		 * 						test; must be equal to 1.
		 * 	@param	obj			The object to test.
		 * 
		 * 	@throws org.flashapi.hummingbird.exceptions.MetadataException
		 * 			Throws a <code>MetadataException</code> exception if the specified
		 * 			object contains invalid Metadata.
		 */
		private static function checkMetadata(metadata:String, length:int, obj:Object):void {
			if (length != 1) {
				throw new MetadataException(
					new MetadataErrorBuilder()
					.message(metadata, "'", "'")
					.message("metadata not found on", " ", " ")
					.message(obj.toString())
					.dot()
					.build()
				);
			}
		}
		
		/**
		 * 	@private
		 * 
		 * 	Checks whether the alias for the specified object is not an empty
		 * 	string.
		 * 
		 * 	@param	alias	The alias to test.
		 * 	@param	obj		The object to test.
		 * 
		 * 	@throws org.flashapi.hummingbird.exceptions.MetadataException
		 * 			Throws a <code>MetadataException</code> exception if the specified
		 * 			object contains invalid Metadata.
		 */
		private static function checkAlias(alias:String, obj:Object):void {
			if (alias == "") {
				throw new MetadataException(
					new MetadataErrorBuilder()
					.message("undefined 'alias' value found on")
					.message(obj.toString(), " ")
					.dot()
					.build()
				);
			}
		}
	}
}