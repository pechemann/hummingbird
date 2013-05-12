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
	public class AppModel extends AbstractModel implements IAppModel {
		
		public function getLogging():String {
			return _logging;
		}
		
		public function setLogging(logging:String):void {
			if (logging) {
				_logging = logging;
				this.dispatchEvent(new ModelEvent(ModelEvent.LOGGIN_SUCCESS));
			} else {
				this.dispatchEvent(new ModelEvent(ModelEvent.LOGGIN_ERROR));
			}
		}
		
		private var _logging:String;
	}
}