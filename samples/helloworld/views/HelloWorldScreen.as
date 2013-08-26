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
	
	/**
	 * 	A basic view to display a prompt message.
	 */
	public class HelloWorldScreen extends AbstractSpriteView {
		
		//--------------------------------------------------------------------------
		//
		//  Public properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	A reference to the default model of your application.
		 */
		[Model(alias="AppModel")]
		public var model:IAppModel;
		
		/**
		 * 	A reference to the default controller of your application.
		 */
		[Controller(alias="AppController")]
		public var controller:IAppController;
		
		//--------------------------------------------------------------------------
		//
		//  Protected methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@inheritDoc
		 */
		override protected function onDependencyComplete():void {
			this.initObj();
			this.model.addEventListener(ModelEvent.PROMPT_MESSAGE_CHANGE, this.promptMessageChangeHandler);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	The text field that displayes the prompt message.
		 */
		private var _textField:TextField;
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Initializes the view.
		 */
		private function initObj():void {
			_textField = new TextField();
			_textField.x = _textField.y = 10;
			this.addChild(_textField);
		}
		
		/**
		 * 	Invoked each time the default model of the application changes due to
		 * 	a modification of the prompt message.
		 */
		private function promptMessageChangeHandler(e:ModelEvent):void {
			_textField.text = this.model.getPromptMessage();
		}
	}
}