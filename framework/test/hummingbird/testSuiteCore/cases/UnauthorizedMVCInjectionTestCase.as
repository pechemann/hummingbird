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
	//  UnauthorizedMVCInjectionTestCase.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 17/10/2013 22:04
	 *  @see http://www.flashapi.org/
	 */
	
	import hummingbird.HummingbirdTester;
	import hummingbird.project.controllers.ControllerInController;
	import hummingbird.project.models.invalidInjections.ControllerInModel;
	import hummingbird.project.models.invalidInjections.ModelInModel;
	import hummingbird.project.models.invalidInjections.OrchestratorInModel;
	import hummingbird.project.orchestrators.invalidInjections.ControllerInOrchestrator;
	import hummingbird.project.orchestrators.invalidInjections.OrchestratorInOrchestrator;
	import hummingbird.project.orchestrators.invalidInjections.ServiceInOrchestrator;
	import hummingbird.project.services.impl.invalidInjections.ControllerInService;
	import hummingbird.project.services.impl.invalidInjections.ModelInService;
	import hummingbird.project.services.impl.invalidInjections.OrchestratorInService;
	import hummingbird.project.services.impl.invalidInjections.ServiceInService;
	import hummingbird.project.views.invalidInjections.ServiceInjectionView;
	import org.flashapi.hummingbird.core.HummingbirdContainer;
	import org.flashapi.hummingbird.core.IHummingbirdContainer;
	
	/**
	 * 	The <code>UnauthorizedMVCInjectionTestCase</code> class represents the test   
	 * 	case for the injection of MVC objects where it is not authorized.
	 */
	public class UnauthorizedMVCInjectionTestCase {
		
		//--------------------------------------------------------------------------
		//
		//  Test cases
		//
		//--------------------------------------------------------------------------
		
		[BeforeClass]
		public static function createContexts() : void  {
			var ioc:IHummingbirdContainer = HummingbirdContainer.getInstance();
			ioc.setApplicationContext(HummingbirdTester.getBasicContext());
			ioc.setApplicationContext(HummingbirdTester.getInvalidDependenciesContext());
		}
		
		//--> IView
		[Test( 	order="1",
				description="This tests the IHummingbirdContainer.doLookup() method with injection of a Service",
				expected="org.flashapi.hummingbird.exceptions.MetadataException")]
		public function IHummingbirdContainer_doLookup_Service_In_View_Test() : void  {
			HummingbirdContainer.getInstance().doLookup(new ServiceInjectionView());
		}
		
		//--> IModel
		[Test( 	order="2",
				description="This tests the IHummingbirdContainer.doLookup() method with injection of a Controller in a Model object",
				expected="org.flashapi.hummingbird.exceptions.MetadataException")]
		public function IHummingbirdContainer_doLookup_Controller_In_Model_Test() : void  {
			HummingbirdContainer.getInstance().doLookup(new ControllerInModel());
		}
		
		[Test( 	order="3",
				description="This tests the IHummingbirdContainer.doLookup() method with injection of an Orchestrator in a Model object",
				expected="org.flashapi.hummingbird.exceptions.MetadataException")]
		public function IHummingbirdContainer_doLookup_Orchestrator_In_Model_Test() : void  {
			HummingbirdContainer.getInstance().doLookup(new OrchestratorInModel());
		}
		
		[Test( 	order="4",
				description="This tests the IHummingbirdContainer.doLookup() method with injection of an Model in a Model object",
				expected="org.flashapi.hummingbird.exceptions.MetadataException")]
		public function IHummingbirdContainer_doLookup_Model_In_Model_Test() : void  {
			HummingbirdContainer.getInstance().doLookup(new ModelInModel());
		}
		
		//--> IController
		[Test( 	order="5",
				description="This tests the IHummingbirdContainer.doLookup() method with injection of a Controller in a Controller object",
				expected="org.flashapi.hummingbird.exceptions.MetadataException")]
		public function IHummingbirdContainer_doLookup_Controller_In_Controller_Test() : void  {
			HummingbirdContainer.getInstance().doLookup(new ControllerInController());
		}
		
		//--> IService
		[Test( 	order="6",
				description="This tests the IHummingbirdContainer.doLookup() method with injection of a Controller in a Service object",
				expected="org.flashapi.hummingbird.exceptions.MetadataException")]
		public function IHummingbirdContainer_doLookup_Controller_In_Service_Test() : void  {
			HummingbirdContainer.getInstance().doLookup(new ControllerInService());
		}
		
		[Test( 	order="7",
				description="This tests the IHummingbirdContainer.doLookup() method with injection of a Model in a Service object",
				expected="org.flashapi.hummingbird.exceptions.MetadataException")]
		public function IHummingbirdContainer_doLookup_Model_In_Service_Test() : void  {
			HummingbirdContainer.getInstance().doLookup(new ModelInService());
		}
		
		[Test( 	order="8",
				description="This tests the IHummingbirdContainer.doLookup() method with injection of a Service in a Service object",
				expected="org.flashapi.hummingbird.exceptions.MetadataException")]
		public function IHummingbirdContainer_doLookup_Service_In_Service_Test() : void  {
			HummingbirdContainer.getInstance().doLookup(new ServiceInService());
		}
		
		[Test( 	order="9",
				description="This tests the IHummingbirdContainer.doLookup() method with injection of an Orchestrator in a Service object",
				expected="org.flashapi.hummingbird.exceptions.MetadataException")]
		public function IHummingbirdContainer_doLookup_Orchestrator_In_Service_Test() : void  {
			HummingbirdContainer.getInstance().doLookup(new OrchestratorInService());
		}
		
		//--> IOrchestrator
		[Test( 	order="10",
				description="This tests the IHummingbirdContainer.doLookup() method with injection of a Controller in an Orchestrator object",
				expected="org.flashapi.hummingbird.exceptions.MetadataException")]
		public function IHummingbirdContainer_doLookup_Controller_In_Orchestrator_Test() : void  {
			HummingbirdContainer.getInstance().doLookup(new ControllerInOrchestrator());
		}
		
		[Test( 	order="11",
				description="This tests the IHummingbirdContainer.doLookup() method with injection of a Service in an Orchestrator object",
				expected="org.flashapi.hummingbird.exceptions.MetadataException")]
		public function IHummingbirdContainer_doLookup_Service_In_Orchestrator_Test() : void  {
			HummingbirdContainer.getInstance().doLookup(new ServiceInOrchestrator());
		}
		
		[Test( 	order="12",
				description="This tests the IHummingbirdContainer.doLookup() method with injection of an Orchestrator in an Orchestrator object",
				expected="org.flashapi.hummingbird.exceptions.MetadataException")]
		public function IHummingbirdContainer_doLookup_Orchestrator_In_Orchestrator_Test() : void  {
			HummingbirdContainer.getInstance().doLookup(new OrchestratorInOrchestrator());
		}
		
		[AfterClass]
		public static function deleteContexts() : void  {
			var ioc:IHummingbirdContainer = HummingbirdContainer.getInstance();
			ioc.clearApplicationContext(HummingbirdTester.getBasicContext());
			ioc.clearApplicationContext(HummingbirdTester.getInvalidDependenciesContext());
		}
	}
}