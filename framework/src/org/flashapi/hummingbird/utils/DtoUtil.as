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
	//  DtoUtil.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 02/06/2013 11:06
	 *  @see http://www.flashapi.org/
	 */
	
	/**
	 * 	The <code>DtoUtil</code> class contains convenient methods for working with
	 * 	custom data transfert object (DTO) classes.
	 */
	public class DtoUtil {
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	A utility function for implementing the <code>toString()</code> method 
		 * 	in custom DTO classes. Overriding the <code>toString()</code> of DTOs is
		 * 	recommended, but not required.
		 * 
		 * 	@param	dto			The reference to the DTO instance for which to
		 * 						get the string representation.
		 * 	@param	className	The name of your custom DTO class.
		 * 	@param	... args	The properties of the DTO class and the properties
		 * 						that you add in your custom DTO class.
		 * 
		 * 	@return	The name of your DTO class and the <code>String</code> value
		 * 			of your <code>...arguments</code> parameter.
		 */
		public static function formatToString(dto:Object, className:String, ... args):String {
			var objDef:String = "[dto " + className + ":";
			var len:int = args.length - 1;
			var property:String;
			for (; len >= 0; len--) {
				property = args[len];
				objDef += " " + property + "=" + dto[property];
				if (len > 0) objDef += ",";
			}
			objDef += "]";
			return objDef;
		}
	}
}