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

package org.flashapi.hummingbird.utils.constants {
	
	// -----------------------------------------------------------
	//  ManifestInfoProperty.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 14/07/2013 16:54
	 *  @see http://www.flashapi.org/
	 */
	
	/**
	 *  The <code>ManifestConstant</code> class is an enumeration of constant values
	 * 	that specify the properties of the Hummingbird <code>MANIFEST.MF</code> file.
	 */
	public class ManifestInfoProperty {
		
		//--------------------------------------------------------------------------
		//
		//  Public constants
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Represents the <code>ManifestInfo.manifestVersion</code> property.
		 */
		public static const MANIFEST_VERSION:String = "manifestVersion";
		
		/**
		 * 	Represents the <code>ManifestInfo.name</code> property.
		 */
		public static const NAME:String = "name";
		
		/**
		 * 	Represents the <code>ManifestInfo.specificationTitle</code> property.
		 */
		public static const SPECIFICATION_TITLE:String = "specificationTitle";
		
		/**
		 * 	Represents the <code>ManifestInfo.specificationVersion</code> property.
		 */
		public static const SPECIFICATION_VERSION:String = "specificationVersion";
		
		/**
		 * 	Represents the <code>ManifestInfo.specificationVendor</code> property.
		 */
		public static const SPECIFICATION_VENDOR:String = "specificationVendor";
		
		/**
		 * 	Represents the <code>ManifestInfo.implementationTitle</code> property.
		 */
		public static const IMPLEMENTATION_TITLE:String = "implementationTitle";
		
		/**
		 * 	Represents the <code>ManifestInfo.implementationVersion</code> property.
		 */
		public static const IMPLEMENTATION_VERSION:String = "implementationVersion";
		
		/**
		 * 	Represents the <code>ManifestInfo.implementationVendor</code> property.
		 */
		public static const IMPLEMENTATION_VENDOR:String = "implementationVendor";
	}
}