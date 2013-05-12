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
	
	[Qualifier(alias="AppModel")]
	public class AppModel extends AbstractModel implements IAppModel{
		
		public function getPromptMessage():String {
			return _promptMessage;
		}
		
		public function setPromptMessage(promptMessage:String):void {
			_promptMessage = promptMessage;
			this.dispatchEvent(new ModelEvent(ModelEvent.PROMPT_MESSAGE_CHANGE));
		}
		
		private var _promptMessage:String;
	}
}