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
	
	import controllers.IAppController;
	import flash.text.TextField;
	import models.HomeModel;
	import models.IAppModel;
	import models.IHomeModel;
	import org.flashapi.hummingbird.view.AbstractSpriteView;
	import ui.BasicButton;
	
	public class HomeView extends AbstractSpriteView {
		
		[RegisterClass(type="models.HomeModel")]
		public var homeModelRef:Class = HomeModel;
		
		[Model(alias="AppModel")]
		public var appModel:IAppModel;
		
		[Model(alias="HomeModel")]
		public var homeModel:IHomeModel;
		
		[Controller(alias="AppController")]
		public var controller:IAppController;
		
		override protected function onDependencyComplete():void {
			this.initObj();
		}
		
		private var _message:TextField;
		
		private function initObj():void {
			this.createMessage();
		}
		
		private function createMessage():void {
			_message = new TextField();
			_message.width = 200;
			_message.x = 50;
			_message.y = 20;
			_message.text = this.homeModel.getMessage();
			this.addChild(_message);
		}
	}
}