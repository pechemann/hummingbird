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
	//  BaseLogObserver.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 27/10/2013 10:12
	 *  @see http://www.flashapi.org/
	 */
	
	/**
	 *  The <code>BaseLogObserver</code> class 
	 */
	public class BaseLogObserver implements ILogObserver {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Constructor. Creates a new <code>BaseLogObserver</code> instance.
		 */
		public function BaseLogObserver() {
			super();
			this.initObj();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Getter / setter properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@inheritDoc
		 */
		public function get includeFrameworkTag():Boolean {
			return $logMessageComposer.includeFrameworkTag;
		}
		public function set includeFrameworkTag(value:Boolean):void {
			$logMessageComposer.includeFrameworkTag = value;
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function get includeLevel():Boolean {
			return $logMessageComposer.includeLevel;
		}
		public function set includeLevel(value:Boolean):void {
			$logMessageComposer.includeLevel = value;
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function get fieldSeparator():String {
			return $logMessageComposer.fieldSeparator;
		}
		public function set fieldSeparator(value:String):void {
			$logMessageComposer.fieldSeparator = value;
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function get includeDate():Boolean {
			return $logMessageComposer.includeDate;
		}
		public function set includeDate(value:Boolean):void {
			$logMessageComposer.includeDate = value;
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function get includeTime():Boolean {
			return $logMessageComposer.includeTime;
		}
		public function set includeTime(value:Boolean):void {
			$logMessageComposer.includeTime = value;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@inheritDoc
		 */
		public function setLogger(logger:ILogger):void {
			this.removeLoggerRef()
			if (logger != null) {
				$logger = logger;
				$logger.addEventListener(LogEvent.LOG, this.logEventHandler);
			} else {
				Logger.getInstance().warn("No logger is defined for this instance of ILogObserver: " + this);
			}
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function getLogger():ILogger {
			return $logger;
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function finalize():void {
			this.removeLoggerRef()
			$logMessageComposer = null;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Protected properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	The reference to the Flex logger that should be currently used by this
		 * 	adapter.
		 */
		protected var $logger:ILogger;
		
		/**
		 * 	The message composer for this <code>FlexLogAdapter</code> instance.
		 */
		protected var $logMessageComposer:LogMessageComposer;
		
		//--------------------------------------------------------------------------
		//
		//  Protected methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	 The abstract method that handles a <code>LogEvent</code> from the 
		 * 	 Hummingbird logging framework.
		 * 
		 * 	@param	e	The <code>LogEvent</code> handled by this method.
		 * 
		 * 	@see org.flashapi.hummingbird.logging.LogEvent
		 */
		protected function logEventHandler(e:LogEvent):void { }
		
		/**
		 * 	Removes the reference of the logger instance for this <code>ILogObserver</code>
		 * 	object if it exists.
		 */
		protected function removeLoggerRef():void {
			if ($logger != null) {
				$logger.removeEventListener(LogEvent.LOG, this.logEventHandler);
				$logger = null;
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	Initializes this <code>BaseLogObserver</code> instance.
		 */
		private function initObj():void {
			$logMessageComposer = new LogMessageComposer();
		}
	}
}