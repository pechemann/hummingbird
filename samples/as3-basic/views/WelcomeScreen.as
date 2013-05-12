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
	
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import org.flashapi.hummingbird.view.AbstractSpriteView;
	import controllers.IAppController;
	import events.ModelEvent;
	import models.IAppModel;
	
	public class WelcomeScreen extends AbstractSpriteView {
		
		[Model(alias="AppModel")]
		public var model:IAppModel;
		
		[Controller(alias="AppController")]
		public var controller:IAppController;
		
		override protected function onDependencyComplete():void {
			this.initObj();
			this.model.addEventListener(ModelEvent.PROMPT_MESSAGE_CHANGE, this.promptMessageChangeHandler);
			this.model.addEventListener(ModelEvent.NAME_CHANGE, this.nameChangeHandler);
		}
		
		private var _input:TextField;
		private var _textField:TextField;
		
		private function initObj():void {
			_input = new TextField();
			_input.width = 150;
			_input.height = 20;
			_input.border = true;
			_input.x = _input.y = 10;
			_input.type =  TextFieldType.INPUT;
			this.addChild(_input);
			_textField = new TextField();
			_textField.x = 10;
			_textField.y = 35;
			this.addChild(_textField);
			_input.addEventListener(KeyboardEvent.KEY_DOWN, this.keyDownHandler);
			_input.addEventListener(FocusEvent.FOCUS_IN, this.focusInHandler);
		}
		
		private function focusInHandler(e:FocusEvent):void {
			_input.text = "";
		}
		
		private function keyDownHandler(e:KeyboardEvent):void {
			if (e.charCode == 13) {
				this.controller.nameChange(_input.text);
				this.promptMessageChangeHandler(null);
				this.stage.focus = null;
			}
		}
		
		private function promptMessageChangeHandler(e:ModelEvent):void {
			_input.text = this.model.getPromptMessage();
		}
		
		private function nameChangeHandler(e:ModelEvent):void {
			_textField.text = "Hello " + this.model.getName() + "!";
		}
	}
}