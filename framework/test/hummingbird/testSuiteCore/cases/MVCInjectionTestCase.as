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
	//  MVCInjectionTestCase.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 17/10/2013 22:04
	 *  @see http://www.flashapi.org/
	 */
	
	import hummingbird.HummingbirdTester;
	import hummingbird.project.views.BasicView;
	import hummingbird.project.views.invalidInjections.InvalidControllerView;
	import hummingbird.project.views.invalidInjections.InvalidModelView;
	import hummingbird.project.views.invalidInjections.InvalidOrchestratorView;
	import hummingbird.project.views.invalidInjections.InvalidServiceView;
	import org.flashapi.hummingbird.core.HummingbirdContainer;
	import org.flashapi.hummingbird.core.IHummingbirdContainer;
	
	/**
	 * 	The <code>MVCInjectionTestCase</code> class represents the test case for
	 * 	the injection of MVC objects.
	 */
	public class MVCInjectionTestCase {
		
		//--------------------------------------------------------------------------
		//
		//  Test cases
		//
		//--------------------------------------------------------------------------
		
		[BeforeClass]
		public static function createContexts():void  {
			var ioc:IHummingbirdContainer = HummingbirdContainer.getInstance();
			ioc.setApplicationContext(HummingbirdTester.getBasicContext());
			ioc.setApplicationContext(HummingbirdTester.getInvalidDependenciesContext());
		}
		
		[Test( 	order="1",
				description="This tests the IHummingbirdContainer.doLookup() method with injection of valid MVC objects" )]
		public function IHummingbirdContainer_doLookup_Test():void  {
			HummingbirdContainer.getInstance().doLookup(new BasicView());
		}
		
		[Test( 	order="2",
				description="This tests the IHummingbirdContainer.doLookup() method with injection of an invalid Controller",
				expected="org.flashapi.hummingbird.exceptions.InvalidTypeException")]
		public function IHummingbirdContainer_doLookup_Invalid_Controller_Test():void  {
			HummingbirdContainer.getInstance().doLookup(new InvalidControllerView());
		}
		
		[Test( 	order="3",
				description = "This tests the IHummingbirdContainer.doLookup() method with injection of an invalid Model",
				expected="org.flashapi.hummingbird.exceptions.InvalidTypeException")]
		public function IHummingbirdContainer_doLookup_Invalid_Model_Test() : void  {
			HummingbirdContainer.getInstance().doLookup(new InvalidModelView());
		}
		
		[Test( 	order="4",
				description="This tests the IHummingbirdContainer.doLookup() method with injection of an invalid Service",
				expected="org.flashapi.hummingbird.exceptions.InvalidTypeException")]
		public function IHummingbirdContainer_doLookup_Invalid_Service_Test():void  {
			HummingbirdContainer.getInstance().doLookup(new InvalidServiceView());
		}
		
		[Test( 	order="5",
				description="This tests the IHummingbirdContainer.doLookup() method with injection of an invalid Orchestrator",
				expected="org.flashapi.hummingbird.exceptions.InvalidTypeException")]
		public function IHummingbirdContainer_doLookup_Invalid_Orchestrator_Test():void  {
			HummingbirdContainer.getInstance().doLookup(new InvalidOrchestratorView());
		}
		
		[AfterClass]
		public static function deleteContexts():void  {
			var ioc:IHummingbirdContainer = HummingbirdContainer.getInstance();
			ioc.clearApplicationContext(HummingbirdTester.getBasicContext());
			ioc.clearApplicationContext(HummingbirdTester.getInvalidDependenciesContext());
		}
	}
}