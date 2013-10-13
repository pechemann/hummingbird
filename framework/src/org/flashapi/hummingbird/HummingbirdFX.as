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
	//  HummingbirdFX.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 06/05/2013 18:13
	 *  @see http://www.flashapi.org/
	 */
	
	import org.flashapi.hummingbird.core.HummingbirdBase;
	import org.flashapi.hummingbird.core.HummingbirdVersion;
	import org.flashapi.hummingbird.core.IApplicationContext;
	import org.flashapi.hummingbird.factory.IDefinitionRegistry;
	import org.flashapi.hummingbird.factory.IFactory;
	import org.flashapi.hummingbird.logging.ILogger;
	import org.flashapi.hummingbird.view.IFlexView;
	import org.flashapi.hummingbird.view.IView;
	import spark.components.Application;
	
	/**
	 * 	The <code>HummingbirdFX</code> class represents the core of the Hummingbird
	 * 	framework for Flex development.
	 * 
	 * 	<b>[This class still is under development.]</b>
	 */
	public class HummingbirdFX extends HummingbirdBase {
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Returns the reference to the Hummingbird framework internal logger.
		 * 
		 * 	@return The Hummingbird framework internal logger.
		 */
		public static function getLogger():ILogger {
			return HummingbirdBase.getLogger();
		}
		
		/**
		 * 	Adds the application context to the Hummingbird IoC container.
		 * 
		 * 	@param	applicationContext	The applicationcontext to add to the
		 * 								Hummingbird IoC container.
		 * 	@param	application			A reference to the Flex <code>Application</code>
		 * 								instance.
		 */
		public static function setApplicationContext(applicationContext:IApplicationContext, application:Application):void {
			HummingbirdFX._application = application;
			HummingbirdBase.setApplicationContext(applicationContext);
		}
		
		/**
		 * 	Adds the specified view to the scene.
		 * 
		 * 	@param	view	The view to add to the scene.
		 */
		public static function addToScene(view:IView):void {
			HummingbirdFX._application.addElement(IFlexView(view));
		}
		
		/**
		 * 	Removes the specified view from the scene.
		 * 
		 * 	@param	view	The view to remove from the scene.
		 * 
		 * 	@see #clearScene()
		 */
		public static function removeFromScene(view:IView):void {
			HummingbirdFX._application.removeElement(IFlexView(view));
		}
		
		/**
		 * 	Removes all the views added to the scene.
		 * 
		 * 	@see #removeFromScene()
		 */
		public static function clearScene():void {
			while (HummingbirdFX._application.numElements > 0) {
				HummingbirdFX._application.removeElementAt(0);
			}
		}
		
		/**
		 * 	Returns a reference to the Flash Player <code>Stage</code> instance.
		 * 	
		 * 	@return The Flash Player <code>Stage</code> instance.
		 */
		public static function getApplication():Application {
			return HummingbirdFX._application;
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
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	The reference to the Flex <code>Application</code> instance.
		 */
		private static var _application:Application;
	}
}