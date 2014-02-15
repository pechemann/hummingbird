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

package hummingbird.testSuiteStarling.cases {
	
	// -----------------------------------------------------------
	//  ViewsManagmentStarlingTestCase.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 27/10/2013 17:38
	 *  @see http://www.flashapi.org/
	 */
	
	import hummingbird.HummingbirdTester;
	import hummingbird.project.views.BasicStarlingView;
	import org.flashapi.hummingbird.Hummingbird;
	import org.flashapi.hummingbird.starling.StarlingID;
	import org.flashapi.hummingbird.view.IView;
	import org.flexunit.Assert;
	import starling.display.DisplayObjectContainer;
	
	/**
	 * 	The <code>ViewsManagmentStarlingTestCase</code> class represents the test   
	 * 	case for the Starling Hummingbird Framework views managment.
	 */
	public class ViewsManagmentStarlingTestCase {
		
		//--------------------------------------------------------------------------
		//
		//  Test cases
		//
		//--------------------------------------------------------------------------
		
		[BeforeClass]
		public static function createContexts():void  {
			_id = Hummingbird.setApplicationContext(
				HummingbirdTester.getBasicContext(),
				HummingbirdTester.getStage()
			);
		}
		
		[Test( 	order="1",
				description="This tests the Hummingbird.getFactory().createView() method" )]
		public function Hummingbird_getFactory_createView_Test():void  {
			var view:IView = Hummingbird.getFactory().createView(BasicStarlingView);
			Assert.assertNotNull(view);
		}
		
		[Test( 	order="2",
				description="This tests the Hummingbird.addToScene() method" )]
		public function Hummingbird_addToScene_Test():void  {
			var view:IView = Hummingbird.getFactory().createView(BasicStarlingView);
			Hummingbird.addToScene(view);
			var root:DisplayObjectContainer = Hummingbird.getStarling().root as DisplayObjectContainer;
			var lastObjAdded:Object = 
				root.getChildAt(root.numChildren - 1);
			Assert.assertStrictlyEquals(view, lastObjAdded);
		}
		
		[Test( 	order="3",
				description="This tests the Hummingbird.sceneContains() method" )]
		public function Hummingbird_sceneContains_Test():void  {
			var view:IView = Hummingbird.getFactory().createView(BasicStarlingView);
			Assert.assertFalse(Hummingbird.sceneContains(view));
			Hummingbird.addToScene(view);
			Assert.assertTrue(Hummingbird.sceneContains(view));
			Hummingbird.removeFromScene(view);
			Assert.assertFalse(Hummingbird.sceneContains(view));
		}
		
		[Test( 	order="4",
				description="This tests the Hummingbird.removeFromScene() method" )]
		public function Hummingbird_removeFromScene_Test():void  {
			var view:IView = Hummingbird.getFactory().createView(BasicStarlingView);
			Hummingbird.addToScene(view);
			Hummingbird.removeFromScene(view);
			var root:DisplayObjectContainer = Hummingbird.getStarling().root as DisplayObjectContainer;
			Assert.assertEquals(root.getChildIndex(view as BasicStarlingView), -1);
		}
		
		[Test( 	order="5",
				description="This tests the Hummingbird.clearScene() method" )]
		public function Hummingbird_clearScene_Test():void  {
			var view:IView = Hummingbird.getFactory().createView(BasicStarlingView);
			Hummingbird.addToScene(view);
			Hummingbird.clearScene();
			var root:DisplayObjectContainer = Hummingbird.getStarling().root as DisplayObjectContainer;
			Assert.assertEquals(root.numChildren, 0);
		}
		
		[AfterClass]
		public static function deleteContexts():void  {
			Hummingbird.clearApplicationContext(HummingbirdTester.getBasicContext());
			HummingbirdTester.deleteStarling(_id);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	A global identifier for this test case.
		 */
		private static var _id:StarlingID;
	}
}