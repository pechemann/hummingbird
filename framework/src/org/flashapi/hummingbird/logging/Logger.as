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

package org.flashapi.hummingbird.logging {
	
	// -----------------------------------------------------------
	//  Logger.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 06/10/2013 16:35
	 *  @see http://www.flashapi.org/
	 */
	
	import flash.events.EventDispatcher;
	
	/**
	 * 	Default implementation of the <code>ILogger</code> interface. The
	 * 	<code>Logger</code> class represents the logger that is used within the
	 * 	Hummingbird framework. This class dispatches events for each message
	 * 	logged using the methods defined by the <code>ILogger</code> interface.
	 */
	public class Logger extends EventDispatcher implements ILogger {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>Logger</code> instance.
		 */
		public function Logger() {
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  @inheritDoc
		 */
		public function config(message:String, ... rest):void {
			this.createLog(LogLevel.CONFIG, message, rest);
		}
		
		/**
		 *  @inheritDoc
		 */
		public function fatal(message:String, ... rest):void {
			this.createLog(LogLevel.FATAL, message, rest);
		}
		
		/**
		 *  @inheritDoc
		 */
		public function info(message:String, ... rest):void {
			this.createLog(LogLevel.INFO, message, rest);
		}
		
		/**
		 *  @inheritDoc
		 */
		public function warn(message:String, ... rest):void {
			this.createLog(LogLevel.WARN, message, rest);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	Creates a log from the specified <code>message</code> and <code>level</code>
		 * 	properties.
		 * 
		 * 	@param level	The granularity level of the data to log. A constant
		 * 					of the <code>LogLevel</code> class.
		 * 	@param message 	The information to log.
		 * 	@param rest		Additional parameters that can be subsituted in the
		 * 					str parameter at each "{x}" location.
		 */
		private function createLog(level:uint, message:String, ... rest):void {
			var evt:LogEvent = new LogEvent(LogEvent.LOG);
			evt.level = level;
			evt.message = this.composeLogMessage(message, rest);
			this.dispatchEvent(evt);
		}
		
		/**
		 * 	Composes and returns the message created from the original <code>message</code>
		 * 	and the additional parameters, specified by the <code>rest</code>
		 * 	parameter.
		 * 
		 * 	@param	message		The original information to log.
		 * 	@param	... rest	Additional parameters that can be subsituted in 
		 * 						the str parameter at each "{x}" location.
		 * 
		 * 	@return	The message to log.
		 */
		private function composeLogMessage(message:String, ... rest):String {
			var msg:String = message;
			var len:int = rest.length - 1;
			var pattern:RegExp;
			var addParam:Object;
			for (; len >= 0; len--) {
				pattern = new RegExp("{" + String(len) + "}");
				addParam = rest[len];
				msg = msg.replace(pattern, addParam);
			}
			return msg;
		}
	}
}