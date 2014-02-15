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
	//  DefinitionRegistryTestCase.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 17/10/2013 22:25
	 *  @see http://www.flashapi.org/
	 */
	
	import hummingbird.HummingbirdTester;
	import org.flashapi.hummingbird.core.HummingbirdContainer;
	import org.flashapi.hummingbird.core.IHummingbirdContainer;
	import org.flashapi.hummingbird.factory.DefinitionRegistry;
	import org.flashapi.hummingbird.factory.IDefinitionRegistry;
	import org.flexunit.Assert;
	
	/**
	 * 	The <code>DefinitionRegistryTestCase</code> class represents the test case  
	 * 	for the Hummingbird Framework definition registry.
	 */
	public class DefinitionRegistryTestCase {
		
		//--------------------------------------------------------------------------
		//
		//  Test cases
		//
		//--------------------------------------------------------------------------
		
		[BeforeClass]
		public static function createContexts():void  {
			var ioc:IHummingbirdContainer = HummingbirdContainer.getInstance();
			ioc.setApplicationContext(HummingbirdTester.getBasicContext());
		}
		
        [Test( 	order="1",
				description="This tests the IDefinitionRegistry.getModel() method with a valid alias")]
		public function IDefinitionRegistry_getModel_Test():void  {
			var registery:IDefinitionRegistry = new DefinitionRegistry(HummingbirdContainer);
			Assert.assertNotNull(registery.getModel("BasicModel"));
		}
		
		[Test( 	order="2",
				description="This tests the IDefinitionRegistry.getModel() method with an invalid alias",
				expected="org.flashapi.hummingbird.exceptions.NoSuchDefinitionException")]
		public function IDefinitionRegistry_getModel_invalid_alias_Test():void  {
			var registery:IDefinitionRegistry = new DefinitionRegistry(HummingbirdContainer);
			registery.getModel("UndefinedModel");
		}
		
		[Test( 	order="3",
				description="This tests the IDefinitionRegistry.getModel() method with an invalid type",
				expected="org.flashapi.hummingbird.exceptions.InvalidTypeException")]
		public function IDefinitionRegistry_getModel_invalid_type_Test():void  {
			var registery:IDefinitionRegistry = new DefinitionRegistry(HummingbirdContainer);
			registery.getModel("BasicController");
		}
		
		[Test( 	order="4",
				description="This tests the IDefinitionRegistry.getController() method with a valid alias")]
		public function IDefinitionRegistry_getController_Test():void  {
			var registery:IDefinitionRegistry = new DefinitionRegistry(HummingbirdContainer);
			Assert.assertNotNull(registery.getController("BasicController"));
		}
		
		[Test( 	order="5",
				description="This tests the IDefinitionRegistry.getController() method with an invalid alias",
				expected="org.flashapi.hummingbird.exceptions.NoSuchDefinitionException")]
		public function IDefinitionRegistry_getController_invalid_alias_Test():void  {
			var registery:IDefinitionRegistry = new DefinitionRegistry(HummingbirdContainer);
			registery.getController("UndefinedController");
		}
		
		[Test( 	order="6",
				description="This tests the IDefinitionRegistry.getController() method with an invalid type",
				expected="org.flashapi.hummingbird.exceptions.InvalidTypeException")]
		public function IDefinitionRegistry_getController_invalid_type_Test():void  {
			var registery:IDefinitionRegistry = new DefinitionRegistry(HummingbirdContainer);
			registery.getController("BasicModel");
		}
		
		[Test( 	order="7",
				description="This tests the IDefinitionRegistry.getService() method with a valid alias")]
		public function IDefinitionRegistry_getService_Test():void  {
			var registery:IDefinitionRegistry = new DefinitionRegistry(HummingbirdContainer);
			Assert.assertNotNull(registery.getService("BasicService"));
		}
		
		[Test( 	order="8",
				description="This tests the IDefinitionRegistry.getService() method with an invalid alias",
				expected="org.flashapi.hummingbird.exceptions.NoSuchDefinitionException")]
		public function IDefinitionRegistry_getService_invalid_alias_Test():void  {
			var registery:IDefinitionRegistry = new DefinitionRegistry(HummingbirdContainer);
			registery.getService("UndefinedService");
		}
		
		[Test( 	order="9",
				description="This tests the IDefinitionRegistry.getService() method with an invalid type",
				expected="org.flashapi.hummingbird.exceptions.InvalidTypeException")]
		public function IDefinitionRegistry_getService_invalid_type_Test():void  {
			var registery:IDefinitionRegistry = new DefinitionRegistry(HummingbirdContainer);
			registery.getService("BasicModel");
		}
		
		[Test( 	order="10",
				description="This tests the IDefinitionRegistry.getOrchestrator() method with a valid alias")]
		public function IDefinitionRegistry_getOrchestrator_Test():void  {
			var registery:IDefinitionRegistry = new DefinitionRegistry(HummingbirdContainer);
			Assert.assertNotNull(registery.getOrchestrator("BasicOrchestrator"));
		}
		
		[Test( 	order="11",
				description="This tests the IDefinitionRegistry.getOrchestrator() method with an invalid alias",
				expected="org.flashapi.hummingbird.exceptions.NoSuchDefinitionException")]
		public function IDefinitionRegistry_getOrchestrator_invalid_alias_Test():void  {
			var registery:IDefinitionRegistry = new DefinitionRegistry(HummingbirdContainer);
			registery.getOrchestrator("UndefinedOrchestrator");
		}
		
		[Test( 	order="12",
				description="This tests the IDefinitionRegistry.getOrchestrator() method with an invalid type",
				expected="org.flashapi.hummingbird.exceptions.InvalidTypeException")]
		public function IDefinitionRegistry_getOrchestrator_invalid_type_Test():void  {
			var registery:IDefinitionRegistry = new DefinitionRegistry(HummingbirdContainer);
			registery.getOrchestrator("BasicModel");
		}
		
		[Test( 	order="13",
				description="This tests the IDefinitionRegistry.hasDefinition() method")]
		public function IDefinitionRegistry_hasDefinition_Test():void  {
			var registery:IDefinitionRegistry = new DefinitionRegistry(HummingbirdContainer);
			Assert.assertTrue(registery.hasDefinition("BasicModel"));
			Assert.assertFalse(registery.hasDefinition("UndefinedModel"));
		}
		
		[Test( 	order="14",
				description="This tests the IDefinitionRegistry.removeDefinition() method")]
		public function IDefinitionRegistry_removeDefinition_Test():void  {
			var registery:IDefinitionRegistry = new DefinitionRegistry(HummingbirdContainer);
			Assert.assertNotNull(registery.removeDefinition("RemovableController"));
			Assert.assertFalse(registery.hasDefinition("RemovableController"));
		}
		
		[Test( 	order="15",
				description="This tests the IDefinitionRegistry.removeDefinition() method with an invalid alias",
				expected="org.flashapi.hummingbird.exceptions.NoSuchDefinitionException")]
		public function IDefinitionRegistry_removeDefinition_invalid_alias_Test():void  {
			var registery:IDefinitionRegistry = new DefinitionRegistry(HummingbirdContainer);
			registery.removeDefinition("UndefinedOrchestrator");
		}
		
		[AfterClass]
		public static function deleteContexts():void  {
			var ioc:IHummingbirdContainer = HummingbirdContainer.getInstance();
			ioc.clearApplicationContext(HummingbirdTester.getBasicContext());
		}
	}
}