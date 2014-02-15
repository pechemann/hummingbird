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

package org.flashapi.hummingbird.core {
	
	// -----------------------------------------------------------
	//  HummingbirdVersion.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 2.0.0, 28/04/2013 10:36
	 *  @see http://www.flashapi.org/
	 */
	
	import flash.utils.ByteArray;
	import org.flashapi.hummingbird.utils.ManifestInfo;
	import org.flashapi.hummingbird.utils.ManifestParser;
	
	/**
	 *	Class that exposes the Hummingbird version. Fetches the "implementation-version"
	 *  manifest attribute from the SWC file.
	 */
	public class HummingbirdVersion {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>HummingbirdVersion</code>
		 * 					instance.
		 */
		public function HummingbirdVersion() {
			super();
			this.initObj();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Returns the full release string of the present Hummingbird codebase.
		 * 
		 * 	@return The full release string of the present Hummingbird codebase.
		 */
		public function getRelease():String {
			return _manifestInf.specificationVersion;
		}
		
		/**
		 * 	Returns a <code>Date</code> object that represents the release date of
		 * 	the present Hummingbird codebase.
		 * 
		 * 	@return The release date of the present Hummingbird codebase.
		 */
		public function getReleaseDate():Date {
			return _manifestInf.specificationDate;
		}
		
		/**
		 * 	Returns the string representation of the present Hummingbird codebase.
		 * 
		 * 	@return	 The string representation of the present Hummingbird codebase.
		 */
		public function toString():String {
			var s:String	= 	"[object HummingbirdVersion: "
							+	"release=" + this.getRelease()
							+	", date=" + this.getReleaseDate()
							+	"]";
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
		 * 	The embeded MANIFEST.MF file.
		 */
		[Embed(source="../../../../META-INF/MANIFEST.MF", mimeType="application/octet-stream")]
		private static const MANIFEST:Class;
		
		/**
		 * 	@private
		 * 
		 * 	The reference to the <code>ManifestInfo</code> object that contains all 
		 * 	the information specified by the Hummingbird <code>MANIFEST.MF</code> file.
		 */
		private var _manifestInf:ManifestInfo;
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	Initializes this <code>HummingbirdVersion</code> instance.
		 */
		private function initObj():void {
			var ba:ByteArray = new MANIFEST();
			var manifest:String = ba.readUTFBytes(ba.length);
			_manifestInf = ManifestParser.parse(manifest);
		}
	}
}