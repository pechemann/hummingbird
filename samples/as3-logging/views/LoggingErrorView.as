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
	
	import controllers.IViewsController;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import org.flashapi.hummingbird.view.AbstractSpriteView;
	import ui.BasicButton;
	
	public class LoggingErrorView extends AbstractSpriteView {
		
		[Controller(alias="ViewsController")]
		public var viewsController:IViewsController;
		
		override public function finalize():void {
			this.removeChildren();
			_btn.removeEventListener(MouseEvent.CLICK, this.validateHandler);
			_message = null;
			_btn = null;
			this.viewsController = null;
		}
		
		override protected function onDependencyComplete():void {
			this.initObj();
		}
		
		private var _message:TextField;
		private var _btn:BasicButton;
		
		private function initObj():void {
			this.createMessage();
			this.createButton();
		}
		
		private function createMessage():void {
			_message = new TextField();
			_message.width = 150;
			_message.text = "Wrong loggin or password!";
			_message.x = 50;
			_message.y = 10;
			this.addChild(_message);
		}
		
		private function createButton():void {
			_btn = new BasicButton("Ok");
			_btn.x = 50;
			_btn.y = 35;
			_btn.addEventListener(MouseEvent.CLICK, this.validateHandler);
			this.addChild(_btn);
		}
		
		private function validateHandler(e:MouseEvent):void {
			this.viewsController.hideErrorView();
		}
	}
}