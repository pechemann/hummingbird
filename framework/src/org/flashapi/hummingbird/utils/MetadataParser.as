/////////////////////////////////////////////////////////////////////////////////////
//
//    Simplified BSD License
//    ======================
//    
//    Copyright 2013 Pascal ECHEMANN. All rights reserved.
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
	 *  @version 1.1.0, 05/07/2013 20:39
	 *  @see http://www.flashapi.org/
	 */
	
	import flash.utils.describeType;
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	import org.flashapi.hummingbird.controller.IController;
	import org.flashapi.hummingbird.core.IApplicationContext;
	import org.flashapi.hummingbird.enum.MetadataReferenceEnum;
	import org.flashapi.hummingbird.events.DependencyEvent;
	import org.flashapi.hummingbird.exceptions.MetadataException;
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
		 * 	@throws ReferenceError 
		 * 			Throws a <code>ReferenceError</code> error if the specified
		 * 			class for a <code>RegisterClass</code> Metadata declaration is
		 * 			undefined .
		 */
		public static function parseMetadata(obj:Object, singletonInstances:Dictionary, singletonReferences:Dictionary):void {
			_dependentObj = new Vector.<Object>();
			try {
				MetadataParser.parseSingletons(obj, singletonInstances, singletonReferences);
				while (_dependentObj.length > 0) {
					MetadataParser.injectDependencies(_dependentObj.shift(), singletonInstances);
				}
				_dependentObj = null;
				_singletonType = null;
				_metadataRef = null;
			} catch (e:MetadataException) {
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
		 * 			undefined .
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
			singletonInstances[alias] = singleton;
			singletonReferences[type] = type;
			return singleton;
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
			//--> Model objects must be created before controller and orchestrator objects:
			if (obj is IStarlingView) {
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.MODEL);
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.CONTROLLER);
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.ORCHESTRATOR);
				MetadataParser.checkInvalidDependencies(obj, reflection, MetadataConstant.SERVICE, "IStarlingView");
				obj.dispatchEvent(new MetadataParser.StarlingEventRef(MetadataParser.StarlingEventRef.DEPENDENCY_COMPLETE));
			} else if (obj is IView) {
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.MODEL);
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.CONTROLLER);
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.ORCHESTRATOR);
				MetadataParser.checkInvalidDependencies(obj, reflection, MetadataConstant.SERVICE, "IView");
				obj.dispatchEvent(new DependencyEvent(DependencyEvent.DEPENDENCY_COMPLETE));
			} else if (obj is IApplicationContext) {
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.MODEL);
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.CONTROLLER);
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.ORCHESTRATOR);
				MetadataParser.checkInvalidDependencies(obj, reflection, MetadataConstant.SERVICE, "IApplicationContext");
				obj.dispatchEvent(new DependencyEvent(DependencyEvent.DEPENDENCY_COMPLETE));
			} else if (obj is IController) {
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.MODEL);
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.SERVICE);
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.ORCHESTRATOR);
				MetadataParser.checkInvalidDependencies(obj, reflection, MetadataConstant.CONTROLLER, "IController");
				obj.dispatchEvent(new DependencyEvent(DependencyEvent.DEPENDENCY_COMPLETE));
			} else if (obj is IOrchestrator) {
				MetadataParser.injectInstances(obj, reflection, singletonInstances, MetadataConstant.MODEL);
				MetadataParser.checkInvalidDependencies(obj, reflection, MetadataConstant.CONTROLLER, "IOrchestrator");
				MetadataParser.checkInvalidDependencies(obj, reflection, MetadataConstant.SERVICE, "IOrchestrator");
				MetadataParser.checkInvalidDependencies(obj, reflection, MetadataConstant.ORCHESTRATOR, "IOrchestrator");
				obj.dispatchEvent(new DependencyEvent(DependencyEvent.DEPENDENCY_COMPLETE));
			} else {
				MetadataParser.checkInvalidDependencies(obj, reflection, MetadataConstant.MODEL, "IModel");
				MetadataParser.checkInvalidDependencies(obj, reflection, MetadataConstant.CONTROLLER, "IModel");
				MetadataParser.checkInvalidDependencies(obj, reflection, MetadataConstant.ORCHESTRATOR, "IModel");
				MetadataParser.checkInvalidDependencies(obj, reflection, MetadataConstant.SERVICE, "IModel");
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
		 */
		private static function injectInstances(obj:Object, reflection:XML, singletonInstances:Dictionary, metadataRef:String):void {
			var dependencyList:XMLList = reflection..metadata.(@name == metadataRef);
			var len:int = dependencyList.length() - 1;
			var dependency:XML;
			var parent:XML;
			var propName:String;
			var alias:String;
			var singleton:Object;
			for (; len >= 0; len--) {
				dependency = dependencyList[len];
				parent = dependency.parent();
				propName = parent.@name;
				alias = dependency.arg[0].@value;
				singleton = singletonInstances[alias];
				MetadataParser.checkInvalidMVCMetadata(metadataRef, singleton, alias);
				obj[propName] = singleton;
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
		 */
		private static function checkInvalidMVCMetadata(metadataRef:String, obj:Object, alias:String) :void {
			var isValid:Boolean = true;
			var expectactedValue:String;
			if (metadataRef == MetadataConstant.MODEL) {
				isValid = Boolean(obj is IModel);
				expectactedValue = MetadataConstant.MODEL;
			} else if (metadataRef == MetadataConstant.CONTROLLER) {
				isValid = Boolean(obj is IController);
				expectactedValue = MetadataConstant.CONTROLLER;
			} else if (metadataRef == MetadataConstant.ORCHESTRATOR) {
				isValid = Boolean(obj is IOrchestrator);
				expectactedValue = MetadataConstant.ORCHESTRATOR;
			} else if (metadataRef == MetadataConstant.SERVICE) {
				isValid = Boolean(obj is IService);
				expectactedValue = MetadataConstant.SERVICE;
			}
			if (isValid == false) {
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
			var interfaceDeclaration:String;
			if (interfaces.(@type == MetadataReferenceEnum.CONTROLLER.interfaceReference) != null) {
				interfaceDeclaration = MetadataReferenceEnum.CONTROLLER.metadataReference;
			} else if (interfaces.(@type == MetadataReferenceEnum.MODEL.interfaceReferenc) != null) {
				interfaceDeclaration = MetadataReferenceEnum.MODEL.metadataReference;
			} else if (interfaces.(@type == MetadataReferenceEnum.CONTROLLER.interfaceReferenc) != null) {
				interfaceDeclaration = MetadataReferenceEnum.CONTROLLER.metadataReference;
			} else if (interfaces.(@type == MetadataReferenceEnum.ORCHESTRATOR.interfaceReferenc) != null) {
				interfaceDeclaration = MetadataReferenceEnum.ORCHESTRATOR.metadataReference;
			}
			return interfaceDeclaration;
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