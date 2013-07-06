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

package org.flashapi.hummingbird.core {
	
	// -----------------------------------------------------------
	//  HummingbirdContainer.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 28/04/2013 10:36
	 *  @see http://www.flashapi.org/
	 */
	
	import flash.utils.Dictionary;
	import org.flashapi.hummingbird.core.IApplicationContext;
	import org.flashapi.hummingbird.core.IMVCObject;
	import org.flashapi.hummingbird.exceptions.NoSuchDefinitionException;
	import org.flashapi.hummingbird.exceptions.SingletonException;
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
			return INSTANCE;
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
			_applicationContext = applicationContext;
			this.initApplicationContext();
		}
		
		/**
		 * @inheritDoc
		 */
		public function doLookup(obj:Object):void {
			MetadataParser.parseMetadata(obj, _singletonInstances, _singletonReferences);
		}
		
		/**
		 * @inheritDoc
		 */
		public function getMVCObject(alias:String):IMVCObject {
			var obj:IMVCObject =  _singletonInstances[alias];
			if (obj == null) {
				throw new NoSuchDefinitionException("the alias '" + alias + "' is invalid. It must not be null or empty.");
			}
			return obj;
		}
		
		/**
		 * @inheritDoc
		 */
		public function removeMVCObject(alias:String):IMVCObject {
			var obj:IMVCObject = this.getMVCObject(alias);
			delete _singletonInstances[alias];
			return obj;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Privare properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 	
		 * 	The application context.
		 */
		private var _applicationContext:IApplicationContext;
		
		/**
		 * 	@private
		 * 	
		 * 	The collection of singleton instances registererd in this IoC container.
		 */
		private var _singletonInstances:Dictionary;
		
		/**
		 * 	@private
		 * 	
		 * 	The collection of class references registererd in this IoC container.
		 */
		private var _singletonReferences:Dictionary;
		
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
			_singletonReferences = new Dictionary();
			_singletonInstances = new Dictionary();
		}
		
		/**
		 * 	@private
		 * 	
		 * 	Initializes the application context.
		 */
		private function initApplicationContext():void {
			_applicationContext.before();
			this.doLookup(_applicationContext);
			_applicationContext.start();
			_applicationContext.after();
		}
	}
}