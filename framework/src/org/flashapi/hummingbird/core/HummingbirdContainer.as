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

package org.flashapi.hummingbird.core {
	
	// -----------------------------------------------------------
	//  HummingbirdContainer.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.1.0, 24/11/2013 16:00
	 *  @see http://www.flashapi.org/
	 */
	
	import flash.utils.Dictionary;
	import org.flashapi.hummingbird.core.IApplicationContext;
	import org.flashapi.hummingbird.core.IMVCObject;
	import org.flashapi.hummingbird.exceptions.NoSuchDefinitionException;
	import org.flashapi.hummingbird.exceptions.SingletonException;
	import org.flashapi.hummingbird.logging.ILogger;
	import org.flashapi.hummingbird.utils.MetadataParser;

	/**
	 * 	The <code>HummingbirdContainer</code> class represents the IoC container
	 * 	of the Hummingbird framework.
	 */
	public class HummingbirdContainer implements IHummingbirdContainer {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>HummingbirdContainer</code> instance.
		 */
		public function HummingbirdContainer() {
			super();
			if (INSTANCE) {
				throw new SingletonException("you must use the getInstance() method to access IHummingbirdContainer instances");
			}
			this.initObj();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Singleton management
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Returns the reference to the <code>IHummingbirdContainer</code> singleton.
		 * 
		 * 	@return	The reference to the <code>IHummingbirdContainer</code> singleton.
		 */
		public static function getInstance():IHummingbirdContainer {
			return HummingbirdContainer.INSTANCE;
		}
		
		/**
		 * 	@private
		 * 	
		 * 	The <code>IHummingbirdContainer</code> singleton.
		 */
		private static const INSTANCE:IHummingbirdContainer = new HummingbirdContainer();
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @inheritDoc
		 */
		public function setApplicationContext(applicationContext:IApplicationContext):void {
			this.initApplicationContext(applicationContext);
		}
		
		/**
		 * @inheritDoc
		 */
		public function clearApplicationContext(applicationContext:IApplicationContext, disposeMvcObjects:Boolean = true):void {
			this.removeApplicationContext(applicationContext, disposeMvcObjects);
		}
		
		/**
		 * @inheritDoc
		 */
		public function doLookup(obj:Object):void {
			_logger.info("Lookup start on: " + obj);
			MetadataParser.parseMetadata(obj, _singletonInstances, _singletonReferences);
		}
		
		/**
		 * @inheritDoc
		 */
		public function getMVCObject(alias:String):IMVCObject {
			var dto:MVCReference =  this.getMVCReference(alias);
			return dto.mvcObject;
		}
		
		/**
		 * @inheritDoc
		 */
		public function removeMVCObject(alias:String):IMVCObject {
			var dto:MVCReference =  this.getMVCReference(alias);
			var obj:IMVCObject = dto.mvcObject;
			dto = null;
			delete _singletonInstances[alias];
			return obj;
		}
		
		/**
		 * @inheritDoc
		 */
		public function hasMVCObject(alias:String):Boolean {
			var hasMVCInstance:Boolean =  _singletonInstances[alias] ? true : false;
			return hasMVCInstance;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Privare properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 	
		 * 	The reference to the Hummingbird logger.
		 */
		private var _logger:ILogger;
		
		/**
		 * 	@private
		 * 	
		 * 	The application context.
		 */
		private var _applicationContext:IApplicationContext;
		
		/**
		 * 	@private
		 * 	
		 * 	The collection of singleton instances registered in this IoC container.
		 */
		private var _singletonInstances:Dictionary;
		
		/**
		 * 	@private
		 * 	
		 * 	The collection of class references registered in this IoC container.
		 */
		private var _singletonReferences:Dictionary;
		
		/**
		 * 	@private
		 * 	
		 * 	The collection of application contexts registered in this IoC container.
		 */
		private var _applicationContextReferences:Vector.<IApplicationContext>;
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 	
		 * 	Initializes the IoC container.
		 */
		private function initObj():void {
			_logger = HummingbirdBase.getLogger();
			_logger.config("Hummingbird container created");
			_singletonReferences = new Dictionary();
			_singletonInstances = new Dictionary();
			_applicationContextReferences = new Vector.<IApplicationContext>();
		}
		
		/**
		 * 	@private
		 * 	
		 * 	Initializes the application context.
		 */
		private function initApplicationContext(applicationContext:IApplicationContext):void {
			_logger.config("Application context initialization on: " + applicationContext);
			_applicationContextReferences.push(applicationContext);
			_logger.config("Application context before()");
			applicationContext.before();
			this.doLookup(applicationContext);
			_logger.config("Application context start()");
			applicationContext.start();
			_logger.config("Application context after()");
			applicationContext.after();
			_logger.config("Application context initialization complete");
		}
		
		/**
		 * 	@private
		 * 	
		 * 	Removes the application context.
		 */
		private function removeApplicationContext(applicationContext:IApplicationContext, disposeMvcObjects:Boolean):void {
			_logger.config("Application context removal on: " + applicationContext);
			_applicationContextReferences.splice(
				_applicationContextReferences.indexOf(applicationContext), 1
			);
			if (disposeMvcObjects) {
				this.deleteMvcObjects(applicationContext);
			}
			_logger.config("Application context remove()");
			applicationContext.remove();
			_logger.config("Application context removal complete");
		}
		
		/**
		 * 	@private
		 * 	
		 * 	Deletes all the MVC objects associated to the specified context.
		 */
		private function deleteMvcObjects(applicationContext:IApplicationContext):void {
			_logger.config("Deleting MVC objects on: " + applicationContext);
			var alias:String;
			var obj:IMVCObject;
			for each (var value:MVCReference in _singletonInstances) {
				if(value.context == applicationContext) {
					delete _singletonReferences[value.typeDefinition];
					obj = value.mvcObject;
					obj.finalize();
					obj = null;
					alias = value.alias;
					value = null;
					delete _singletonInstances[alias];
				}
			}
		}
		
		/**
		 * 	@private
		 * 
		 * 	Returns the registered <code>MVCReference</code> instance for the
		 * 	specified alias.
		 * 
		 * 	@param	alias	The alias associated with a <code>MVCReference</code>
		 * 					object.
		 * 
		 * 	@throws org.flashapi.hummingbird.exceptions.NoSuchDefinitionException
		 * 			Throws a <code>NoSuchDefinitionException</code> exception if the
		 * 			<code>IHummingbirdContainer</code> container is asked for a
		 * 			<code>MVCReference</code> object instance alias for which
		 * 			it cannot find a definition.
		 * 
		 * 	@return	The <code>MVCReference</code> instance with the specified alias.
		 */
		private function getMVCReference(alias:String):MVCReference {
			var dto:MVCReference = _singletonInstances[alias];
			if (dto == null) {
				_logger.warn("The MVC with the alias alias {0} does not exist!", alias);
				throw new NoSuchDefinitionException("the alias '" + alias + "' is invalid. It must not be null or empty.");
			}
			return dto;
		}
	}
}