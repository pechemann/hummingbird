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
	
	public class ResultEvent extends Event {
		
		public function ResultEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
		}
		
		public static const RESULT:String = "result";
		
		public static const FAULT:String = "fault";
		
		public var data:String;
		
		override public function clone():Event {
			return new ResultEvent(this.type, this.bubbles, this.cancelable);
		}
		
		override public function toString():String {
			return this.formatToString("ResultEvent", "type", "bubbles", "cancelable", "data");
		}
	}
}