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
	
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import models.IAppModel;
	import org.flashapi.hummingbird.view.AbstractSpriteView;
	
	public class WelcomeView extends AbstractSpriteView {
		
		[Model(alias="AppModel")]
		public var model:IAppModel;
		
		override protected function onDependencyComplete():void {
			this.initObj();
		}
		
		private var _message:TextField;
		
		private function initObj():void {
			var _message:TextField = new TextField();
			_message.autoSize = TextFieldAutoSize.LEFT;
			_message.text = "You are logged as " + this.model.getLogging() + "!";
			_message.x = 50;
			_message.y = 10;
			this.addChild(_message);
		}
	}
}