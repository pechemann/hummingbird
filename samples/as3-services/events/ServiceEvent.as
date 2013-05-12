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
	
	public class ServiceEvent extends Event {
		
		public function ServiceEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
		}
		
		public static const TRANSACTION_SUCCESS:String = "transactionSuccess";
		
		public static const TRANSACTION_ERROR:String = "transactionError";
		
		override public function clone():Event {
			return new ServiceEvent(this.type, this.bubbles, this.cancelable);
		}
		
		override public function toString():String {
			return this.formatToString("ServiceEvent", "type", "bubbles", "cancelable");
		}
	}
}