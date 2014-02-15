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

package org.flashapi.hummingbird.starling.core {
	
	// -----------------------------------------------------------
	//  StarlingMapDto.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 26/10/2013 16:46
	 *  @see http://www.flashapi.org/
	 */
	
	import flash.display.Stage;
	import org.flashapi.hummingbird.core.IFinalizable;
	import org.flashapi.hummingbird.starling.StarlingID;
	import org.flashapi.hummingbird.utils.DtoUtil;
	
	/**
	 * 	The <code>StarlingMapDto</code> class is internally used by the Hummingbird
	 * 	Framework to manage the different instances of the Starling Framework.
	 */
	public class StarlingMapDto implements IFinalizable {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>StarlingMapDto</code> instance.
		 */
		public function StarlingMapDto() {
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	The <code>StarlingID</code> instance associated to this <code>StarlingMapDto</code>
		 * 	object.
		 */
		public var starlingID:StarlingID;
		
		/**
		 * 	The <code>Stage</code> object associated to the  <code>StarlingID</code>
		 * 	object.
		 */
		public var stage:Stage;
		
		/**
		 * 	@inheritDoc
		 */
		public function finalize():void {
			this.starlingID = null;
			this.stage = null;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 */
		public function toString():String {
			return DtoUtil.formatToString(this, "StarlingMapDto", "starlingID", "stage");
		}
	}
}