/////////////////////////////////////////////////////////////////////////////////////
//
//    Simplified BSD License
//    ======================
//    
//    Copyright 2013-2014 Pascal ECHEMANN. All rights reserved.
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

package org.flashapi.hummingbird.events {
	
	// -----------------------------------------------------------
	//  StarlingContextEvent.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 26/10/2013 22:27
	 *  @see http://www.flashapi.org/
	 */
	
	import flash.events.Event;
	
	/**
	 * 	The <code>StarlingContextEvent</code> class defines events that are associated
	 * 	with the context creation in the Staling-based Hummingbird framework. 
	 */
	public class StarlingContextEvent extends Event {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>StarlingDependencyEvent</code> instance.
		 * 
		 * 	@param	type	The type of the event, accessible as <code>Event.type</code>.
		 * 	@param	bubbles	Determines whether the <code>StarlingContextEvent</code>
		 * 					object participates in the bubbling stage of the event
		 * 					flow. The default value is <code>false</code>.
		 * 	@param	data	Arbitrary data that is attached to the event. The
		 * 					default values is <code>null</code>.
		 */
		public function StarlingContextEvent(type:String, bubbles:Boolean = false, data:Object = null) {
			super(type, bubbles, data);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event Types
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Defines the value of the type property of the <code>rootCreationComplete</code>
		 * 	event object.
		 * 
		 *  <p>The properties of the event object have the following values:</p>
		 *  <table class="innertable">
		 *     <tr><th>Property</th><th>Value</th></tr>
		 *     <tr><td><code>bubbles</code></td><td>false</td></tr>
		 *     <tr><td><code>cancelable</code></td><td>false</td></tr>
		 *     <tr><td><code>currentTarget</code></td><td>The Object that defines the
		 *       event listener that handles the event. For example, if you use
		 *       <code>myButton.addEventListener()</code> to register an event listener,
		 *       myButton is the value of the <code>currentTarget</code>. </td></tr>
		 *     <tr><td><code>target</code></td><td>The Object that dispatched the event;
		 *       it is not always the Object listening for the event.
		 *       Use the <code>currentTarget</code> property to always access the
		 *       Object listening for the event.</td></tr>
		 *  </table>
		 *
		 *  @eventType rootCreationComplete
		 */
		public static const ROOT_CREATION_COMPLETE:String = "rootCreationComplete";
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 */
		override public function clone():Event {
			return new StarlingContextEvent(this.type, this.bubbles, this.cancelable);
		}
		
		/**
		 * 	@private
		 */
		override public function toString():String {
			return this.formatToString("StarlingContextEvent", "type", "bubbles", "cancelable");
		}
	}
}