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

package views {
	
	import constants.ApplicationState;
	import controllers.IAppController;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import models.IAppModel;
	import org.flashapi.hummingbird.view.AbstractSpriteView;
	import ui.BasicButton;
	
	public class WelcomeScreen extends AbstractSpriteView {
		
		[Model(alias="AppModel")]
		public var model:IAppModel;
		
		[Model(alias="AppController")]
		public var controller:IAppController;
		
		override protected function onDependencyComplete():void {
			this.initObj();
		}
		
		private var _welcomeMessage:TextField;
		private var _btn:BasicButton;
		
		private function initObj():void {
			this.createMessage();
			this.createButton();
		}
		
		private function createMessage():void {
			_welcomeMessage = new TextField();
			_welcomeMessage.x = 95;
			_welcomeMessage.y = 20;
			_welcomeMessage.text = this.model.getWelcomeMessage();
			this.addChild(_welcomeMessage);
		}
		
		private function createButton():void {
			_btn = new BasicButton("Launch Application");
			_btn.x = _btn.y = 55;
			_btn.addEventListener(MouseEvent.CLICK, this.btnClickHandler);
			this.addChild(_btn);
		}
		
		private function btnClickHandler(e:MouseEvent):void {
			this.controller.changeApplicationState(ApplicationState.HOME);
		}
	}
}