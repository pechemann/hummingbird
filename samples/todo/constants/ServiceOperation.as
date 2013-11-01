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

package constants {
	
	// -----------------------------------------------------------
	//  ServiceOperation.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 31/10/2013 14:37
	 *  @see http://www.flashapi.org/
	 */
	
	/**
	 * 	The <code>ServiceOperation</code> class represents a collection of values that  
	 *  specify an operation performed by the concrete implementation of the
	 * 	<code>IPersistenceService</code> interface.
	 */
	public final class ServiceOperation {
		
		//--------------------------------------------------------------------------
		//
		//  Public constants
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Represents the operation for returning the initial items list.
		 */
		public static const SELECT_ALL:uint = 0;
		
		/**
		 * 	Represents the operation for creating a new item.
		 */
		public static const CREATE:uint = 1;
		
		/**
		 * 	Represents the operation for updating the "label" of an item.
		 */
		public static const UPDATE_LABEL:uint = 2;
		
		/**
		 * 	Represents the operation for updating the "completed" state of an item.
		 */
		public static const UPDATE_STATE:uint = 3;
		
		/**
		 * 	Represents the operation for updating the "completed" state of all items.
		 */
		public static const UPDATE_ALL_STATES:uint = 4;
		
		/**
		 * 	Represents the operation for deleting an item.
		 */
		public static const DELETE:uint = 5;
		
		/**
		 * 	Represents the operation for deleting all completed items.
		 */
		public static const DELETE_COMPLETED:uint = 6;
	}
}