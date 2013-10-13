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
	//  FlexLogAdapter.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 13/10/2013 14:52
	 *  @see http://www.flashapi.org/
	 */
	
	import mx.logging.Log;
	import mx.logging.ILogger;
	
	/**
	 *  The <code>FlexLogAdapter</code> class provides the built-in mechanism for
	 * 	translating the Hummingbird logging API interface into the compatible Flex
	 * 	logging API interface.
	 */
	public class FlexLogAdapter {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Constructor. creates a new <code>FlexLogAdapter</code> instance.
		 */
		public function FlexLogAdapter() {
			super();
		}
		
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
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	 This method handles a <code>LogEvent</code> from the Hummingbird logging
		 * 	 framework.
		 * 
		 * 	@param	event	The <code>LogEvent</code> handled by this method.
		 * 
		 * 	@see org.flashapi.hummingbird.logging.LogEvent
		 */
		public function logEvent(event:LogEvent):void {
			var level:uint = event.level;
			if(level == LogLevel.CONFIG) {
				_logger.debug(this.composeMessage(FlexLogAdapter.CONFIG_TAG, event.message));
			} else if(level == LogLevel.FATAL) {
				_logger.debug(this.composeMessage(FlexLogAdapter.FATAL_TAG, event.message));
			} else if(level == LogLevel.INFO) {
				_logger.debug(this.composeMessage(FlexLogAdapter.INFO_TAG, event.message));
			} else if(level == LogLevel.WARN) {
				_logger.debug(this.composeMessage(FlexLogAdapter.WARN_TAG, event.message));
			}
		}
		
		/**
		 * 	Returns the category of the Flex logger that is currently used by this
		 * 	adapter.
		 * 
		 * 	@return The category of the Flex logger that is used by this adapter.
		 * 
		 * 	@see #setCategory()
		 * 	@see mx.logging.Log#getLogger()
		 */
		public function getCategory():String {
			return _category;
		}
		
		/**
		 * 	Sets the category of the Flex logger that should be currently used by 
		 * 	this adapter.
		 * 
		 * @param	category	The category of the Flex logger to be used by 
		 * 						this adapter.
		 * 
		 * 	@see #getCategory()
		 * 	@see mx.logging.Log#getLogger()
		 */
		public function setCategory(category:String):void {
			_category = category;
			_logger = Log.getLogger(_category);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	The category of the Flex logger that should be currently used by this
		 * 	adapter.
		 */
		private var _category:String;
		
		/**
		 * 	The reference to the Flex logger that should be currently used by this
		 * 	adapter.
		 */
		private var _logger:mx.logging.ILogger;
		
		/**
		 * 	Specifies the string to be used as the "[Hummingbird]" tag for a log.
		 */
		private static const FRAMEWORK_TAG:String = "[Hummingbird]";
		
		/**
		 * 	Specifies the string to be used as level tag for the 
		 * 	<code>LogLevel.FATAL</code> level.
		 */
		private static const FATAL_TAG:String = "[LogLevel.FATAL]";
		
		/**
		 * 	Specifies the string to be used as level tag for the 
		 * 	<code>LogLevel.CONFIG</code> level.
		 */
		private static const CONFIG_TAG:String = "[LogLevel.CONFIG]";
		
		/**
		 * 	Specifies the string to be used as level tag for the 
		 * 	<code>LogLevel.INFO</code> level.
		 */
		private static const INFO_TAG:String = "[LogLevel.INFO]";
		
		/**
		 * 	Specifies the string to be used as level tag for the 
		 * 	<code>LogLevel.WARN</code> level.
		 */
		private static const WARN_TAG:String = "[LogLevel.WARN]";
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Composes the message to send to the logger, from the specified level,
		 *  the original message and the predefined properties.
		 * 
		 * 	@param	level	The level for this log. A constant of the LogLevel
		 * 					class.
		 * 	@param	message	The original message for this log.
		 * 
		 * 	@return	The formatted string for this log.
		 */
		private function composeMessage(level:String, message:String):String {
			var msg:String = "";
			if (includeFrameworkTag) msg += FlexLogAdapter.FRAMEWORK_TAG + fieldSeparator;
			if (includeLevel) msg += level + fieldSeparator;
			msg += message;
			return msg;
		}
	}
}