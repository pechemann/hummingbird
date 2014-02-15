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
	//  ComponentsStarlingTestCase.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 17/10/2013 22:25
	 *  @see http://www.flashapi.org/
	 */
	
	import flash.display.Stage;
	import hummingbird.HummingbirdTester;
	import org.flashapi.hummingbird.core.IApplicationContext;
	import org.flashapi.hummingbird.Hummingbird;
	import org.flashapi.hummingbird.starling.StarlingID;
	import org.flexunit.Assert;
	import starling.core.Starling;
	
	/**
	 * 	The <code>ComponentsStarlingTestCase</code> class represents the test case  
	 * 	for the pure ActionScript Hummingbird Framework components.
	 */
	public class ComponentsStarlingTestCase {
		
		//--------------------------------------------------------------------------
		//
		//  Test cases
		//
		//--------------------------------------------------------------------------
		
		[Test( 	order="1",
				description="This tests the Hummingbird.getFactory() method" )]
		public function Hummingbird_getFactory_Test():void  {
			Assert.assertNotNull(Hummingbird.getFactory());
		}
		
		[Test( 	order="2",
				description="This tests the Hummingbird.getDefinitionRegistry() method" )]
		public function Hummingbird_getDefinitionRegistry_Test():void  {
			Assert.assertNotNull(Hummingbird.getDefinitionRegistry());
		}
		
		[Test( 	order="3",
				description="This tests the Hummingbird.getVersion() method" )]
		public function Hummingbird_getVersion_Test():void  {
			Assert.assertNotNull(Hummingbird.getVersion());
		}
		
		[Test( 	order="4",
				description="This tests the Hummingbird.getEventDispatcher() method" )]
		public function Hummingbird_getEventDispatcher_Test():void  {
			Assert.assertNotNull(Hummingbird.getEventDispatcher());
		}
		
		[Test( 	order="5",
				description="This tests the Hummingbird.getStage() method" )]
		public function Hummingbird_getStage_Test():void  {
			var context:IApplicationContext = HummingbirdTester.getBasicContext();
			var id:StarlingID = Hummingbird.setApplicationContext(
				context, HummingbirdTester.getStage()
			);
			Assert.assertNotNull(id);
			var stage1:Stage = Hummingbird.getStage();
			Assert.assertNotNull(stage1);
			var stage2:Stage = Hummingbird.getStage(id);
			Assert.assertNotNull(stage2);
			Assert.assertStrictlyEquals(stage1, stage2);
			Hummingbird.clearApplicationContext(context);
			HummingbirdTester.deleteStarling(id);
		}
		
		[Test( 	order="6",
				description="This tests the Hummingbird.getStage() method with an invalid ID",
				expected="org.flashapi.hummingbird.exceptions.StarlingIDException" )]
		public function Hummingbird_getStage_Invalid_ID_Test():void  {
			var context:IApplicationContext = HummingbirdTester.getBasicContext();
			var id:StarlingID = Hummingbird.setApplicationContext(
				context, HummingbirdTester.getStage()
			);
			var invalidId:StarlingID = new StarlingID(null);
			Hummingbird.clearApplicationContext(context);
			HummingbirdTester.deleteStarling(id);
			Hummingbird.getStage(invalidId);
		}
		
		[Test( 	order="7",
				description="This tests the Hummingbird.getStarling() method" )]
		public function Hummingbird_getStarling_Test():void  {
			var context:IApplicationContext = HummingbirdTester.getBasicContext();
			var id:StarlingID = Hummingbird.setApplicationContext(
				context, HummingbirdTester.getStage()
			);
			Assert.assertNotNull(id);
			var starling1:Starling = Hummingbird.getStarling();
			Assert.assertNotNull(starling1);
			var starling2:Starling = Hummingbird.getStarling(id);
			Assert.assertNotNull(starling2);
			Assert.assertStrictlyEquals(starling1, starling2);
			Hummingbird.clearApplicationContext(context);
			HummingbirdTester.deleteStarling(id);
		}
		
		[Test( 	order="8",
				description="This tests the Hummingbird.getStarling() method method with an invalid ID",
				expected="org.flashapi.hummingbird.exceptions.StarlingIDException")]
		public function Hummingbird_getStarling_Invalid_ID_Test():void  {
			var context:IApplicationContext = HummingbirdTester.getBasicContext();
			var id:StarlingID = Hummingbird.setApplicationContext(
				context, HummingbirdTester.getStage()
			);
			var invalidId:StarlingID = new StarlingID(null);
			Hummingbird.clearApplicationContext(context);
			HummingbirdTester.deleteStarling(id);
			Hummingbird.getStarling(invalidId);
		}
	}
}