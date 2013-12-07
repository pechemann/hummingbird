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

package org.flashapi.hummingbird {
	
	// -----------------------------------------------------------
	//  HummingbirdFXMobile.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 24/11/2013 12:42
	 *  @see http://www.flashapi.org/
	 */
	
	import mx.core.FlexGlobals;
	import org.flashapi.hummingbird.core.HummingbirdBase;
	import org.flashapi.hummingbird.core.HummingbirdEventDispatcher;
	import org.flashapi.hummingbird.core.HummingbirdVersion;
	import org.flashapi.hummingbird.core.IApplicationContext;
	import org.flashapi.hummingbird.factory.IDefinitionRegistry;
	import org.flashapi.hummingbird.factory.IFactory;
	import org.flashapi.hummingbird.logging.ILogger;
	import org.flashapi.hummingbird.mobile.IMobileMediator;
	import spark.components.Application;
	
	/**
	 * 	The <code>HummingbirdFXMobile</code> class represents the core of the Hummingbird
	 * 	framework for development of mobile applications with the Flex framework.
	 */
	public class HummingbirdFXMobile extends HummingbirdBase {
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Returns the mediator object for the current Flex Mobile Application.
		 * 	
		 * @return	A <code>IMobileMediator</code> instance.
		 */
		public static function getMediator():Object {
			return _mediator;
		}
		
		/**
		 * 	Defines the mediator object for the current Flex Mobile Application.
		 * 
		 * 	@param mediator The mediator object used to work with the current
		 * 					Flex Mobile Application.
		 * 	
		 * 	@return	A reference to the <code>HummingbirdFXMobile</code> class that
		 * 			can be used for chaining methods.
		 */
		public static function setMediator(mediator:IMobileMediator):Class {
			_mediator = mediator;
			return HummingbirdFXMobile;
		}
		
		/**
		 * 	Returns the reference to the Hummingbird framework internal logger.
		 * 
		 * 	@return The Hummingbird framework internal logger.
		 */
		public static function getLogger():ILogger {
			return HummingbirdBase.getLogger();
		}
		
		/**
		 * 	Adds the specified application context to the Hummingbird IoC container.
		 * 
		 * 	@param	applicationContext	The applicationcontext to add to the
		 * 								Hummingbird IoC container.
		 * 	@param	application			A reference to the Flex <code>Application</code>
		 * 								instance.
		 * 
		 * 	
		 * 	@return	A reference to the <code>HummingbirdFXMobile</code> class that
		 * 			can be used for chaining methods.
		 */
		public static function setApplicationContext(applicationContext:IApplicationContext):Class {
			HummingbirdBase.setApplicationContext(applicationContext);
			return HummingbirdFXMobile;
		}
		
		/**
		 * 	Clears and removes the specified context from the Hummingbird IoC
		 * 	container.
		 * 
		 * 	@param	applicationContext	The applicationcontext to remove from the
		 * 								Hummingbird IoC container.
		 * 	@param	disposeMvcObjects	Indicates whether the IoC container must
		 * 								delete all the references of the MVC objects
		 * 								associated to the specified context (<code>true</code>),
		 * 								or not (<code>true</code>). The default value
		 * 								is <code>true</code>.
		 */
		public static function clearApplicationContext(applicationContext:IApplicationContext, disposeMvcObjects:Boolean = true):void {
			HummingbirdBase.clearApplicationContext(applicationContext, disposeMvcObjects);
		}
		
		/**
		 * 	Returns a reference to the <code>Application</code> instance.
		 * 	
		 * 	@return The <code>Application</code> instance.
		 */
		public static function getApplication():Application {
			return Application(FlexGlobals.topLevelApplication);
		}
		
		/**
		 * 	Returns a reference to the <code>IFactory</code> instance associated
		 * 	with the Hummingbird IoC container.
		 * 	
		 * 	@return The <code>IFactory</code> instance associated with the
		 * 			Hummingbird IoC container.
		 */
		public static function getFactory():IFactory {
			return HummingbirdBase.getFactory();
		}
		
		/**
		 * 	Returns a reference to the <code>IDefinitionRegistry</code> instance 
		 * 	associated with the Hummingbird IoC container.
		 * 	
		 * 	@return The <code>IDefinitionRegistry</code> instance associated with 
		 * 			the Hummingbird IoC container.
		 */
		public static function getDefinitionRegistry():IDefinitionRegistry {
			return HummingbirdBase.getDefinitionRegistry();
		}
		
		/**
		 * 	Returns the object that exposes the current Hummingbird version.
		 * 
		 * 	@return	The object that exposes the current Hummingbird version.
		 */
		public static function getVersion():HummingbirdVersion {
			return HummingbirdBase.getVersion();
		}
		
		/**
		 * 	Returns the Hummingbird event dispatcher singleton.
		 * 
		 * 	@return	The Hummingbird event dispatcher singleton.
		 */
		public static function getEventDispatcher():HummingbirdEventDispatcher {
			return HummingbirdBase.getEventDispatcher();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	The reference to the mediator object for the current Flex Mobile
		 * 	Application.
		 */
		private static var _mediator:IMobileMediator;
	}
}