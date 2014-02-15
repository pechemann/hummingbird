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

package org.flashapi.hummingbird.starling {
	
	// -----------------------------------------------------------
	//  StarlingID.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 26/10/2013 12:04
	 *  @see http://www.flashapi.org/
	 */
	
	import org.flashapi.hummingbird.core.IFinalizable;
	import starling.core.Starling;
	
	/**
	 * 	The <code>StarlingID</code> class .
	 * 
	 * 	@see org.flashapi.hummingbird.starling.StarlingPropertiesBuilder
	 */
	public class StarlingID implements IFinalizable {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>StarlingID</code> instance for the
		 * 					specified <code>Starling</code> instance.
		 * 
		 * 	@param	starling	The <code>Starling</code> instance associated to
		 * 						this <code>StarlingID</code> object.
		 */
		public function StarlingID(starling:Starling) {
			super();
			this.initObj(starling);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Returns the <code>Starling</code> instance associated to this
		 * 	<code>StarlingID</code> object.
		 * 
		 * 	@return	The associated <code>Starling</code> instance.
		 */
		public function getStarling():Starling {
			return _starling;
		}
		
		/**
		 * 	Returns the Pseudo Globally Unique IDentifier associated to this 
		 * 	<code>StarlingID</code> object.
		 * 
		 * 	@return	A string that represents the Pseudo Globally Unique IDentifier 
		 * 			for this <code>StarlingID</code> object.
		 */
		public function getGUID():String {
			return _pseudoGUID;
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function finalize():void {
			_starling = null;
			_pseudoGUID = null;
		}
		
		/**
		 * 	@private
		 */
		public function toString():String {
			var s:String = "[object StarlingID:" + " starling=" + _starling
							+ ", guid=" + _pseudoGUID + "]";
			return s;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	The <code>Starling</code> instance associated to this <code>StarlingID</code>
		 * 	object.
		 */
		private var _starling:Starling;
		
		/**
		 * 	@private
		 * 
		 *	A string that represents the Pseudo Globally Unique IDentifier for this 
		 * 	<code>StarlingID</code> object.
		 */
		private var _pseudoGUID:String;
		
		//--------------------------------------------------------------------------
		//
		//  Pseudo-GUID properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	The map of short values that represent the characters used to generate 
		 * 	a GUID string.
		 */
		private static const CHARS_MAP:Vector.<uint> =
			new <uint>[48,49,50,51,52,53,54,55,56,57,65,66,67,68,69,70];
		
		/**
		 * 	@private
		 * 
		 * 	The size of the characters map used to generate a GUID string.
		 */
		private static const CHARS_MAP_SIZE:uint = 16;
		
		/**
		 * 	@private
		 * 
		 * 	The short value that represent the separator characters used to generate 
		 * 	a GUID string.
		 */
		private static const SEPARATOR:uint = 45;
		
		/**
		 * 	@private
		 * 
		 * 	The matrix used to generate a GUID string.
		 */
		private static const TEMPLATE:Vector.<uint> = new <uint>[8,4,4,4,12];
		
		/**
		 * 	@private
		 * 
		 * 	The size of the template map used to generate a GUID string, minus 1.
		 */
		private static const TEMPLATE_SIZE:uint = 4;
		
		/**
		 * 	@private
		 * 
		 * 	A string used to store all of the generated GUIDs.
		 */
		private static var _pseudoGUIDRef:String = "";
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	Initializes this <code>StarlingID</code> object.
		 * 
		 * 	@param	starling	The <code>Starling</code> instance associated to 
		 * 						this <code>StarlingID</code> object.
		 */
		private function initObj(starling:Starling):void {
			_starling = starling;
			_pseudoGUID = StarlingID.generatePseudoGUID();
		}
		
		/**
		 * 	@private
		 * 
		 * 	Generates and returns a pseudo-GUID string based on a random implementation.
		 * 
		 * 	@return A pseudo-GUID string based on a random implementation.
		 * 
		 * 	@see http://guid.us/GUID/ActionScript3
		 */
		private static function generatePseudoGUID():String {
			var uid:Array = [];
			var a:uint = 0;
			var b:uint;
			var charId:uint;
			for (; a <= StarlingID.TEMPLATE_SIZE; ++a) {
				b = 0;
				for (; b < StarlingID.TEMPLATE[a]; ++b) {
					charId = Math.floor(Math.random() * StarlingID.CHARS_MAP_SIZE);
					uid.push(StarlingID.CHARS_MAP[charId]);
				} if (a < StarlingID.TEMPLATE_SIZE) {
					uid.push(StarlingID.SEPARATOR); 
				}
			}
			var guid:String = String.fromCharCode.apply(null, uid);
			if (StarlingID._pseudoGUIDRef.indexOf(guid) == -1) {
				StarlingID._pseudoGUIDRef += guid;
			} else {
				guid = StarlingID.generatePseudoGUID();
			}
			return guid;
		}
	}
}