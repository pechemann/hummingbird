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

package org.flashapi.hummingbird.core {
	
	// -----------------------------------------------------------
	//  HummingbirdEventDispatcher.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 26/10/2013 22:358
	 *  @see http://www.flashapi.org/
	 */
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import org.flashapi.hummingbird.exceptions.SingletonException;

	/**
	 * 	The <code>HummingbirdEventDispatcher</code> class represents the global
	 * 	event dispatcher of the Hummingbird framework.
	 */
	public class HummingbirdEventDispatcher extends EventDispatcher implements IEventDispatcher {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>HummingbirdEventDispatcher</code>
		 * 					instance.
		 */
		public function HummingbirdEventDispatcher() {
			super();
			if (INSTANCE) {
				throw new SingletonException("you must use the getInstance() method to access HummingbirdEventDispatcher instances");
			}
			this.initObj();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Singleton management
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Returns the reference to the <code>HummingbirdEventDispatcher</code>
		 * 	singleton.
		 * 
		 * 	@return	The reference to the <code>HummingbirdEventDispatcher</code>
		 * 			singleton.
		 */
		public static function getInstance():HummingbirdEventDispatcher {
			return HummingbirdEventDispatcher.INSTANCE;
		}
		
		/**
		 * 	@private
		 * 	
		 * 	The <code>HummingbirdEventDispatcher</code> singleton.
		 */
		private static const INSTANCE:HummingbirdEventDispatcher = new HummingbirdEventDispatcher();
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 	
		 * 	Initializes the IoC container.
		 */
		private function initObj():void {
			HummingbirdBase.getLogger().config("Hummingbird event dispatcher created");
		}
	}
}