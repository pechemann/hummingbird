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
	//  InterfaceReference.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 14/02/2014 20:56
	 *  @see http://www.flashapi.org/
	 */
	
	/**
	 *  <code>InterfaceReference</code> objects are used by the <code>InterfaceReferenceEnum</code>
	 * 	class to associate a MVC object to its interface.
	 * 
	 * 	@see org.flashapi.hummingbird.enum.InterfaceReferenceEnum
	 */
	public class InterfaceReference {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>InterfaceReference</code> instance
		 * 					with the specified properties.
		 * 
		 * 	@param interfaceType	The reference to the type of the associated
		 * 							interface.
		 * 	@param interfacePackage	The reference to the package name of the associated
		 * 							interface.
		 */
		public function InterfaceReference(interfaceType:String, interfacePackage:String) {
			super();
			this.initObj(interfaceType, interfacePackage);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Getter properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Returns the reference to the type of the associated interface.
		 */
		public function getInterfaceType():String {
			return _interfaceType;
		}
		
		/**
		 * 	Returns the reference to the package name of the associated interface.
		 */
		public function getInterfacePackage():String {
			return _interfacePackage;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private constants
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 	
		 * 	The main path to the Hummingbird Framework pacakge.
		 */
		private static const HUMMINGBIRD_PACKAGE:String = "org.flashapi.hummingbird.";
		
		/**
		 * 	@private
		 * 	
		 * 	Represents two successive semicolons.
		 */
		private static const DOUBLE_SEMICOLON:String = "::";
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 	
		 * 	The reference to the type of the associated interface.
		 */
		private var _interfaceType:String;
		
		/**
		 * 	@private
		 * 	
		 * 	The reference to the package name of the associated interface.
		 */
		private var _interfacePackage:String;
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 	
		 * 	Initializes this <code>InterfaceReference</code> instance.
		 */
		private function initObj(interfaceType:String, interfacePackage:String):void {
			_interfaceType = interfaceType;
			_interfacePackage =
				InterfaceReference.HUMMINGBIRD_PACKAGE + interfacePackage +
				InterfaceReference.DOUBLE_SEMICOLON + interfaceType;
		}
	}
}