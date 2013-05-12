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
	//  MetadataConstant.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 28/04/2013 10:36
	 *  @see http://www.flashapi.org/
	 */
	
	/**
	 *  The <code>MetadataConstant</code> class is an enumeration of constant values
	 * 	that specify the metadata properties of the Hummingbird framework.
	 */
	public class MetadataConstant {
		
		//--------------------------------------------------------------------------
		//
		//  Public constants
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Represents the <code>RegisterClass</code> metadata.
		 */
		public static const REGISTER_CLASS:String = "RegisterClass";
		
		/**
		 * 	Represents the <code>Model</code> metadata.
		 */
		public static const MODEL:String = "Model";
		
		/**
		 * 	Represents the <code>Controller</code> metadata.
		 */
		public static const CONTROLLER:String = "Controller";
		
		/**
		 * 	Represents the <code>Service</code> metadata.
		 */
		public static const SERVICE:String = "Service";
		
		/**
		 * 	Represents the <code>Qualifier</code> metadata.
		 */
		public static const QUALIFIER:String = "Qualifier";
		
		/**
		 * 	Represents the <code>type</code> metadata property.
		 */
		public static const TYPE:String = "type";
		
		/**
		 * 	Represents the <code>alias</code> metadata property.
		 */
		public static const ALIAS:String = "alias";
	}
}