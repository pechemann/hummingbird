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

package org.flashapi.hummingbird.mobile {
	
	// -----------------------------------------------------------
	//  MobileViewExistencePolicy.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 29/11/2013 20:00
	 *  @see http://www.flashapi.org/
	 */
	
	/**
	 *  The <code>MobileViewExistencePolicy</code> class is an enumeration of constant 
	 * 	values that specify the value of the <code>IMobileMediator.mobileViewExistencePolicy</code>
	 * 	property.
	 * 
	 * 	@see org.flashapi.hummingbird.mobile.IMobileMediator#mobileViewExistencePolicy
	 * 
	 * 	@since Hummingbird 1.6
	 */
	public class MobileViewExistencePolicy {
		
		//--------------------------------------------------------------------------
		//
		//  Public constants
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Indicates that the <code>finalize()</code> method must be called on
		 * 	<code>IFlexMobileView</code> objects when they are removed from the
		 * 	application.
		 */
		public static const DISPOSE_ON_REMOVE:String = "disposeOnRemove";
		
		/**
		 * 	Indicates that the <code>finalize()</code> method is not called on
		 * 	<code>IFlexMobileView</code> objects when they are removed from the
		 * 	application.
		 */
		public static const DO_NOTHING_ON_REMOVE:String = "doNothingOnRemove";
	}
}