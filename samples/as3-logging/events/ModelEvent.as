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

package events {
	
	import flash.events.Event;
	
	public class ModelEvent extends Event {
		
		public function ModelEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
		}
		
		public static const LOGGIN_SUCCESS:String = "logginSuccess";
		
		public static const LOGGIN_ERROR:String = "logginError";
		
		override public function clone():Event {
			return new ModelEvent(this.type, this.bubbles, this.cancelable);
		}
		
		override public function toString():String {
			return this.formatToString("ModelEvent", "type", "bubbles", "cancelable");
		}
	}
}