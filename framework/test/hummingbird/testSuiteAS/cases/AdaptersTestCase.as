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

package hummingbird.testSuiteAS.cases {
	
	// -----------------------------------------------------------
	//  AdaptersTestCase.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 16/03/2014 19:39
	 *  @see http://www.flashapi.org/
	 */
	
	import hummingbird.HummingbirdTester;
	import hummingbird.project.views.DisplayObjectContainerView;
	import hummingbird.project.views.DisplayObjectView;
	import hummingbird.project.views.invalidAdapters.InvalidView;
	import org.flashapi.hummingbird.factory.ViewAdapterFactory;
	import org.flashapi.hummingbird.HummingbirdAS;
	import org.flashapi.hummingbird.utils.adapters.ViewAdapter;
	import org.flashapi.hummingbird.view.IView;
	
	/**
	 * 	The <code>AdaptersTestCase</code> class represents the test   
	 * 	case for the ActionScript Hummingbird Framework views adaptation.
	 */
	public class AdaptersTestCase {
		
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
				description = "This tests the ViewAdapterFactory.makeFactory() method to create a StarlingViewAdapter object" )]
		public function ViewAdapterFactory_makeFactory_ASViewAdapter_Test():void  {
			var factory:ViewAdapterFactory = ViewAdapterFactory.makeFactory(ViewAdapter);
		}
		
		[Test( 	order="2",
				description = "This tests the ASViewAdapter adapter object with a valid DisplayObject view" )]
		public function valid_DisplayObject_ASViewAdapter_Test():void  {
			var view:IView = HummingbirdAS.getFactory().createView(DisplayObjectView);
			HummingbirdAS.addToScene(view);
		}
		
		[Test( 	order="3",
				description = "This tests the ASViewAdapter adapter object with a valid DisplayObjectContainer view" )]
		public function valid_DisplayObjectContainer_ASViewAdapter_Test():void  {
			var view:IView = HummingbirdAS.getFactory().createView(DisplayObjectContainerView);
			HummingbirdAS.addToScene(view);
		}
		
		[Test( 	order="4",
				description = "This tests the ASViewAdapter adapter object with an invalid view",
				expected="org.flashapi.hummingbird.exceptions.InvalidTypeException")]
		public function invalid_DisplayObject_ASViewAdapter_Test():void  {
			var view:IView = HummingbirdAS.getFactory().createView(InvalidView);
		}
		
		[AfterClass]
		public static function deleteContexts():void  {
			HummingbirdAS.clearApplicationContext(HummingbirdTester.getBasicContext());
		}
	}
}