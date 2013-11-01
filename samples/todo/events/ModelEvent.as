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
	 * 	The <code>ModelEvent</code> class represents event objects that are specific
	 * 	to the model of the application. 
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
		 * 						The default value is <code>false</code>.
		 * @param	cancelable	Determines whether the <code>Event</code> object can
		 * 						be canceled. The default values is <code>false</code>.
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
		 * 	Dispatched when the list of items has been initialized.
		 */
		public static const TODO_LIST_INIT:String = "todoListInit";
		
		/**
		 * 	Dispatched when the list of items has changed.
		 */
		public static const TODO_LIST_CHANGE:String = "todoListChange";
		
		/**
		 * 	Dispatched when the type of displayed items has changed.
		 */
		public static const TODO_DISPLAYED_TYPE_CHANGE:String = "todoDisplayedTypeChange";
		
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