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
	//  MetadataReferenceEnum.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 05/07/2013 22:21
	 *  @see http://www.flashapi.org/
	 */
	
	import org.flashapi.hummingbird.utils.InterfaceReference;
	import org.flashapi.hummingbird.utils.MetadataConstant;
	import org.flashapi.hummingbird.utils.MetadataReference;
	
	/**
	 *  The <code>MetadataReferenceEnum</code> enumeration provides constant 
	 * 	values that specify the matching between the reference of the MVC interfaces
	 *  and the metadata used by the Hummingbird framework.
	 */
	public class MetadataReferenceEnum {
		
		//--------------------------------------------------------------------------
		//
		//  Public constants
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Represents the <code>Service</code> metadata reference.
		 */
		public static const SERVICE:MetadataReference = new MetadataReference(
			MetadataConstant.SERVICE, InterfaceReference.SERVICE
		);
		
		/**
		 * 	Represents the <code>Model</code> metadata reference.
		 */
		public static const MODEL:MetadataReference = new MetadataReference(
			MetadataConstant.MODEL, InterfaceReference.MODEL
		);
		
		/**
		 * 	Represents the <code>Controller</code> metadata reference.
		 */
		public static const CONTROLLER:MetadataReference = new MetadataReference(
			MetadataConstant.CONTROLLER, InterfaceReference.CONTROLLER
		);
		
		/**
		 * 	Represents the <code>Orchestrator</code> metadata reference.
		 */
		public static const ORCHESTRATOR:MetadataReference = new MetadataReference(
			MetadataConstant.ORCHESTRATOR, InterfaceReference.ORCHESTRATOR
		);
	}
}