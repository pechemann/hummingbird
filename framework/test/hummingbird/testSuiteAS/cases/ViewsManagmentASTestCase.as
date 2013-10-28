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

package hummingbird.testSuiteAS.cases {
	
	// -----------------------------------------------------------
	//  ViewsManagmentASTestCase.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 17/10/2013 22:25
	 *  @see http://www.flashapi.org/
	 */
	
	import hummingbird.HummingbirdTester;
	import hummingbird.project.views.BasicView;
	import org.flashapi.hummingbird.HummingbirdAS;
	import org.flashapi.hummingbird.view.IView;
	import org.flexunit.Assert;
	
	/**
	 * 	The <code>ViewsManagmentASTestCase</code> class represents the test case  
	 * 	for the pure ActionScript Hummingbird Framework views managment.
	 */
	public class ViewsManagmentASTestCase {
		
		//--------------------------------------------------------------------------
		//
		//  Test cases
		//
		//--------------------------------------------------------------------------
		
		[BeforeClass]
		public static function createContexts():void  {
			HummingbirdAS.setApplicationContext(
				HummingbirdTester.getBasicContext(),
				HummingbirdTester.getStage()
			);
		}
		
		[Test( 	order="1",
				description="This tests the HummingbirdAS.getFactory().createView() method" )]
		public function HummingbirdAS_getFactory_createView_Test():void  {
			var view:IView = HummingbirdAS.getFactory().createView(BasicView);
			Assert.assertNotNull(view);
		}
		
		[Test( 	order="2",
				description="This tests the HummingbirdAS.addToScene() method" )]
		public function HummingbirdAS_addToScene_Test():void  {
			var view:IView = HummingbirdAS.getFactory().createView(BasicView);
			HummingbirdAS.addToScene(view);
			var lastObjAdded:Object = 
				HummingbirdAS.getStage().getChildAt(HummingbirdAS.getStage().numChildren - 1);
			Assert.assertStrictlyEquals(view, lastObjAdded);
		}
		
		[Test( 	order="3",
				description="This tests the HummingbirdAS.sceneContains() method" )]
		public function HummingbirdAS_sceneContains_Test():void  {
			var view:IView = HummingbirdAS.getFactory().createView(BasicView);
			Assert.assertFalse(HummingbirdAS.sceneContains(view));
			HummingbirdAS.addToScene(view);
			Assert.assertTrue(HummingbirdAS.sceneContains(view));
			HummingbirdAS.removeFromScene(view);
			Assert.assertFalse(HummingbirdAS.sceneContains(view));
		}
		
		[Test( 	order="4",
				description = "This tests the HummingbirdAS.removeFromScene() method",
				expected="ArgumentError" )]
		public function HummingbirdAS_removeFromScene_Test():void  {
			var view:IView = HummingbirdAS.getFactory().createView(BasicView);
			HummingbirdAS.addToScene(view);
			HummingbirdAS.removeFromScene(view);
			HummingbirdAS.getStage().getChildIndex(view as BasicView);
		}
		
		/*public var app:DisplayObject;
		
		[Before ( order="5" )]
		public function setUp():void {
			app = HummingbirdTester.getStage().removeChildAt(0)
		}
		
		[Test( 	order="6",
				description="This tests the HummingbirdAS.clearScene() method" )]
		public function HummingbirdAS_clearScene_Test():void  {
			var view:IView = HummingbirdAS.getFactory().createView(BasicView);
			HummingbirdAS.addToScene(view);
			HummingbirdAS.clearScene();
			Assert.assertEquals(HummingbirdAS.getStage().numChildren, 0);
		}
		
		[Before ( order="7" )]
		public function tearDown():void {
			HummingbirdTester.getStage().addChild(app);
		}*/
		
		[AfterClass]
		public static function deleteContexts():void  {
			HummingbirdAS.clearApplicationContext(HummingbirdTester.getBasicContext());
		}
	}
}