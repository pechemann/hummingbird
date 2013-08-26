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

package models {
	
	import org.flashapi.hummingbird.model.AbstractModel;
	import events.ModelEvent;
	
	/**
	 * 	The <code>AppModel</code> class represents the default model of your
	 * 	application.
	 */
	[Qualifier(alias="AppModel")]
	public class AppModel extends AbstractModel implements IAppModel{
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@inheritDoc
		 */
		public function getPromptMessage():String {
			return _promptMessage;
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function setPromptMessage(promptMessage:String):void {
			_promptMessage = promptMessage;
			this.dispatchEvent(new ModelEvent(ModelEvent.PROMPT_MESSAGE_CHANGE));
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Internal storage for the application prompt message.
		 */
		private var _promptMessage:String;
	}
}