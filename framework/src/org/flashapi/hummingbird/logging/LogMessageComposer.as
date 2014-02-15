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
	//  LogMessageComposer.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.1, 03/11/2013 18:20
	 *  @see http://www.flashapi.org/
	 */
	
	/**
	 *  The <code>LogMessageComposer</code> class writes welle formatted log messages 
	 * 	based upon Hummingbird logs.
	 */
	public class LogMessageComposer {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Constructor. 	Creates a new <code>LogMessageComposer</code> instance.
		 */
		public function LogMessageComposer() {
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public constants
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Specifies the string to be used as the "[Hummingbird]" tag for a log.
		 */
		public static const FRAMEWORK_TAG:String = "[Hummingbird]";
		
		/**
		 * 	Specifies the string to be used as level tag for the 
		 * 	<code>LogLevel.FATAL</code> level.
		 */
		public static const FATAL_TAG:String = "[LogLevel.FATAL]";
		
		/**
		 * 	Specifies the string to be used as level tag for the 
		 * 	<code>LogLevel.CONFIG</code> level.
		 */
		public static const CONFIG_TAG:String = "[LogLevel.CONFIG]";
		
		/**
		 * 	Specifies the string to be used as level tag for the 
		 * 	<code>LogLevel.INFO</code> level.
		 */
		public static const INFO_TAG:String = "[LogLevel.INFO]";
		
		/**
		 * 	Specifies the string to be used as level tag for the 
		 * 	<code>LogLevel.WARN</code> level.
		 */
		public static const WARN_TAG:String = "[LogLevel.WARN]";
		
		/**
		 * 	Specifies the string to be used as level tag for the 
		 * 	<code>LogLevel.DEBUG</code> level.
		 */
		public static const DEBUG_TAG:String = "[LogLevel.DEBUG]";
		
		//--------------------------------------------------------------------------
		//
		//  Public properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Indicates whether the "[Hummingbird]" tag for the log be should added to
		 * 	the outpout (<code>true</code>), or not (<code>false</code>).
		 * 
		 * 	@default true
		 */
		public var includeFrameworkTag:Boolean = true;
		
		/**
		 * 	Indicates whether the level for the log be should added to the outpout
		 * 	(<code>true</code>), or not (<code>false</code>).
		 * 
		 * 	@default true
		 */
		public var includeLevel:Boolean = true;
		
		/**
		 * 	The separator string to use between fields.
		 * 
		 * 	@default " "
		 */
		public var fieldSeparator:String = " ";
		
		/**
		 * 	Indicates whether the date for the log be should added to the outpout
		 * 	(<code>true</code>), or not (<code>false</code>).
		 * 
		 * 	@default true
		 */
		public var includeDate:Boolean = true;
		
		/**
		 * 	Indicates whether the time for the log be should added to the outpout
		 * 	(<code>true</code>), or not (<code>false</code>).
		 * 
		 * 	@default true
		 */
		public var includeTime:Boolean = true;
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Composes the message to send to the logger, based upon the specified 
		 *  level, the original message and the predefined properties.
		 * 
		 * 	@param	level	The level for this log. A constant of the 
		 * 					<code>LogLevel</code> class.
		 * 	@param	message	The original message for this log.
		 * 
		 * 	@return	The formatted string for this log.
		 */
		public function composeMessage(level:uint, message:String):String {
			var msg:String = "";
			if (this.includeDate || this.includeTime) {
				msg += this.getDate();
			}
			if (this.includeFrameworkTag) {
				msg += LogMessageComposer.FRAMEWORK_TAG + this.fieldSeparator;
			}
			if (this.includeLevel) {
				msg += this.getLevelTag(level) + this.fieldSeparator;
			}
			msg += message;
			return msg;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private constants
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	A reference to the semicolon character.
		 */
		private static const SEMICOLON:String = ":";
		
		/**
		 * 	@private
		 * 
		 * 	A reference to the dot character.
		 */
		private static const DOT:String = ".";
		
		/**
		 * 	@private
		 * 
		 * 	A reference to the slash character.
		 */
		private static const SLASH:String = "/";
		
		/**
		 * 	@private
		 * 
		 * 	A reference to the zero character.
		 */
		private static const ZERO:String = "0";
		
		/**
		 * 	@private
		 * 
		 * 	A reference to a double zero string.
		 */
		private static const DOUBLE_ZERO:String = "00";
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	Returns the level tag depending on the specified Log level.
		 * 
		 * 	@param	level	The Log level for which to get the level tag. A constant 
		 * 					of the <code>LogLevel</code> class.
		 * 
		 * 	@return The level tag depending on the specified Log level.
		 */
		private function getLevelTag(level:uint):String {
			var levelTag:String;
			if(level == LogLevel.CONFIG) {
				levelTag = LogMessageComposer.CONFIG_TAG;
			} else if(level == LogLevel.FATAL) {
				levelTag = LogMessageComposer.FATAL_TAG;
			} else if(level == LogLevel.INFO) {
				levelTag = LogMessageComposer.INFO_TAG;
			} else if(level == LogLevel.WARN) {
				levelTag = LogMessageComposer.WARN_TAG;
			} else if(level == LogLevel.DEBUG) {
				levelTag = LogMessageComposer.DEBUG_TAG;
			}
			return levelTag;
		}
		
		/**
		 * 	@private
		 * 
		 * 	Returns a string that represents the timestamp for the current Log.
		 * 
		 * 	@return The timestamp for the current Log.
		 */
		private function getDate():String {
			var date:String = "";
			var d:Date = new Date();
			if (this.includeDate) {
				date +=
					String(d.getMonth() + 1.0)	+ LogMessageComposer.SLASH +
					String(d.getDate())			+ LogMessageComposer.SLASH + 
					String(d.getFullYear()) 	+ this.fieldSeparator;
            }   
            if (this.includeTime) {
				date +=
					this.padTime(d.getHours(), false)		+ LogMessageComposer.SEMICOLON +
					this.padTime(d.getMinutes(), false)		+ LogMessageComposer.SEMICOLON +
					this.padTime(d.getSeconds(), false)		+ LogMessageComposer.DOT +
					this.padTime(d.getMilliseconds(), true) + this.fieldSeparator;
            }
			return date;
		}
		
		/**
		 * 	@private
		 * 
		 * 	Fixes the number of leading zeros for the specified time value and returns
		 * 	the fixed time as a string.
		 * 
		 * 	@param	value	The time value to fix.
		 * 	@param	isMillisecondPart	Indicates whether the time value to fix
		 * 					represents the millisecond part of the timestamp
		 * 					(<code>true</code>), or not (<code>false</code>).
		 * 
		 * 	@return	The fixed time value as a string.
		 */
		private function padTime(value:Number, isMillisecondPart:Boolean):String {
			var fixedTime:String;
			if (isMillisecondPart == false) {
				fixedTime = value > 9 ? String(value) : LogMessageComposer.ZERO + String(value);
			} else {
				if (value < 10) {
					fixedTime = LogMessageComposer.DOUBLE_ZERO + String(value);
				} else if (value < 100) {
					fixedTime = LogMessageComposer.ZERO + String(value);
				} else {
					fixedTime = String(value);
				}
			}
			return fixedTime;
		}
	}
}