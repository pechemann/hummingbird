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

package ui {

	import flash.display.BlendMode;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class BasicButton extends SimpleButton {
		
		public function BasicButton(label:String):void {
			super();
			this.initObj(label);
		}
		
		private static const OVER_COLOR:uint = 0x666666;
		private static const UP_COLOR:uint = 0x222222;
		private static const DOWN_COLOR:uint = 0x999999;
		
		private var _label:String;
		
		private function initObj(label:String):void {
			_label = label;
			this.downState = this.createSprite(BasicButton.DOWN_COLOR);
			this.overState = this.createSprite(BasicButton.OVER_COLOR);
			this.upState =this. createSprite(BasicButton.UP_COLOR);
			this.hitTestState = this.overState;
		}
		
		private function createSprite(color:uint):Sprite {
			var s:Sprite = new Sprite();
			with(s.graphics) {
				beginFill(color);
				drawRoundRect(0, 0, 100, 20, 5, 5);
				endFill();
			}
			var lab:TextField = this.createLabel();
			lab.x = Math.round(s.width * .5 - lab.width * .5);
			lab.y = Math.round(s.height * .5 - lab.height * .5);
			s.addChild(lab);
			return s;
		}
		
		private function createLabel():TextField {
			var tf:TextField = new TextField();
			tf.blendMode = BlendMode.INVERT;
			tf.selectable = false;
			tf.mouseEnabled = false;
			tf.autoSize = TextFieldAutoSize.LEFT;
			tf.text = _label;
			return tf;
		}
	}
}