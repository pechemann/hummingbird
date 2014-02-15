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
	//  ComponentsASTestCase.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 17/10/2013 22:25
	 *  @see http://www.flashapi.org/
	 */
	
	import hummingbird.HummingbirdTester;
	import org.flashapi.hummingbird.HummingbirdAS;
	import org.flexunit.Assert;
	
	/**
	 * 	The <code>ComponentsASTestCase</code> class represents the test case  
	 * 	for the pure ActionScript Hummingbird Framework components.
	 */
	public class ComponentsASTestCase {
		
		//--------------------------------------------------------------------------
		//
		//  Test cases
		//
		//--------------------------------------------------------------------------
		
		[Test( 	order="1",
				description="This tests the HummingbirdAS.getFactory() method" )]
		public function HummingbirdAS_getFactory_Test():void  {
			Assert.assertNotNull(HummingbirdAS.getFactory());
		}
		
		[Test( 	order="2",
				description="This tests the HummingbirdAS.getDefinitionRegistry() method" )]
		public function HummingbirdAS_getDefinitionRegistry_Test():void  {
			Assert.assertNotNull(HummingbirdAS.getDefinitionRegistry());
		}
		
		[Test( 	order="3",
				description="This tests the HummingbirdAS.getVersion() method" )]
		public function HummingbirdAS_getVersion_Test():void  {
			Assert.assertNotNull(HummingbirdAS.getVersion());
		}
		
		[Test( 	order="4",
				description="This tests the HummingbirdAS.getStage() method" )]
		public function HummingbirdAS_getStage_Test():void  {
			HummingbirdAS.setApplicationContext(
				HummingbirdTester.getBasicContext(), HummingbirdTester.getStage()
			);
			Assert.assertNotNull(HummingbirdAS.getStage());
			HummingbirdAS.clearApplicationContext(HummingbirdTester.getBasicContext());
		}
		
		[Test( 	order="5",
				description="This tests the HummingbirdAS.getEventDispatcher() method" )]
		public function HummingbirdAS_getEventDispatcher_Test():void  {
			Assert.assertNotNull(HummingbirdAS.getEventDispatcher());
		}
	}
}