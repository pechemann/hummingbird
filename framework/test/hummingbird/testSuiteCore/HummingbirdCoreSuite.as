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

package hummingbird.testSuiteCore {
	
	// -----------------------------------------------------------
	//  HummingbirdCoreSuite.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 17/10/2013 22:22
	 *  @see http://www.flashapi.org/
	 */
	
	import hummingbird.testSuiteCore.cases.ApplicationContextTestCase;
	import hummingbird.testSuiteCore.cases.DefinitionRegistryTestCase;
	import hummingbird.testSuiteCore.cases.FactoryTestCase;
	import hummingbird.testSuiteCore.cases.FinalizableTestCase;
	import hummingbird.testSuiteCore.cases.MVCInjectionTestCase;
	import hummingbird.testSuiteCore.cases.MVCManagmentTestCase;
	import hummingbird.testSuiteCore.cases.SingletonsTestCase;
	import hummingbird.testSuiteCore.cases.UnauthorizedMVCInjectionTestCase;
	import hummingbird.testSuiteCore.cases.ViewAdapterFactoryTestCase;
	
	/**
	 * 	The <code>HummingbirdCoreSuite</code> class represents the test suite for the 
	 * 	Hummingbird Framework core functionalities.
	 */
	[Suite (order="1")]
	[RunWith("org.flexunit.runners.Suite")]
	public class HummingbirdCoreSuite {
		
		//--------------------------------------------------------------------------
		//
		//  Public properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	The test case for the Hummingbird Framework singletons.
		 */
		public var test1:SingletonsTestCase;
		
		/**
		 * 	The test case for the Hummingbird Framework factory.
		 */
		public var test2:FactoryTestCase;
		
		/**
		 * 	The test case for the application context declaration.
		 */
		public var test3:ApplicationContextTestCase;
		
		/**
		 * 	The test case for the injection of MVC objects.
		 */
		public var test4:MVCInjectionTestCase;
		
		/**
		 * 	The test case for the unauthorized injection of MVC objects.
		 */
		public var test5:UnauthorizedMVCInjectionTestCase;
		
		/**
		 * 	The test case for the managment of MVC objects.
		 */
		public var test6:MVCManagmentTestCase;
		
		/**
		 * 	The test case for the Hummingbird definition registry.
		 */
		public var test7:DefinitionRegistryTestCase;
		
		/**
		 * 	The test case for the <code>IFinalizable</code> interface.
		 */
		public var test8:FinalizableTestCase;
		
		/**
		 * 	The test case for the Hummingbird view adapters factory.
		 */
		public var test9:ViewAdapterFactoryTestCase;
	}
}