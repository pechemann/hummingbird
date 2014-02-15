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

package org.flashapi.hummingbird.mobile {
	
	// -----------------------------------------------------------
	//  SplitViewNavigatorMediator.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 05/01/2014 17:38
	 *  @see http://www.flashapi.org/
	 */
	
	import mx.core.FlexGlobals;
	import org.flashapi.hummingbird.exceptions.InvalidApplicationTypeException;
	import spark.components.Application;
	import spark.components.SplitViewNavigator;
	import spark.components.supportClasses.ViewNavigatorBase;
	import spark.events.ElementExistenceEvent;
	
	/**
	 * 	The <code>SplitViewNavigatorMediator</code> class provides the internal 
	 * 	process used by the Hummingbird framework for interacting with a Flex Mobile
	 * 	application built with the <code>SplitViewNavigator</code> class.
	 * 
	 * 	@throws org.flashapi.hummingbird.exceptions.InvalidApplicationTypeException
	 * 			Throws a <code>InvalidApplicationTypeException</code> exception if 
	 * 			the top-level application is not an instance of the
	 * 			<code>spark.components.Application</code> class.
	 * 
	 * 	@since Hummingbird 1.7
	 */
	public class SplitViewNavigatorMediator extends AbstractMobileMediator {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>SplitViewNavigatorMediator</code>
		 * 					instance.
		 */
		public function SplitViewNavigatorMediator() {
			super();
			this.initObj();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Getter / setter properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Gets or sets the <code>SplitViewNavigator</code> instance managed
		 * 	by this mediator object.
		 */
		public function get splitViewNavigator():SplitViewNavigator {
			return _splitViewNavigator;
		}
		public function set splitViewNavigator(value:SplitViewNavigator):void {
			if (_splitViewNavigator) {
				_splitViewNavigator = null;
			}
			_splitViewNavigator = value;
			if (value) {
				var len:int = _splitViewNavigator.numViewNavigators - 1;
				while (len >= 0) {
					var vnb:ViewNavigatorBase = _splitViewNavigator.getViewNavigatorAt(len);
					vnb.addEventListener(ElementExistenceEvent.ELEMENT_ADD, this.elementAddHandler);
					vnb.addEventListener(ElementExistenceEvent.ELEMENT_REMOVE, this.elementRemoveHandler);
					--len;
				}
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	The reference to the <code>SplitViewNavigator</code> instance managed
		 * 	by this mediator object.
		 */
		private var _splitViewNavigator:SplitViewNavigator;
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	Initializes this mediator object.
		 * 
		 * 	@throws org.flashapi.hummingbird.exceptions.InvalidApplicationTypeException
		 * 			Throws a <code>InvalidApplicationTypeException</code> exception if 
		 * 			the top-level application is not an instance of the
		 * 			<code>spark.components.Application</code> class.
		 */
		private function initObj():void {
			var app:Object = FlexGlobals.topLevelApplication;
			var isApplication:Boolean = Boolean(app is Application);
			if (isApplication == false) {
				throw new InvalidApplicationTypeException(
					"Application type mismatch: spark.components.Application required."
				);
			}
		}
	}
}