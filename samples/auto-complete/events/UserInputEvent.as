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
/////////////////////////////////////////////////////////////////////////////////////

package events {
	
	// -----------------------------------------------------------
	//  UserInputEvent.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 02/11/2013 14:32
	 *  @see http://www.flashapi.org/
	 */
	
	import flash.events.Event;
	
	/**
	 * 	The <code>UserInputEvent</code> class represents event objects that are 
	 * 	specific to the <code>AutoComplete</code> control.
	 * 
	 * 	@see ui.display.AutoComplete
	 */
	public class UserInputEvent extends Event {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Constructor.	Creates a new <code>UserInputEvent</code> instance with 
		 * 					the specified parameters.
		 * 	
		 * @param	type		The type of the event, accessible as <code>Event.type</code>.
		 * @param	bubbles		Determines whether the <code>Event</code> object
		 * 						participates in the bubbling stage of the event flow.
		 * 						The default value is <code>false</code>.
		 * @param	cancelable	Determines whether the <code>Event</code> object can
		 * 						be canceled. The default values is <code>false</code>.
		 */
		public function UserInputEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	The text for this component.
		 */
		public var text:String;
		
		/**
		 * 	The new case mode of the application. A constant of the <code>CaseMode</code>
		 * 	class.
		 * 
		 * 	@see constants.CaseMode
		 */
		public var caseMode:uint;
		
		//--------------------------------------------------------------------------
		//
		//  Event types
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Dispatched when the user types a text in the input field.
		 */
		public static const TEXT_EDIT:String = "textEdit";
		
		/**
		 * 	Dispatched when the user changes the case mode of the application.
		 */
		public static const CASE_MODE_CHANGE:String = "caseModeChange";
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		override public function clone():Event {
			var evt:UserInputEvent = new UserInputEvent(this.type, this.bubbles, this.cancelable);
			evt.text = this.text;
			evt.caseMode = this.caseMode;
			return evt;
		}
		
		/**
		 * @private
		 */
		override public function toString():String {
			return this.formatToString("UserInputEvent", "type", "bubbles", "cancelable", "text", "caseMode");
		}
	}
}