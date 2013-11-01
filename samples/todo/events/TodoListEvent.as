/////////////////////////////////////////////////////////////////////////////////////
//
//    Simplified BSD License
//    ======================
//    
//    Copyright 2013 Pascal ECHEMANN. All rights reserved.
//    
//    Redistribution and use in source and binary forms, with or without modification,
//    are permitted provided that the following conditions are met:
//    
//    1. Redistributions of source code must retain the above copyright notice, this
//       list of conditions and the following disclaimer. 
//    
//    2. Redistributions in binary form must reproduce the above copyright notice,
//       this list of conditions and the following disclaimer in the documentation
//       and/or other materials provided with the distribution. 
//    
//    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//    ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//    WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//    DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
//    ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//    (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//    ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//    SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//    
//    The views and conclusions contained in the software and documentation are those
//    of the authors and should not be interpreted as representing official policies, 
//    either expressed or implied, of the copyright holders.
//    

package events {
	
	// -----------------------------------------------------------
	//  TodoListEvent.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 31/10/2013 14:37
	 *  @see http://www.flashapi.org/
	 */
	
	import models.dto.Todo;
	import flash.events.Event;
	
	/**
	 * 	The <code>TodoListEvent</code> class represents event objects that are specific
	 * 	to the <code>TodoList</code> control.
	 * 
	 * 	@see ui.display.TodoList
	 */
	public class TodoListEvent extends Event {
		
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
		public function TodoListEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	The data for this todo item.
		 */
		public var item:Todo;
		
		/**
		 * 	The value of the modified field for this todo item before modification.
		 */
		public var oldValue:Object;
		
		/**
		 * 	A <code>Boolean</code> value that indicates whether all the items are
		 * 	"completed" (<code>true</code>), or not (<code>false</code>).
		 * 
		 * 	@default null
		 */
		public var allTodoCompleted:Boolean;
		
		//--------------------------------------------------------------------------
		//
		//  Event types
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Dispatched when the user clicks the "complete all items" icon.
		 */
		public static const TODO_COMPLETE_ALL:String = "todoCompleteAll";
		
		/**
		 * 	Dispatched when the user clicks the "delete item" icon.
		 */
		public static const TODO_DELETE:String = "todoDelete";
		
		/**
		 * 	Dispatched when the user edits an item.
		 */
		public static const TODO_CHANGE:String = "todoChange";
		
		/**
		 * 	Dispatched when the user clicks the "completed item" icon.
		 */
		public static const TODO_STATE_CHANGE:String = "todoStateChange";
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		override public function clone():Event {
			var evt:TodoListEvent = new TodoListEvent(this.type, this.bubbles, this.cancelable);
			evt.item = this.item;
			evt.oldValue = this.oldValue;
			evt.allTodoCompleted = this.allTodoCompleted;
			return evt;
		}
		
		/**
		 * @private
		 */
		override public function toString():String {
			return this.formatToString("TodoListEvent", "type", "bubbles", "cancelable", "item", "oldValue", "allTodoCompleted");
		}
	}
}