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
	
	import constants.ViewId;
	import models.IAppModel;
	import org.flashapi.hummingbird.controller.AbstractController;
	import org.flashapi.hummingbird.HummingbirdAS;
	import org.flashapi.hummingbird.view.IView;
	import views.LoggingErrorView;
	import views.LoggingView;
	import views.WelcomeView;
	
	[Qualifier(alias="ViewsController")]
	public final class ViewsController extends AbstractController implements IViewsController {
		
		[Model(alias="AppModel")]
		public var model:IAppModel;
		
		public function setView(viewId:uint):void {
			switch(viewId) {
				case ViewId.WELCOME_VIEW :
					this.createWelcomeView();
					break;
				case ViewId.LOGGING_VIEW :
					this.createLoggingView();
					break;
			}
		}
		
		public function setLoggingState(isLogged:Boolean):void {
			HummingbirdAS.removeFromScene(_loggingView);
			if (isLogged) {
				this.setView(ViewId.WELCOME_VIEW);
				_loggingView.finalize();
				_loggingView = null;
			} else {
				_errorView = HummingbirdAS.getFactory().createView(LoggingErrorView);
				HummingbirdAS.addToScene(_errorView);
			}
		}
		
		public function hideErrorView():void {
			HummingbirdAS.removeFromScene(_errorView);
			_errorView.finalize();
			_errorView = null;
			this.setView(ViewId.LOGGING_VIEW);
		}
		
		private var _loggingView:IView;
		private var _errorView:IView;
		private var _welcomeView:IView;
		
		private function createLoggingView():void {
			if (!_loggingView) {
				_loggingView = HummingbirdAS.getFactory().createView(LoggingView);
			} else {
				LoggingView(_loggingView).reset();
			}
			HummingbirdAS.addToScene(_loggingView);
		}
		
		private function createWelcomeView():void {
			_welcomeView = HummingbirdAS.getFactory().createView(WelcomeView);
			HummingbirdAS.addToScene(_welcomeView);
		}
	}
}