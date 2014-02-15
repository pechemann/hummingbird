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
	//  ApplicationContextStarlingTestCase.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 17/10/2013 22:25
	 *  @see http://www.flashapi.org/
	 */
	
	import hummingbird.HummingbirdTester;
	import org.flashapi.hummingbird.core.HummingbirdContainer;
	import org.flashapi.hummingbird.core.HummingbirdEventDispatcher;
	import org.flashapi.hummingbird.core.IApplicationContext;
	import org.flashapi.hummingbird.events.StarlingContextEvent;
	import org.flashapi.hummingbird.Hummingbird;
	import org.flashapi.hummingbird.starling.StarlingID;
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import starling.core.Starling;
	
	/**
	 * 	The <code>ApplicationContextStarlingTestCase</code> class represents the test   
	 * 	case for the Starling Hummingbird Framework application context managment.
	 */
	public class ApplicationContextStarlingTestCase {
		
		//--------------------------------------------------------------------------
		//
		//  Test cases
		//
		//--------------------------------------------------------------------------
		
		[Test( 	order="1",
				description = "This tests the Hummingbird.removeStarling() method",
				expected="org.flashapi.hummingbird.exceptions.StarlingIDException")]
		public function Hummingbird_removeStarling_Test():void  {
			var context:IApplicationContext = HummingbirdTester.getBasicContext();
			_id = Hummingbird.setApplicationContext(
				context, HummingbirdTester.getStage()
			);
			Hummingbird.clearApplicationContext(context);
			var starling:Starling = Hummingbird.removeStarling(_id);
			Assert.assertNotNull(starling);
			starling.stop();
			starling.dispose();
			starling = null;
			Hummingbird.getStarling(_id);
		}
		
		[Test( 	order = "2",
				async,
				description="This tests the Hummingbird.setApplicationContext() method" )]
		public function Hummingbird_setApplicationContext_Test():void  {
			var evtDispatcher:HummingbirdEventDispatcher = Hummingbird.getEventDispatcher();
			evtDispatcher.addEventListener(
				StarlingContextEvent.ROOT_CREATION_COMPLETE,
				Async.asyncHandler(this, this.rootCreationCompleteHandler_test1, 100, null, this.rootCreationCompleteNeverOccurred),
				false, 0, true
			);
			_id = Hummingbird.setApplicationContext(
				HummingbirdTester.getBasicContext(), HummingbirdTester.getStage()
			);
			Assert.assertNotNull(_id);
		}
		
		[Test( 	order="3",
				async,
				description="This tests the Hummingbird.clearApplicationContext() method" )]
		public function Hummingbird_clearApplicationContext_Test():void  {
			var evtDispatcher:HummingbirdEventDispatcher = Hummingbird.getEventDispatcher();
			evtDispatcher.addEventListener(
				StarlingContextEvent.ROOT_CREATION_COMPLETE,
				Async.asyncHandler(this, this.rootCreationCompleteHandler_test2, 100, null, this.rootCreationCompleteNeverOccurred),
				false, 0, true
			);
			_id = Hummingbird.setApplicationContext(
				HummingbirdTester.getBasicContext(), HummingbirdTester.getStage()
			);
			Assert.assertNotNull(_id);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	A global identifier for this test case.
		 */
		private var _id:StarlingID;
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	The async event for the <code>setApplicationContext()</code> method test.
		 */
		private function rootCreationCompleteHandler_test1(e:StarlingContextEvent, passThroughData:Object):void {
			e.target.removeEventListener(
				StarlingContextEvent.ROOT_CREATION_COMPLETE, this.rootCreationCompleteHandler_test1
			);
			Assert.assertTrue(HummingbirdContainer.getInstance().hasMVCObject("BasicModel"));
			Hummingbird.clearApplicationContext(HummingbirdTester.getBasicContext());
			HummingbirdTester.deleteStarling(_id);
		}
		
		/**
		 * 	The async event for the <code>clearApplicationContext()</code> method test.
		 */
		private function rootCreationCompleteHandler_test2(e:StarlingContextEvent, passThroughData:Object):void {
			e.target.removeEventListener(
				StarlingContextEvent.ROOT_CREATION_COMPLETE, this.rootCreationCompleteHandler_test2
			);
			Hummingbird.clearApplicationContext(HummingbirdTester.getBasicContext());
			Assert.assertFalse(HummingbirdContainer.getInstance().hasMVCObject("BasicModel"));
			HummingbirdTester.deleteStarling(_id);
		}
		
		/**
		 * 	The callback method for the <code>StarlingContextEvent.ROOT_CREATION_COMPLETE</code>
		 * 	event failure.
		 */
		private function rootCreationCompleteNeverOccurred(passThroughData:Object):void {
			Assert.fail("StarlingContextEvent.ROOT_CREATION_COMPLETE event never occurred");
		}
	}
}