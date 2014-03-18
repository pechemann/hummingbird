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

package org.flashapi.hummingbird {
	
	// -----------------------------------------------------------
	//  HummingbirdAS.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.1, 20/10/2013 16:47
	 *  @see http://www.flashapi.org/
	 */
	
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import org.flashapi.hummingbird.core.HummingbirdBase;
	import org.flashapi.hummingbird.core.HummingbirdContainer;
	import org.flashapi.hummingbird.core.HummingbirdEventDispatcher;
	import org.flashapi.hummingbird.core.HummingbirdVersion;
	import org.flashapi.hummingbird.core.IApplicationContext;
	import org.flashapi.hummingbird.factory.IDefinitionRegistry;
	import org.flashapi.hummingbird.factory.IFactory;
	import org.flashapi.hummingbird.logging.ILogger;
	import org.flashapi.hummingbird.view.IView;
	
	/**
	 * 	The <code>HummingbirdAS</code> class represents the core of the Hummingbird
	 * 	framework for pure ActionScript 3.0 development.
	 */
	public class HummingbirdAS extends HummingbirdBase {
		
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
		 * 	Adds the specified application context to the Hummingbird IoC container.
		 * 
		 * 	@param	applicationContext	The applicationcontext to add to the
		 * 								Hummingbird IoC container.
		 * 	@param	stage				A reference to the Flash Player <code>Stage</code>
		 * 								instance.
		 */
		public static function setApplicationContext(applicationContext:IApplicationContext, stage:Stage = null):void {
			HummingbirdBase.setStage(stage);
			HummingbirdBase.checkStage();
			HummingbirdBase.setApplicationContext(applicationContext);
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
		 * 	Adds the specified view to the scene.
		 * 
		 * 	@param	view	The view to add to the scene.
		 */
		public static function addToScene(view:IView):void {
			HummingbirdBase.getStage().addChild(DisplayObject(view));
		}
		
		/**
		 * 	Returns a boolean value that indicates whether the specified view is
		 * 	added to the scene (<code>true</code>), or not (<code>false</code>).
		 * 
		 * 	@param	view	The view to test.
		 * 
		 * 	@return <code>true</code> whether the specified view is added to the
		 * 			scene; <code>false</code> otherwise.
		 */
		public static function sceneContains(view:IView):Boolean {
			return HummingbirdBase.getStage().contains(DisplayObject(view));
		}
		
		/**
		 * 	Removes the specified view from the scene.
		 * 
		 * 	@param	view	The view to remove from the scene.
		 * 
		 * 	@see #clearScene()
		 */
		public static function removeFromScene(view:IView):void {
			HummingbirdBase.getStage().removeChild(DisplayObject(view));
		}
		
		/**
		 * 	Removes all the views added to the scene.
		 * 
		 * 	@see #removeFromScene()
		 */
		public static function clearScene():void {
			var stg:Stage = HummingbirdBase.getStage();
			if (_fpMajorVersion == -1) {
				_fpMajorVersion = HummingbirdContainer.getInstance().getFlashPlayerMajorVersion();
			} else if (_fpMajorVersion > 9) {
				stg["removeChildren"]();
			} else {
				while (stg.numChildren) {
					stg.removeChildAt(0);
				}
			}
		}
		
		/**
		 * 	Returns a reference to the Flash Player <code>Stage</code> instance.
		 * 	
		 * 	@return The Flash Player <code>Stage</code> instance.
		 */
		public static function getStage():Stage {
			return HummingbirdBase.getStage();
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
		 * 	Stores the major version of the Flash Player that runs the application.
		 */
		private static var _fpMajorVersion:int = -1;
	}
}