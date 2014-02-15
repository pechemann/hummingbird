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
	
	// -----------------------------------------------------------
	//  AbstractService.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.1, 03/11/2013 17:12
	 *  @see http://www.flashapi.org/
	 */
	
	import org.flashapi.hummingbird.core.LoggableObject;
	
	//--------------------------------------------------------------------------
	//
	//  Events
	//
	//--------------------------------------------------------------------------
	
	/**
	 * 	Convenient superclass for services implementations.
	 */
	public class AbstractService extends LoggableObject implements IService {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>AbstractService</code> instance.
		 */
		public function AbstractService() {
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@inheritDoc
		 */
		public function finalize():void { }
		
		//--------------------------------------------------------------------------
		//
		//  Protected methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Sets the result of an operation to the specified responder when the call
		 * 	to the service succeeds and returns a result.
		 * 
		 * 	@param responder	The <code>ServiceResponder</code> object for which
		 * 						to pass the result information.
		 * 	@param result 		The result object, as defined by the developper of 
		 * 						the service.
		 */
		protected function operationResult(responder:ServiceResponder, result:Object):void {
			responder.onResult(result);
		}
		
		/**
		 * 	Sets the fault information for an operation to the specified responder 
		 * 	when the call to the service returns an error.
		 * 
		 * 	@param responder	The <code>ServiceResponder</code> object for which
		 * 						to pass the fault information.
		 * 	@param fault 		The fault object, as defined by the developper of 
		 * 						the service.
		 */
		protected function operationFault(responder:ServiceResponder, fault:Object):void {
			responder.onStatus(fault, this);
		}
	}
}