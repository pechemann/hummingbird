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

package hummingbird.testSuiteCore.cases {
	
	// -----------------------------------------------------------
	//  FinalizableTestCase.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 17/10/2013 22:25
	 *  @see http://www.flashapi.org/
	 */
	
	import hummingbird.HummingbirdTester;
	import hummingbird.project.views.FinalizableView;
	import org.flashapi.hummingbird.core.HummingbirdContainer;
	import org.flashapi.hummingbird.core.IApplicationContext;
	import org.flashapi.hummingbird.core.IHummingbirdContainer;
	import org.flashapi.hummingbird.view.IView;
	import org.flexunit.Assert;
	
	/**
	 * 	The <code>FinalizableTestCase</code> class represents the test case  
	 * 	for the implementation ov the <code>IFinalizable</code> interface of the
	 * 	Hummingbird Framework .
	 */
	public class FinalizableTestCase {
		
		//--------------------------------------------------------------------------
		//
		//  Test cases
		//
		//--------------------------------------------------------------------------
		
		[Test( description="This tests the IView.finalize() method" )]
		public function IView_finalize_Test():void  {
			var ioc:IHummingbirdContainer = HummingbirdContainer.getInstance();
			var context:IApplicationContext = HummingbirdTester.getBasicContext();
			ioc.setApplicationContext(context);
			var view:IView = new FinalizableView();
			ioc.doLookup(view);
			//--> FlexUnit Bug, this should work but it did not:
			//view = null;
			//Assert.assertNotNull(view);
			view.finalize();
			view = null;
			Assert.assertNull(view);
			ioc.clearApplicationContext(context);
		}
	}
}