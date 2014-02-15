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
	//  MetadataErrorBuilder.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.1, 06/10/2013 19:21
	 *  @see http://www.flashapi.org/
	 */
	
	import org.flashapi.hummingbird.core.HummingbirdBase;
	
	/**
	 * 	You use the <code>MetadataErrorBuilder</code> class for easily building error 
	 * 	messages from the specified data.
	 */
	public class MetadataErrorBuilder {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>MetadataErrorBuilder</code>
		 * 					instance.
		 */
		public function MetadataErrorBuilder() {
			super();
			this.initObj();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Builds and returns the error message.
		 * 
		 * 	@return	The error message built from the specified data.
		 */
		public function build():String {
			HummingbirdBase.getLogger().warn("Invalid metadata found");
			return _message;
		}
		
		public function expected(expected:*, before:String = "", after:String = ""):MetadataErrorBuilder {
			_message += before + "Expected '" + expected + "'" + after;
			return this;
		}
		
		public function got(got:*, before:String = "", after:String = ""):MetadataErrorBuilder {
			_message += before + "got '" + got + "'" + after;
			return this;
		}
		
		/**
		 * 	Adds a dot character [.] at the end of the message.
		 * 
		 * 	@return	The reference to this <code>MetadataErrorBuilder</code> instance.
		 */
		public function dot():MetadataErrorBuilder {
			_message += ".";
			return this;
		}
		
		/**
		 * 	Adds a comma character [,] at the end of the message.
		 * 
		 * 	@return	The reference to this <code>MetadataErrorBuilder</code> instance.
		 */
		public function comma():MetadataErrorBuilder {
			_message += ",";
			return this;
		}
		
		public function message(error:String, before:String = "", after:String = ""):MetadataErrorBuilder {
			_message += before + error + after;
			return this;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	The message currently being built.
		 */
		private var _message:String;
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	Initializes the object.
		 */
		private function initObj():void {
			_message = "";
		}
	}
}