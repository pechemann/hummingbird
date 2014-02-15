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

package hummingbird.project.models.invalidInjections {
	
	// -----------------------------------------------------------
	//  ModelInModel.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 28/10/2013 09:58
	 *  @see http://www.flashapi.org/
	 */
	
	import hummingbird.project.models.BasicModel;
	import hummingbird.project.models.IBasicModel;
	import org.flashapi.hummingbird.model.AbstractModel;
	
	/**
	 * 	A model for testing the invalid injection of a  model.
	 */
	[Qualifier(alias="ModelInModel")]
	public class ModelInModel extends AbstractModel {
		
		//--------------------------------------------------------------------------
		//
		//  Dependencies declaration
		//
		//--------------------------------------------------------------------------
		
		[RegisterClass(type="hummingbird.project.models.BasicModel")]
		public var BasicModelRef:Class = BasicModel;
		
		//--------------------------------------------------------------------------
		//
		//  Dependencies injection
		//
		//--------------------------------------------------------------------------
		
		[Model(alias="BasicModel")]
		public var model:IBasicModel;
	}
}