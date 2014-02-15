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
	//  StarlingContextMapDto.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 26/10/2013 19:49
	 *  @see http://www.flashapi.org/
	 */
	
	import org.flashapi.hummingbird.core.IApplicationContext;
	import org.flashapi.hummingbird.core.IFinalizable;
	import org.flashapi.hummingbird.utils.DtoUtil;
	import starling.core.Starling;
	
	/**
	 * 	The <code>StarlingContextMapDto</code> class is internally used by the 
	 * 	Hummingbird Framework to manage the different context objects associated to
	 * 	specific instances of the <code>Starling</code> class.
	 */
	public class StarlingContextMapDto implements IFinalizable {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>StarlingContextMapDto</code> instance.
		 */
		public function StarlingContextMapDto() {
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	The <code>Starling</code> instance associated to this <code>StarlingContextMapDto</code>
		 * 	object.
		 */
		public var starling:Starling;
		
		/**
		 * 	The <code>IApplicationContext</code> object associated to the <code>Starling</code>
		 * 	object.
		 */
		public var context:IApplicationContext;
		
		/**
		 * 	@inheritDoc
		 */
		public function finalize():void {
			this.starling = null;
			this.context = null;
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
			return DtoUtil.formatToString(this, "StarlingContextMapDto", "starling", "context");
		}
	}
}