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
	
	import constants.GameState;
	import constants.ViewId;
	import models.IAppModel;
	import org.flashapi.hummingbird.controller.AbstractController;
	import org.flashapi.hummingbird.Hummingbird;
	import views.IGameView;
	import views.InGameView;
	import views.WelcomeView;
	
	[Qualifier(alias="ViewsController")]
	public final class ViewsController extends AbstractController implements IViewsController {
		
		[Model(alias="AppModel")]
		public var model:IAppModel;
		
		public function setView(viewId:uint):void {
			Hummingbird.clearScene();
			if (_currentView) _currentView.freeze();
			switch(viewId) {
				case ViewId.WELCOME_VIEW :
					_currentView = this.displayWelcomeView();
					break;
				case ViewId.IN_GAME_VIEW :
					_currentView = this.displayInGameView();
					this.model.setState(GameState.PAUSED);
					break;
			}
			Hummingbird.addToScene(_currentView);
			_currentView.initialize();
		}
		
		private var _currentView:IGameView;
		private var _welcomeView:IGameView;
		private var _inGameView:IGameView;
		
		private function displayWelcomeView():IGameView {
			if (_welcomeView == null) {
				_welcomeView = this.createView(WelcomeView);
			}
			return _welcomeView;
		}
		
		private function displayInGameView():IGameView {
			if (_inGameView == null) {
				_inGameView = this.createView(InGameView);
			}
			return _inGameView;
		}
		
		private function createView(ViewRef:Class):IGameView {
			return Hummingbird.getFactory().createView(ViewRef) as IGameView;
		}
	}
}