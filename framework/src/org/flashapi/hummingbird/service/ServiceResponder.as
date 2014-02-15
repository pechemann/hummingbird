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

package org.flashapi.hummingbird.service {
	import org.flashapi.hummingbird.core.HummingbirdBase;
	
	// -----------------------------------------------------------
	//  ServiceResponder.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 03/11/2013 17:37
	 *  @see http://www.flashapi.org/
	 */
	
	/**
	 * 	The <code>ServiceResponder</code> class provides an object that is used
	 * 	in calls to service objects to handle return values related to the success
	 * 	or failure of specific operations. 
	 */
	public class ServiceResponder {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Constructor. 	Creates a new <code>ServiceResponder</code> instance.
		 * 
		 * 	@param	result	The function invoked if the call to the service succeeds
		 * 					and returns a result.
		 * 	@param	status	The function invoked if the service returns an error.
		 */
		public function ServiceResponder(result:Function, status:Function = null) {
			super();
			this.initObj(result, status);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Internal methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	Method invoked from the <code>AbstractService</code> class when the call
		 * 	to the service succeeds and returns a result.
		 * 
		 * 	@param result 	The result object, as defined by the developper of the
		 * 					service.
		 */
		internal function onResult(result:Object):void {
			_resultHandler(result);
		}
		
		/**
		 * 	@private
		 * 
		 * 	Method invoked from the <code>AbstractService</code> class when the call
		 * 	to the service returns an error.
		 * 
		 * 	@param result 	The fault object, as defined by the developper of the
		 * 					service.
		 * 	@param service 	The reference to the service that handles this error.
		 */
		internal function onStatus(fault:Object, service:IService):void {
			if (_statusHandler != null) {
				_statusHandler(fault);
			} else {
				HummingbirdBase.getLogger()
					.warn("No status function is defined for handling a service error on " + service);
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	The reference to the function invoked if the call to the service succeeds 
		 * 	and returns a result.
		 */
		private var _resultHandler:Function;
		
		/**
		 * 	@private
		 * 
		 * 	The reference to the function invoked if the service returns an error.
		 */
		private var _statusHandler:Function;
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * Initializes the object.
		 * 
		 * 	@param	result	The function invoked if the call to the service succeeds
		 * 					and returns a result.
		 * 	@param	status	The function invoked if the service returns an error.
		 */
		private function initObj(result:Function, status:Function = null):void {
			_resultHandler = result;
			_statusHandler = status;
		}
	}
}