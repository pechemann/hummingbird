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
	//  ViewNavigatorMediator.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.1, 05/01/2014 18:01
	 *  @see http://www.flashapi.org/
	 */
	
	import mx.core.FlexGlobals;
	import mx.events.FlexEvent;
	import org.flashapi.hummingbird.exceptions.InvalidApplicationTypeException;
	import spark.components.ViewNavigator;
	import spark.components.ViewNavigatorApplication;
	import spark.events.ElementExistenceEvent;
	
	/**
	 * 	The <code>ViewNavigatorMediator</code> class provides the internal process
	 * 	used by the Hummingbird framework for interacting with a Flex Mobile
	 * 	application built with the <code>ViewNavigatorApplication</code> class.
	 * 
	 * 	@throws org.flashapi.hummingbird.exceptions.InvalidApplicationTypeException
	 * 			Throws a <code>InvalidApplicationTypeException</code> exception if 
	 * 			the top-level application is not an instance of the
	 * 			<code>ViewNavigatorApplication</code> class.
	 * 
	 * 	@since Hummingbird 1.6
	 */
	public class ViewNavigatorMediator extends AbstractMobileMediator {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>ViewNavigatorMediator</code> instance.
		 */
		public function ViewNavigatorMediator() {
			super();
			this.initObj();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Getter / setter properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Returns the reference to the unique view navigator that is managed by
		 * 	the top-level application.
		 */
		public function get navigator():ViewNavigator {
			return _viewNavigator;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	The reference to the top-level application.
		 */
		private var _viewNavigatorApplication:ViewNavigatorApplication;
		
		/**
		 * 	@private
		 * 
		 * 	The reference to the view navigator instantce managed by top-level application.
		 */
		private var _viewNavigator:ViewNavigator;
		
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
		 * 			<code>ViewNavigatorApplication</code> class.
		 */
		private function initObj():void {
			var app:Object = FlexGlobals.topLevelApplication;
			if (app is ViewNavigatorApplication) {
				_viewNavigatorApplication = ViewNavigatorApplication(app);
				_viewNavigatorApplication.addEventListener(FlexEvent.INITIALIZE, this.initializeHandler);
			} else {
				throw new InvalidApplicationTypeException(
					"Application type mismatch: ViewNavigatorApplication required."
				);
			}
		}
		
		/**
		 * 	@private
		 * 
		 * 	Event handler invoked when the top-level application is initialized.
		 */
		private function initializeHandler(e:FlexEvent):void {
			_viewNavigatorApplication.removeEventListener(FlexEvent.INITIALIZE, this.initializeHandler);
			_viewNavigator =  _viewNavigatorApplication.navigator;
			_viewNavigatorApplication.navigator.addEventListener(ElementExistenceEvent.ELEMENT_ADD, this.elementAddHandler);
			_viewNavigatorApplication.navigator.addEventListener(ElementExistenceEvent.ELEMENT_REMOVE, this.elementRemoveHandler);
		}
	}
}