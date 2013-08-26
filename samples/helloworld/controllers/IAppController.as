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

package controllers {
	
	import org.flashapi.hummingbird.controller.IController;
	
	/**
	 * 	The <code>IAppController</code> interface represents the facade for the default 
	 * 	controller of your application.
	 */
	public interface IAppController extends IController {
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Changes the message displayed by the <code>HelloWorldScreen</code> view.
		 */
		function sayHello():void;
	}
}