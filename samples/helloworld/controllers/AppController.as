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
	
	import org.flashapi.hummingbird.controller.AbstractController;
	import models.IAppModel;
	
	/**
	 * 	The <code>AppController</code> class represents the default controller of 
	 * 	your application.
	 */
	[Qualifier(alias="AppController")]
	public final class AppController extends AbstractController implements IAppController {
		
		//--------------------------------------------------------------------------
		//
		//  Public properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	A reference to the default model of your application.
		 */
		[Model(alias="AppModel")]
		public var model:IAppModel;
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@inheritDoc
		 */
		public function sayHello():void {
			this.model.setPromptMessage("Hello World!");
		}
	}
}