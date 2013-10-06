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
	//  LogLevel.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 06/10/2013 18:15
	 *  @see http://www.flashapi.org/
	 */
	
	/**
	 *  The <code>LogLevel</code> class provides constant that can be used to control
	 * 	logging output.
	 *  
	 * 	@see org.flashapi.hummingbird.logging.ILogger
	 * 	@see org.flashapi.hummingbird.logging.LogEvent
	 */
	public class LogLevel {
		
		//--------------------------------------------------------------------------
		//
		//  Public constants
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Defines a message level for static configuration messages.
		 */
		public static const CONFIG :uint = 0;
		
		/**
		 * 	Defines a message level indicating a serious failure.
		 */
		public static const FATAL:uint = 1;
		
		/**
		 * 	Defines a message level for informational messages.
		 */
		public static const INFO:uint = 2;
		
		/**
		 * 	Defines a message level indicating a potential problem.
		 */
		public static const WARN:uint = 3;
	}
}