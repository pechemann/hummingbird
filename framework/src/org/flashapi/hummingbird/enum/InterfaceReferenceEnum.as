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

package org.flashapi.hummingbird.enum {
	
	// -----------------------------------------------------------
	//  InterfaceReferenceEnum.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 14/02/2014 20:56
	 *  @see http://www.flashapi.org/
	 */
	
	import org.flashapi.hummingbird.utils.InterfaceReference;
	
	/**
	 *  The <code>InterfaceReferenceEnum</code> class is an enumeration of constant 
	 * 	values that specify the reference of the MVC interfaces used by the Hummingbird
	 * 	framework.
	 */
	public class InterfaceReferenceEnum {
		
		//--------------------------------------------------------------------------
		//
		//  Public constants
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Represents the <code>IService</code> interface reference.
		 */
		public static const SERVICE:InterfaceReference =
			new InterfaceReference("IService", "service");
		
		/**
		 * 	Represents the <code>IModel</code> interface reference.
		 */
		public static const MODEL:InterfaceReference =
			new InterfaceReference("IModel", "service");
		
		/**
		 * 	Represents the <code>IController</code> interface reference.
		 */
		public static const CONTROLLER:InterfaceReference =
			new InterfaceReference("IController", "controller");
		
		/**
		 * 	Represents the <code>IOrchestrator</code> interface reference.
		 */
		public static const ORCHESTRATOR:InterfaceReference =
			new InterfaceReference("IOrchestrator", "orchestrator");
		
		/**
		 * 	Represents the <code>IView</code> interface reference.
		 */
		public static const VIEW:InterfaceReference =
			new InterfaceReference("IView", "view");
		
		/**
		 * 	Represents the <code>IStarlingView</code> interface reference.
		 */
		public static const STARLING_VIEW:InterfaceReference =
			new InterfaceReference("IStarlingView", "view");
		
		/**
		 * 	Represents the <code>IApplicationContext</code> interface reference.
		 */
		public static const APPLICATION_CONTEXT:InterfaceReference =
			new InterfaceReference("IApplicationContext", "core");
	}
}