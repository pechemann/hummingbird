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

package hummingbird.testSuiteFX.cases {
	
	// -----------------------------------------------------------
	//  ViewsManagmentFXTestCase.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 17/10/2013 22:25
	 *  @see http://www.flashapi.org/
	 */
	
	import hummingbird.HummingbirdTester;
	import hummingbird.project.views.BasicFlexView;
	import org.flashapi.hummingbird.HummingbirdFX;
	import org.flashapi.hummingbird.view.IView;
	import org.flexunit.Assert;
	
	/**
	 * 	The <code>ViewsManagmentFXTestCase</code> class represents the test case  
	 * 	for the Flex Hummingbird Framework views managment.
	 */
	public class ViewsManagmentFXTestCase {
		
		//--------------------------------------------------------------------------
		//
		//  Test cases
		//
		//--------------------------------------------------------------------------
		
		[BeforeClass]
		public static function createContexts():void  {
			HummingbirdFX.setApplicationContext(
				HummingbirdTester.getBasicContext(),
				HummingbirdTester.getApplication()
			);
		}
		
		[Test( 	order="1",
				description="This tests the HummingbirdFX.getFactory().createView() method" )]
		public function HummingbirdFX_getFactory_createView_Test():void  {
			var view:IView = HummingbirdFX.getFactory().createView(BasicFlexView);
			Assert.assertNotNull(view);
		}
		
		[Test( 	order="2",
				description="This tests the HummingbirdFX.addToScene() method" )]
		public function HummingbirdFX_addToScene_Test():void  {
			var view:IView = HummingbirdFX.getFactory().createView(BasicFlexView);
			HummingbirdFX.addToScene(view);
			var lastObjAdded:Object = 
				HummingbirdFX.getApplication().getElementAt(HummingbirdFX.getApplication().numElements - 1);
			Assert.assertStrictlyEquals(view, lastObjAdded);
		}
		
		[Test( 	order="3",
				description="This tests the HummingbirdFX.sceneContains() method" )]
		public function HummingbirdFX_sceneContains_Test():void  {
			var view:IView = HummingbirdFX.getFactory().createView(BasicFlexView);
			Assert.assertFalse(HummingbirdFX.sceneContains(view));
			HummingbirdFX.addToScene(view);
			Assert.assertTrue(HummingbirdFX.sceneContains(view));
			HummingbirdFX.removeFromScene(view);
			Assert.assertFalse(HummingbirdFX.sceneContains(view));
		}
		
		[Test( 	order="4",
				description = "This tests the HummingbirdFX.removeFromScene() method",
				expected="ArgumentError")]
		public function HummingbirdFX_removeFromScene_Test():void  {
			var view:IView = HummingbirdFX.getFactory().createView(BasicFlexView);
			HummingbirdFX.addToScene(view);
			HummingbirdFX.removeFromScene(view);
			HummingbirdFX.getApplication().getElementIndex(view as BasicFlexView);
		}
		
		[AfterClass]
		public static function deleteContexts():void  {
			HummingbirdFX.clearApplicationContext(HummingbirdTester.getBasicContext());
		}
	}
}