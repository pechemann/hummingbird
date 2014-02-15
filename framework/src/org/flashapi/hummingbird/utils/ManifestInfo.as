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

package org.flashapi.hummingbird.utils {
	
	// -----------------------------------------------------------
	//  ManifestInfo.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 14/07/2013 16:00
	 *  @see http://www.flashapi.org/
	 */
	
	/**
	 * 	The <code>ManifestInfo</code> class contains all the information specified
	 * 	in the Hummingbird <code>MANIFEST.MF</code> file.
	 */
	public class ManifestInfo {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>ManifestInfo</code> instance.
		 */
		public function ManifestInfo() {
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	The name of the specification
		 */
		public var manifestVersion:String;
		
		/**
		 * 	The name of the specification
		 */
		public var name:String;
		
		/**
		 * 	The title of the specification.
		 */
		public var specificationTitle:String;
		
		/**
		 * 	The version of the specification.
		 */
		public var specificationVersion:String;
		
		/**
		 * 	The publication date of the specification.
		 */
		public var specificationDate:Date;
		
		/**
		 * 	The vendor of the specification.
		 */
		public var specificationVendor:String;
		
		/**
		 * 	The title of the implementation.
		 */
		public var implementationTitle:String;
		
		/**
		 * 	The build number of the implementation.
		 */
		public var implementationVersion:String;
		
		/**
		 * 	The vendor of the implementation.
		 */
		public var implementationVendor:String;
		
		//--------------------------------------------------------------------------
		//
		//  Public properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Returns the string representation of the Hummingbird <code>MANIFEST.MF</code>
		 * 	file.
		 * 
		 * 	@return	 The string representation of the Hummingbird <code>MANIFEST.MF</code>
		 * 			file.
		 */
		public function toString():String {
			var s:String	= 	"[object ManifestInfo: "
							+	"manifestVersion=" + this.manifestVersion
							+	", name=" + this.name
							+	", specificationTitle=" + this.specificationTitle
							+	", specificationVersion=" + this.specificationVersion
							+	", specificationDate=" + this.specificationDate
							+	", specificationVendor=" + this.specificationVendor
							+	", implementationTitle=" + this.implementationTitle
							+	", implementationVersion=" + this.implementationVersion
							+	", implementationVendor=" + this.implementationVendor
							+	"]";
			return s;
		}
	}
}