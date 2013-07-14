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

package org.flashapi.hummingbird.enum {
	
	// -----------------------------------------------------------
	//  ManifestReferenceEnum.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 14/07/2013 16:57
	 *  @see http://www.flashapi.org/
	 */
	
	import org.flashapi.hummingbird.utils.constants.ManifestConstant;
	import org.flashapi.hummingbird.utils.constants.ManifestInfoProperty;
	import org.flashapi.hummingbird.utils.ManifestReference;
	
	/**
	 *  The <code>ManifestReferenceEnum</code> enumeration provides constant 
	 * 	values that specify the matching between the properties of the <code>ManifestInfo</code>
	 * 	class and the information specified by the Hummingbird <code>MANIFEST.MF</code>
	 * 	file.
	 *  
	 * 	@see org.flashapi.hummingbird.utils.ManifestInfo
	 */
	public class ManifestReferenceEnum {
		
		//--------------------------------------------------------------------------
		//
		//  Public constants
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Represents the <code>Manifest-Version</code> property.
		 */
		public static const MANIFEST_VERSION:ManifestReference = new ManifestReference(
			ManifestConstant.MANIFEST_VERSION, ManifestInfoProperty.MANIFEST_VERSION
		);
		
		/**
		 * 	Represents the <code>Name</code> property.
		 */
		public static const NAME:ManifestReference = new ManifestReference(
			ManifestConstant.NAME, ManifestInfoProperty.NAME
		);
		
		/**
		 * 	Represents the <code>Specification-Title</code> property.
		 */
		public static const SPECIFICATION_TITLE:ManifestReference = new ManifestReference(
			ManifestConstant.SPECIFICATION_TITLE, ManifestInfoProperty.SPECIFICATION_TITLE
		);
		
		/**
		 * 	Represents the <code>Specification-Version</code> property.
		 */
		public static const SPECIFICATION_VERSION:ManifestReference = new ManifestReference(
			ManifestConstant.SPECIFICATION_VERSION, ManifestInfoProperty.SPECIFICATION_VERSION
		);
		
		/**
		 * 	Represents the <code>Specification-Vendor</code> property.
		 */
		public static const SPECIFICATION_VENDOR:ManifestReference = new ManifestReference(
			ManifestConstant.SPECIFICATION_VENDOR, ManifestInfoProperty.SPECIFICATION_VENDOR
		);
		
		/**
		 * 	Represents the <code>Implementation-Title</code> property.
		 */
		public static const IMPLEMENTATION_TITLE:ManifestReference = new ManifestReference(
			ManifestConstant.IMPLEMENTATION_TITLE, ManifestInfoProperty.IMPLEMENTATION_TITLE
		);
		
		/**
		 * 	Represents the <code>Implementation-Version</code> property.
		 */
		public static const IMPLEMENTATION_VERSION:ManifestReference = new ManifestReference(
			ManifestConstant.IMPLEMENTATION_VERSION, ManifestInfoProperty.IMPLEMENTATION_VERSION
		);
		
		/**
		 * 	Represents the <code>Implementation-Vendor</code> property.
		 */
		public static const IMPLEMENTATION_VENDOR:ManifestReference = new ManifestReference(
			ManifestConstant.IMPLEMENTATION_VENDOR, ManifestInfoProperty.IMPLEMENTATION_VENDOR
		);
	}
}