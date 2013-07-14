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
	//  ManifestParser.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 14/07/2013 15:28
	 *  @see http://www.flashapi.org/
	 */
	
	import org.flashapi.hummingbird.enum.ManifestReferenceEnum;
	
	/**
	 * 	The <code>ManifestParser</code> class contains convenient methods for parsing
	 * 	manifest files.
	 */
	public class ManifestParser {
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	A utility function for parsing the Hummingbird <code>MANIFEST.MF</code>
		 * 	file.
		 * 
		 * 	@param manifest The string representation of the Hummingbird
		 * 					<code>MANIFEST.MF</code> file.
		 * 
		 * 	@return	A <code>ManifestInfo</code> object that contains oall information
		 * 			specified in the Hummingbird <code>MANIFEST.MF</code> file.
		 */
		public static function parse(manifest:String):ManifestInfo {
			var inf:ManifestInfo = new ManifestInfo();
			ManifestParser._manifestLength = manifest.length;
			ManifestParser.setInfoProperty(manifest, inf, ManifestReferenceEnum.MANIFEST_VERSION);
			ManifestParser.setInfoProperty(manifest, inf, ManifestReferenceEnum.NAME);
			ManifestParser.setInfoProperty(manifest, inf, ManifestReferenceEnum.SPECIFICATION_TITLE);
			ManifestParser.setInfoProperty(manifest, inf, ManifestReferenceEnum.SPECIFICATION_VENDOR);
			ManifestParser.setVersionProperties(manifest, inf);
			ManifestParser.setInfoProperty(manifest, inf, ManifestReferenceEnum.IMPLEMENTATION_VENDOR);
			ManifestParser.setInfoProperty(manifest, inf, ManifestReferenceEnum.IMPLEMENTATION_TITLE);
			ManifestParser.setInfoProperty(manifest, inf, ManifestReferenceEnum.IMPLEMENTATION_VERSION);
			return inf;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	The number of characters in the manifest file.
		 */
		private static var _manifestLength:int;
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Sets the specification version and specification date of the manifest
		 * 	information object.
		 * 
		 * 	@param	manifest	The string representation of the Hummingbird
		 * 						<code>MANIFEST.MF</code> file.
		 * 	@param	inf			The <code>ManifestInfo</code> object reference.
		 */
		private static function setVersionProperties(manifest:String, inf:ManifestInfo):void {
			var version:String = 
				ManifestParser.getInfoProperty(manifest, ManifestReferenceEnum.SPECIFICATION_VERSION);
			var buffer:Array = version.split(" ");
			inf.specificationVersion = buffer[0];
			var rawDate:String =  buffer[1];
			if (buffer.length > 2) rawDate += " " + buffer[2];
			inf.specificationDate = new Date(Date.parse(rawDate));
		}
		
		/**
		 * 	Sets a property, parsed from the the Hummingbird <code>MANIFEST.MF</code>
		 * 	file, to the specified <code>ManifestInfo</code> object.
		 * 
		 * 	@param	manifest	The string representation of the Hummingbird
		 * 						<code>MANIFEST.MF</code> file.
		 * 	@param	inf			The <code>ManifestInfo</code> object reference.
		 * 	@param	property	The representation of the property to extract.
		 * 						A constant of the <code>ManifestReferenceEnum</code>
		 * 						class.
		 */
		private static function setInfoProperty(manifest:String, inf:ManifestInfo, property:ManifestReference):void {
			inf[property.manifestInfoProperty] = ManifestParser.getInfoProperty(manifest, property);
		}
		
		/**
		 * 	Returns a property parsed from the the Hummingbird <code>MANIFEST.MF</code>
		 * 	file, specified by the <code>property</code> parameter.
		 * 
		 * 	@param	manifest	The string representation of the Hummingbird
		 * 						<code>MANIFEST.MF</code> file.
		 * 	@param	property	The representation of the property to extract.
		 * 						A constant of the <code>ManifestReferenceEnum</code>
		 * 						class.
		 * 
		 * 	@return	A property parsed from the the Hummingbird <code>MANIFEST.MF</code>
		 * 			file.
		 * 
		 * 	@see org.flashapi.hummingbird.enum.ManifestReferenceEnum
		 */
		private static function getInfoProperty(manifest:String, property:ManifestReference):String {
			var propRef:String = property.manifestReference + ":";
			var propPos:int = manifest.indexOf(propRef) + propRef.length;
			var value:String = "";
			var char:String = manifest.charAt(propPos);
			var len:int = manifest.length;
			while (char != "\r" && propPos < ManifestParser._manifestLength) {
				if (char != " " || value != "") value += char;
				char = manifest.charAt(++propPos);
			}
			return value;
		}
	}
}