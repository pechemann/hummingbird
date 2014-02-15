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

package hummingbird.project.controllers.invalidInjections {
	
	// -----------------------------------------------------------
	//  InvalidServiceInController.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 28/10/2013 09:58
	 *  @see http://www.flashapi.org/
	 */
	
	import hummingbird.project.controllers.IBasicController;
	import hummingbird.project.services.IInvalidService;
	import hummingbird.project.services.impl.InvalidService;
	import org.flashapi.hummingbird.controller.AbstractController;
	
	/**
	 * 	A controller for testing the injection of an invalid service.
	 */
	[Qualifier(alias="InvalidServiceInController")]
	public final class InvalidServiceInController extends AbstractController implements IBasicController {
		
		//--------------------------------------------------------------------------
		//
		//  Dependencies declaration
		//
		//--------------------------------------------------------------------------
		
		[RegisterClass(type="hummingbird.project.services.impl.InvalidService")]
		public var InvalidServiceRef:Class = InvalidService;
		
		//--------------------------------------------------------------------------
		//
		//  Dependencies injection
		//
		//--------------------------------------------------------------------------
		
		[Service(alias="InvalidService")]
		public var service:IInvalidService;
	}
}