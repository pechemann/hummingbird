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
	//  MetadataReference.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 05/07/2013 22:24
	 *  @see http://www.flashapi.org/
	 */
	
	/**
	 *  <code>MetadataReference</code> objects are used by the <code>MetadataReferenceEnum</code>
	 * 	class to associate a metadata tag with its corresponding interface.
	 * 
	 * 	@see org.flashapi.hummingbird.enum.MetadataReferenceEnum
	 */
	public class MetadataReference {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>MetadataReference</code> instance
		 * 					with the specified properties.
		 * 
		 * 	@param metadataReference	The reference to a metadata tag as defined
		 * 								by the <code>MetadataConstant</code> class.
		 * 	@param interfaceReference	The reference to a MVC interface as defined
		 * 								by the <code>InterfaceReference</code> class.
		 */
		public function MetadataReference(metadataReference:String, interfaceReference:String) {
			super();
			this.initObj(metadataReference, interfaceReference);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Getter properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Returns the reference to a MVC interface as defined by the
		 * 	<code>InterfaceReference</code> class.
		 * 
		 * 	@see org.flashapi.hummingbird.utils.constants.MetadataReference
		 */
		public function get metadataReference():String {
			return _metadataReference;
		}
		
		/**
		 * 	Returns the reference to a metadata tag as defined by the
		 * 	<code>MetadataConstant</code> class.
		 * 
		 * 	@see org.flashapi.hummingbird.utils.constants.InterfaceReference
		 */
		public function get interfaceReference():String {
			return _interfaceReference;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 	
		 * 	The reference to a metadata tag as defined by the <code>MetadataConstant</code>
		 * 	class.
		 */
		private var _interfaceReference:String;
		
		/**
		 * 	@private
		 * 	
		 * 	The reference to a MVC interface as defined by the <code>InterfaceReference</code>
		 * 	class.
		 */
		private var _metadataReference:String;
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 	
		 * 	Initializes this <code>MetadataReference</code> instance.
		 */
		private function initObj(metadataReference:String, interfaceReference:String):void {
			_metadataReference = metadataReference;
			_interfaceReference = interfaceReference;
		}
	}
}