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
	//  Hummingbird.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 28/04/2013 10:36
	 *  @see http://www.flashapi.org/
	 */
	
	import flash.display.Stage;
	import org.flashapi.hummingbird.core.HummingbirdBase;
	import org.flashapi.hummingbird.core.HummingbirdVersion;
	import org.flashapi.hummingbird.core.IApplicationContext;
	import org.flashapi.hummingbird.events.StarlingDependencyEvent;
	import org.flashapi.hummingbird.factory.IDefinitionRegistry;
	import org.flashapi.hummingbird.factory.IFactory;
	import org.flashapi.hummingbird.starling.StarlingProperties;
	import org.flashapi.hummingbird.utils.MetadataParser;
	import org.flashapi.hummingbird.view.IView;
	import org.flashapi.hummingbird.view.RootDisplayObject;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	/**
	 * 	The <code>Hummingbird</code> class represents the core of the Hummingbird
	 * 	framework for Starling-framework-based applications development.
	 */
	public class Hummingbird extends HummingbirdBase {
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Adds the application context to the Hummingbird IoC container.
		 * 
		 * 	@param	applicationContext	The applicationcontext to add to the
		 * 								Hummingbird IoC container.
		 * 	@param	stage				A reference to the Flash Player <code>Stage</code>
		 * 								instance.
		 * 	@param	properties			An object that contains properties for initializing
		 * 								the built-in <code>Starling</code> instance.
		 */
		public static function setApplicationContext(
												applicationContext:IApplicationContext,
												stage:Stage,
												properties:StarlingProperties = null):void {
			Hummingbird._tempAppContext = applicationContext;
			HummingbirdBase.setStage(stage);
			Hummingbird.initStarling(properties);
		}
		
		/**
		 * 	Adds the specified view to the scene.
		 * 
		 * 	@param	view	The view to add to the scene.
		 */
		public static function addToScene(view:IView):void {
			Hummingbird._rootClass.addChild(DisplayObject(view));
		}
		
		/**
		 * 	Removes the specified view from the scene.
		 * 
		 * 	@param	view	The view to remove from the scene.
		 * 
		 * 	@see #clearScene()
		 */
		public static function removeFromScene(view:IView):void {
			Hummingbird._rootClass.removeChild(DisplayObject(view));
		}
		
		/**
		 * 	Removes all the views added to the scene.
		 * 
		 * 	@see #removeFromScene()
		 */
		public static function clearScene():void {
			Hummingbird._rootClass.removeChildren();
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
		 * 	Returns a reference to the <code>Starling</code> instance associated
		 * 	with the Hummingbird IoC container.
		 * 	
		 * 	@return The <code>Starling</code> instance associated with the
		 * 			Hummingbird IoC container.
		 */
		public static function getStarling():Starling {
			return Hummingbird._starling;
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
		 * 	The reference to the <code>Starling</code> instance.
		 */
		private static var _starling:Starling;
		
		/**
		 * 	@private
		 * 
		 * 	The reference to the <code>Starling</code> instance.
		 */
		private static var _rootClass:RootDisplayObject;
		
		/**
		 * 	@private
		 * 
		 * 	A temporary reference to the <code>IApplicationContext</code> instance.
		 */
		private static var _tempAppContext:IApplicationContext;
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	Initializes the Hummingbird framework the built-in <code>Starling</code>
		 * 	instance.
		 * 
		 * 	@param	properties			An object that contains properties for initializing
		 * 								the built-in <code>Starling</code> instance.
		 */
		private static function initStarling(properties:StarlingProperties):void {
			MetadataParser.setStarlingEventRef(StarlingDependencyEvent);
			if (properties) {
				Hummingbird._starling = new Starling(RootDisplayObject, HummingbirdBase.getStage(),
					properties.viewPort,
					properties.stage3D,
					properties.renderMode,
					properties.profile
				);
				with (Hummingbird._starling) {
					antiAliasing = properties.antiAliasing;
					enableErrorChecking = properties.enableErrorChecking;
					handleLostContext = properties.handleLostContext;
					multitouchEnabled = properties.multitouchEnabled;
					simulateMultitouch = properties.simulateMultitouch;
					shareContext = properties.shareContext;
					antiAliasing = properties.antiAliasing;
					showStats = properties.showStats;
				}
			} else {
				Hummingbird._starling = new Starling(RootDisplayObject, HummingbirdBase.getStage());
			}
			Hummingbird._starling.addEventListener(Event.ROOT_CREATED, Hummingbird.rootCreatedHandler);
		}
		
		/**
		 * 	@private
		 * 
		 * 	Invoked when the Starling root class is added to the stage.
		 * 
		 * 	@param	e	The reference to the triggered event.
		 */
		private static function rootCreatedHandler(e:Event):void {
			Hummingbird._starling.removeEventListener(Event.ROOT_CREATED, Hummingbird.rootCreatedHandler);
			Hummingbird._rootClass = Hummingbird._starling.root as RootDisplayObject;
			HummingbirdBase.setApplicationContext(Hummingbird._tempAppContext);
			Hummingbird._tempAppContext = null;
		}
	}
}