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

package hummingbird.testSuiteCore.cases {
	
	// -----------------------------------------------------------
	//  ViewAdapterFactoryTestCase.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 16/03/2014 18:38
	 *  @see http://www.flashapi.org/
	 */
	
	import flash.utils.getQualifiedClassName;
	import org.flashapi.hummingbird.factory.ViewAdapterFactory;
	import org.flashapi.hummingbird.utils.adapters.StarlingViewAdapter;
	import org.flexunit.Assert;
	
	/**
	 * 	The <code>ViewAdapterFactoryTestCase</code> class represents the test case  
	 * 	for the Hummingbird Framework view adapters factory.
	 */
	public class ViewAdapterFactoryTestCase {
		
		//--------------------------------------------------------------------------
		//
		//  Test cases
		//
		//--------------------------------------------------------------------------
		
		[Test( 	order="1",
				description = "This tests the ViewAdapterFactory constructor illegal call",
				expected="flash.errors.IllegalOperationError" )]
		public function new_ViewAdapterFactory_Test():void  {
			var factory:ViewAdapterFactory = new ViewAdapterFactory(null);
		}
		
		[Test( 	order="2",
				description = "This tests the ViewAdapterFactory.getViewAdapterClassRef() method")]
		public function ViewAdapterFactory_getViewAdapterClassRef_Test():void  {
			var factory:ViewAdapterFactory = ViewAdapterFactory.makeFactory(StarlingViewAdapter);
			var classRef:Class = factory.getViewAdapterClassRef();
			Assert.assertTrue(getQualifiedClassName(classRef) == this.STARLING_VIEW_ADAPTER_CLASS_REF);
			Assert.assertFalse(getQualifiedClassName(classRef) == this.AS_VIEW_ADAPTER_CLASS_REF);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	The qualified class name of the <code>StarlingViewAdapter</code> class.
		 */
		private const STARLING_VIEW_ADAPTER_CLASS_REF:String =
			"org.flashapi.hummingbird.utils.adapters::StarlingViewAdapter";
		
		/**
		 * 	The qualified class name of the <code>ASViewAdapter</code> class.
		 */
		private const AS_VIEW_ADAPTER_CLASS_REF:String =
			"org.flashapi.hummingbird.utils.adapters::ASViewAdapter";
	}
}