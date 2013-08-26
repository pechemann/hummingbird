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
	
	/**
	 * 	A default convenient event class for dispatching model events.
	 */
	public class ModelEvent extends Event {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Constructor.	Creates a new <code>ModelEvent</code> instance with the
		 * 					specified parameters.
		 * 	
		 * @param	type		The type of the event, accessible as <code>Event.type</code>.
		 * @param	bubbles		Determines whether the <code>Event</code> object
		 * 						participates in the bubbling stage of the event flow.
		 * 						The default value is <codefalse</code>.
		 * @param	cancelable	Determines whether the <code>Event</code> object can
		 * 						be canceled. The default values is <codefalse</code>.
		 */
		public function ModelEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event types
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	The<code>ModelEvent.PROMPT_MESSAGE_CHANGE</code> constant defines the
		 * 	value of the type property of a <code>promptMessageChange</code> event
		 * 	object.
		 */
		public static const PROMPT_MESSAGE_CHANGE:String = "promptMessageChange";
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		override public function clone():Event {
			return new ModelEvent(this.type, this.bubbles, this.cancelable);
		}
		
		/**
		 * @private
		 */
		override public function toString():String {
			return this.formatToString("ModelEvent", "type", "bubbles", "cancelable");
		}
	}
}