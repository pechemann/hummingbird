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
	
	import constants.ApplicationState;
	import events.ModelEvent;
	import models.IAppModel;
	import org.flashapi.hummingbird.controller.AbstractController;
	import org.flashapi.hummingbird.HummingbirdFX;
	import org.flashapi.hummingbird.view.IView;
	import views.HomeView;
	import views.WelcomeScreen;
	
	[Qualifier(alias="ViewsController")]
	public final class ViewsController extends AbstractController implements IViewsController {
		
		[Model(alias="AppModel")]
		public var model:IAppModel;
		
		public function initApplication():void {
			this.model.addEventListener(ModelEvent.APPLICATION_STATE_CHANGE, this.applicationStateChangeHandler);
			this.model.setApplicationState(ApplicationState.WELCOME);
		}
		
		private var _currentView:IView;
		
		private function applicationStateChangeHandler(e:ModelEvent):void {
			if (_currentView) {
				HummingbirdFX.removeFromScene(_currentView);
				//_currentView.finalize();
			}
			
			switch(this.model.getApplicationState()) {
				case ApplicationState.WELCOME :
					_currentView = HummingbirdFX.getFactory().createView(WelcomeScreen);
					break;
				case ApplicationState.HOME :
					_currentView = HummingbirdFX.getFactory().createView(HomeView);
					break;
			}
			
			HummingbirdFX.addToScene(_currentView);
		}
	}
}