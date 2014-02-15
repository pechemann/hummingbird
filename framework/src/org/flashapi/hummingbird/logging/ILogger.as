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

package org.flashapi.hummingbird.logging {
	
	// -----------------------------------------------------------
	//  ILogger.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.1, 03/11/2013 18:19
	 *  @see http://www.flashapi.org/
	 */
	
	import flash.events.IEventDispatcher;
	
	/**
	 *  The <code>ILogger</code> defines the API that must be implemented by all
	 * 	Hummingbird framework loggers.
	 */
	public interface ILogger extends IEventDispatcher {
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Logs the specified data using the <code>LogLevel.CONFIG</code> level.
		 * 
		 * 	@param message 	The information to log. This string can contain special
		 * 					marker characters of the form {x}, where x is a zero
		 * 					based index that will be replaced with the additional
		 * 					parameters found at that index if specified.
		 * 	@param rest		Additional parameters that can be subsituted in the
		 * 					str parameter at each "{x}" location, where x is
		 * 					an integer (zero based) index value into the
		 * 					<code>Array</code> of values specified.
		 * 
		 * 	@see org.flashapi.hummingbird.logging.LogLevel
		 */
		function config(message:String, ... rest):void;
		
		/**
		 *  Logs the specified data using the <code>LogLevel.FATAL</code> level.
		 * 
		 * 	@param message 	The information to log. This string can contain special
		 * 					marker characters of the form {x}, where x is a zero
		 * 					based index that will be replaced with the additional
		 * 					parameters found at that index if specified.
		 * 	@param rest		Additional parameters that can be subsituted in the
		 * 					str parameter at each "{x}" location, where x is
		 * 					an integer (zero based) index value into the
		 * 					<code>Array</code> of values specified.
		 * 
		 * 	@see org.flashapi.hummingbird.logging.LogLevel
		 */
		function fatal(message:String, ... rest):void;
		
		/**
		 *  Logs the specified data using the <code>LogLevel.INFO</code> level.
		 * 
		 * 	@param message 	The information to log. This string can contain special
		 * 					marker characters of the form {x}, where x is a zero
		 * 					based index that will be replaced with the additional
		 * 					parameters found at that index if specified.
		 * 	@param rest		Additional parameters that can be subsituted in the
		 * 					str parameter at each "{x}" location, where x is
		 * 					an integer (zero based) index value into the
		 * 					<code>Array</code> of values specified.
		 * 
		 * 	@see org.flashapi.hummingbird.logging.LogLevel
		 */
		function info(message:String, ... rest):void;
		
		/**
		 *  Logs the specified data using the <code>LogLevel.WARN</code> level.
		 * 
		 * 	@param message 	The information to log. This string can contain special
		 * 					marker characters of the form {x}, where x is a zero
		 * 					based index that will be replaced with the additional
		 * 					parameters found at that index if specified.
		 * 	@param rest		Additional parameters that can be subsituted in the
		 * 					str parameter at each "{x}" location, where x is
		 * 					an integer (zero based) index value into the
		 * 					<code>Array</code> of values specified.
		 * 
		 * 	@see org.flashapi.hummingbird.logging.LogLevel
		 */
		function warn(message:String, ... rest):void;
		
		/**
		 *  Logs the specified data using the <code>LogLevel.DEBUG</code> level.
		 * 
		 * 	@param message 	The information to log. This string can contain special
		 * 					marker characters of the form {x}, where x is a zero
		 * 					based index that will be replaced with the additional
		 * 					parameters found at that index if specified.
		 * 	@param rest		Additional parameters that can be subsituted in the
		 * 					str parameter at each "{x}" location, where x is
		 * 					an integer (zero based) index value into the
		 * 					<code>Array</code> of values specified.
		 * 
		 * 	@see org.flashapi.hummingbird.logging.LogLevel
		 */
		function debug(message:String, ... rest):void;
	}
}