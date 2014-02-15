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
	//  ServiceEvent.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.2, 26/05/2013 12:14
	 *  @see http://www.flashapi.org/
	 */
	
	import flash.events.Event;
	
	/**
	 * 	The <code>ServiceEvent</code> class defines built-in events that can be 
	 * 	dispatched by <code>IService</code> objects.
	 */
	public class ServiceEvent extends Event {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>ServiceEvent</code> instance.
		 * 
		 * 	@param	type		The type of the event, accessible as <code>Event.type</code>.
		 * 	@param	bubbles		Determines whether the <code>DependencyEvent</code>
		 * 						object participates in the bubbling stage of the event
		 * 						flow. The default value is <code>false</code>.
		 * 	@param	cancelable	Determines whether the <code>DependencyEvent</code>
		 * 						object can be canceled. The default values is
		 * 						<code>false</code>.
		 */
		public function ServiceEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	The <code>data</code> property lets you pass a value to the event.
		 * 
		 * 	@default null
		 */
		public var data:Object;
		
		/**
		 * 	The <code>message</code> property allows you to pass an information message
		 * 	to the event.
		 * 
		 * 	@default null
		 */
		public var message:String;
		
		/**
		 * 	A convenient property to specify the identifier of the operation, defined
		 * 	by the service (usually a Web service), responsible for dispatching this
		 * 	event.
		 * 
		 * 	@default null
		 */
		public var operationId:Object;
		
		/**
		 * 	The <code>error</code> property allows you to pass error information,
		 * 	returned by a remote servic,e to the event.
		 * 
		 * 	@default null
		 */
		public var error:Object;
		
		//--------------------------------------------------------------------------
		//
		//  Event Types
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Defines the value of the type property of the <code>transactionSuccess</code>
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
		 *  @eventType transactionSuccess
		 */
		public static const TRANSACTION_SUCCESS:String = "transactionSuccess";
		
		/**
		 * 	Defines the value of the type property of the <code>transactionError</code>
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
		 *  @eventType transactionError
		 */
		public static const TRANSACTION_ERROR:String = "transactionError";
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 */
		override public function clone():Event {
			var evt:ServiceEvent =  new ServiceEvent(this.type, this.bubbles, this.cancelable);
			evt.data = this.data;
			evt.message = this.message;
			evt.error = this.error;
			evt.operationId = this.operationId;
			return evt;
		}
		
		/**
		 * 	@private
		 */
		override public function toString():String {
			return this.formatToString("ServiceEvent", "type", "bubbles", "cancelable",
				"data",
				"message",
				"operationId",
				"error"
			);
		}
	}
}