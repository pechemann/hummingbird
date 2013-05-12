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
	import events.ModelEvent;
	import flash.text.TextField;
	import models.IAppModel;
	import org.flashapi.hummingbird.view.AbstractSpriteView;
	
	public class HelloWorldScreen extends AbstractSpriteView {
		
		[Model(alias="AppModel")]
		public var model:IAppModel;
		
		[Controller(alias="AppController")]
		public var controller:IAppController;
		
		override protected function onDependencyComplete():void {
			this.initObj();
			this.model.addEventListener(ModelEvent.PROMPT_MESSAGE_CHANGE, this.promptMessageChangeHandler);
		}
		
		private var _textField:TextField;
		
		private function initObj():void {
			_textField = new TextField();
			_textField.x = _textField.y = 10;
			this.addChild(_textField);
		}
		
		private function promptMessageChangeHandler(e:ModelEvent):void {
			_textField.text = this.model.getPromptMessage();
		}
	}
}