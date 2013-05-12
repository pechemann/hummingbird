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
	import org.flashapi.hummingbird.HummingbirdAS;
	import models.IAppModel;
	import views.WelcomeScreen;
	
	[Qualifier(alias="ViewsController")]
	public final class ViewsController extends AbstractController implements IViewsController {
		
		[Model(alias="AppModel")]
		public var model:IAppModel;
		
		public function initApplication():void {
			HummingbirdAS.addToScene(
				HummingbirdAS.getFactory().createView(WelcomeScreen)
			);
			this.model.setPromptMessage("Type your name here:");
		}
	}
}