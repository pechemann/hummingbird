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
	//  AdaptersStarlingTestCase.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 16/03/2014 17:05
	 *  @see http://www.flashapi.org/
	 */
	
	import hummingbird.HummingbirdTester;
	import hummingbird.project.views.invalidAdapters.InvalidStarlingView;
	import hummingbird.project.views.StarlingDisplayObjectContainerView;
	import hummingbird.project.views.StarlingDisplayObjectView;
	import org.flashapi.hummingbird.factory.ViewAdapterFactory;
	import org.flashapi.hummingbird.Hummingbird;
	import org.flashapi.hummingbird.starling.StarlingID;
	import org.flashapi.hummingbird.utils.adapters.StarlingViewAdapter;
	import org.flashapi.hummingbird.view.IView;
	
	/**
	 * 	The <code>AdaptersStarlingTestCase</code> class represents the test   
	 * 	case for the Starling Hummingbird Framework views adaptation.
	 */
	public class AdaptersStarlingTestCase {
		
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
				description = "This tests the ViewAdapterFactory.makeFactory() method to create a StarlingViewAdapter object" )]
		public function ViewAdapterFactory_makeFactory_StarlingViewAdapter_Test():void  {
			var factory:ViewAdapterFactory = ViewAdapterFactory.makeFactory(StarlingViewAdapter);
		}
		
		[Test( 	order="2",
				description = "This tests the StarlingViewAdapter adapter object with a valid DisplayObject view" )]
		public function valid_DisplayObject_StarlingViewAdapter_Test():void  {
			var view:IView = Hummingbird.getFactory().createView(StarlingDisplayObjectView);
			Hummingbird.addToScene(view);
		}
		
		[Test( 	order="3",
				description = "This tests the StarlingViewAdapter adapter object with a valid DisplayObjectContainer view" )]
		public function valid_DisplayObjectContainer_StarlingViewAdapter_Test():void  {
			var view:IView = Hummingbird.getFactory().createView(StarlingDisplayObjectContainerView);
			Hummingbird.addToScene(view);
		}
		
		[Test( 	order="4",
				description = "This tests the StarlingViewAdapter adapter object with an invalid view",
				expected="org.flashapi.hummingbird.exceptions.InvalidTypeException")]
		public function invalid_DisplayObject_StarlingViewAdapter_Test():void  {
			var view:IView = Hummingbird.getFactory().createView(InvalidStarlingView);
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