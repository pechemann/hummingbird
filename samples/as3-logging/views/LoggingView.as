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
	import controllers.IViewsController;
	import events.ModelEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import models.IAppModel;
	import org.flashapi.hummingbird.view.AbstractSpriteView;
	import ui.BasicButton;
	
	public class LoggingView extends AbstractSpriteView {
		
		[Model(alias="AppModel")]
		public var model:IAppModel;
		
		[Controller(alias="AppController")]
		public var appController:IAppController;
		
		[Controller(alias="ViewsController")]
		public var viewsController:IViewsController;
		
		public function reset():void {
			_logging.text = _password.text = "";
		}
		
		override public function finalize():void {
			this.model.removeEventListener(ModelEvent.LOGGIN_SUCCESS, this.logginTransactionHandler);
			this.model.removeEventListener(ModelEvent.LOGGIN_ERROR, this.logginTransactionHandler);
			this.model = null;
			this.appController = null;
			this.viewsController = null;
			this.removeChildren();
			_btn.removeEventListener(MouseEvent.CLICK, this.sendCrendentialsHandler);
			_logging = null;
			_password = null;
			_btn = null;
		}
		
		override protected function onDependencyComplete():void {
			this.initObj();
			this.model.addEventListener(ModelEvent.LOGGIN_SUCCESS, this.logginTransactionHandler);
			this.model.addEventListener(ModelEvent.LOGGIN_ERROR, this.logginTransactionHandler);
		}
		
		private var _logging:TextField;
		private var _password:TextField;
		private var _btn:BasicButton;
		
		private function initObj():void {
			this.createTextInputs();
			this.createLogButton();
		}
		
		private function createTextInputs():void {
			_logging = this.createInput("Loggin:", 10);
			_password = this.createInput("Password:", 35);
			_password.displayAsPassword = true;
		}
		
		private function createInput(label:String, yPos:Number):TextField {
			var labelField:TextField = new TextField();
			labelField.width = 100;
			labelField.text = label;
			labelField.x = 10;
			labelField.y = yPos;
			this.addChild(labelField);
			var tf:TextField = new TextField();
			tf.width = 150;
			tf.height = 20;
			tf.border = true;
			tf.type = TextFieldType.INPUT;
			tf.x = 110;
			tf.y = yPos;
			this.addChild(tf);
			return tf;
		}
		
		private function createLogButton():void {
			_btn = new BasicButton("Loggin");
			_btn.x = 110;
			_btn.y = 60;
			_btn.addEventListener(MouseEvent.CLICK, this.sendCrendentialsHandler);
			this.addChild(_btn);
		}
		
		private function sendCrendentialsHandler(e:MouseEvent):void {
			this.appController.setCredentials(_logging.text, _password.text);
		}
		
		private function logginTransactionHandler(e:ModelEvent):void {
			var isLogged:Boolean = e.type == ModelEvent.LOGGIN_SUCCESS;
			this.viewsController.setLoggingState(isLogged);
		}
	}
}