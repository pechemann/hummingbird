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

package org.flashapi.hummingbird.utils {
	
	// -----------------------------------------------------------
	//  ManifestReference.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 05/07/2013 22:24
	 *  @see http://www.flashapi.org/
	 */
	
	/**
	 *  <code>ManifestReference</code> objects are used by the <code>ManifestReferenceEnum</code>
	 * 	class to associate a property of the <code>ManifestInfo</code> class to the
	 * 	corresponding value in the Hummingbird <code>MANIFEST.MF</code> file.
	 * 
	 * 	@see org.flashapi.hummingbird.enum.ManifestReferenceEnum
	 */
	public class ManifestReference {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>ManifestReference</code> instance
		 * 					with the specified properties.
		 * 
		 * 	@param manifestReference	The reference to a manifest property as defined
		 * 								by the <code>ManifestConstant</code> class.
		 * 	@param manifestInfoProperty	The reference to <code>ManifestInfo</code>
		 * 								property as defined by the <code>ManifestInfoProperty</code>
		 * 								class.
		 */
		public function ManifestReference(manifestReference:String, manifestInfoProperty:String) {
			super();
			this.initObj(manifestReference, manifestInfoProperty);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Getter properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Returns reference to a manifest property as defined by the
		 * 	<code>ManifestConstant</code> class.
		 * 
		 * 	@see org.flashapi.hummingbird.utils.constants.ManifestConstant
		 */
		public function get manifestReference():String {
			return _manifestReference;
		}
		
		/**
		 * 	Returns the reference to a metadata tag as defined by the
		 * 	<code>ManifestInfoProperty</code> class.
		 * 
		 * 	@see org.flashapi.hummingbird.utils.constants.ManifestInfoProperty
		 */
		public function get manifestInfoProperty():String {
			return _manifestInfoProperty;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 	
		 * 	The reference to a metadata tag as defined by the <code>ManifestConstant</code>
		 * 	class.
		 */
		private var _manifestReference:String;
		
		/**
		 * 	@private
		 * 	
		 * 	The reference to a MVC interface as defined by the <code>ManifestInfoProperty</code>
		 * 	class.
		 */
		private var _manifestInfoProperty:String;
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 	
		 * 	Initializes this <code>ManifestReference</code> instance.
		 */
		private function initObj(manifestReference:String, manifestInfoProperty:String):void {
			_manifestReference = manifestReference;
			_manifestInfoProperty = manifestInfoProperty;
		}
	}
}