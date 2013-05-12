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
	
	import constants.ApplicationState;
	import events.ModelEvent;
	import org.flashapi.hummingbird.model.AbstractModel;
	
	[Qualifier(alias="AppModel")]
	public class AppModel extends AbstractModel implements IAppModel{
		
		public function getWelcomeMessage():String {
			return "Hello World!";
		}
		
		public function getApplicationState():uint {
			return _applicationState;
		}
		
		public function setApplicationState(applicationState:uint):void {
			_applicationState = applicationState;
			this.dispatchEvent(new ModelEvent(ModelEvent.APPLICATION_STATE_CHANGE));
		}
		
		private var _applicationState:uint = ApplicationState.INIT;
	}
}