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

package utils {
	
	// -----------------------------------------------------------
	//  LogManager.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 31/10/2013 14:37
	 *  @see http://www.flashapi.org/
	 */
	
	import mx.logging.targets.TraceTarget;
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.logging.LogEventLevel;
	import org.flashapi.hummingbird.logging.FlexLogAdapter;
	import org.flashapi.hummingbird.logging.LogEvent;
	import org.flashapi.hummingbird.logging.Logger;
	
	/**
	 * 	A convenient class for providing a global access to the application logger.
	 */
	public class LogManager {
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Initializes the application logger.
		 */
		public static function init():void {
			if (_logger == null) {
				var logTarget:TraceTarget = new TraceTarget();
				logTarget.level = LogEventLevel.ALL;
				logTarget.includeDate = true;
				logTarget.includeTime = true;
				logTarget.includeLevel = true;
				Log.addTarget(logTarget);
				_logger = Log.getLogger("TraceTarget");
				var logAdapter:FlexLogAdapter = new FlexLogAdapter();
				logAdapter.setCategory("TraceTarget");
				Logger.getInstance().addEventListener(LogEvent.LOG, logAdapter.logEvent);
				LogManager.info("LogManager initialized");
			}
		}
		
		/**
		 * 	Sends an information message to the logging output.
		 * 
		 * 	@param	message	The message to log.
		 */
		public static function info(message:String):void {
			_logger.info(message);
		}
		
		/**
		 * 	Sends an error message to the logging output.
		 * 
		 * 	@param	message	The message to log.
		 */
		public static function error(message:String):void {
			_logger.error(message);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	The reference to the application logger.
		 */
		private static var _logger:ILogger;
	}
}