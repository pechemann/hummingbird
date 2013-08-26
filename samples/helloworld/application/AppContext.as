/////////////////////////////////////////////////////////////////////////////////////
//
//    Hummingbird Framework Template
//    ==============================
//    
//    Copyright 2013 Pascal ECHEMANN.
//    All Rights Reserved.
//    
//    NOTICE: The author permits you to use, modify, and distribute this file
//    in accordance with the terms of the license agreement accompanying it.
//    
/////////////////////////////////////////////////////////////////////////////////////

package application {
	
	import controllers.IAppController;
	import org.flashapi.hummingbird.core.AbstractApplicationContext;
	import org.flashapi.hummingbird.HummingbirdAS;
	import org.flashapi.hummingbird.view.IView;
	import views.HelloWorldScreen;
	
	/**
	 * 	The <code>AppContext</code> class is the starting of the MVC process in the
	 * 	Hummingbird Framework.
	 */
	public class AppContext extends AbstractApplicationContext {
		
		//--------------------------------------------------------------------------
		//
		//  Dependencies includes
		//
		//--------------------------------------------------------------------------
		
		include "dependencies.as"
		
		//--------------------------------------------------------------------------
		//
		//  Public properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	A reference to the default controller of your application.
		 */
		[Controller(alias="AppController")]
		public var controller:IAppController;
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@inheritDoc
		 */
		override public function start():void {
			var view:IView = HummingbirdAS.getFactory().createView(HelloWorldScreen);
			HummingbirdAS.addToScene(view);
			this.controller.sayHello();
		}
	}
}