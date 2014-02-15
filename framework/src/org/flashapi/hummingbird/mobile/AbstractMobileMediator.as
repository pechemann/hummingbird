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
	import mx.core.IVisualElement;
	import org.flashapi.hummingbird.core.HummingbirdContainer;
	import org.flashapi.hummingbird.view.IFlexMobileView;
	import spark.events.ElementExistenceEvent;
	
	// -----------------------------------------------------------
	//  AbstractMobileMediator.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 05/01/2014 17:59
	 *  @see http://www.flashapi.org/
	 */
	
	/**
	 * 	The <code>AbstractMobileMediator</code> class provides the internal process
	 * 	used by the Hummingbird framework for interacting with a Flex Mobile
	 * 	application built with the <code>ViewNavigatorApplication</code> class.
	 * 
	 * 	@since Hummingbird 1.7
	 */
	public class AbstractMobileMediator implements IMobileMediator {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>AbstractMobileMediator</code> instance.
		 */
		public function AbstractMobileMediator() {
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Getter / setter properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@inheritDoc
		 */
		public function get mobileViewExistencePolicy():String {
			return $mobileViewExistencePolicy;
		}
		public function set mobileViewExistencePolicy(value:String):void {
			$mobileViewExistencePolicy = value;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Protected properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Determines how this mediator decides whether to call the <code>finalize()</code>
		 * 	method on a <code>IFlexView</code> object when it is removed from the
		 * 	scene.
		 */
		protected var $mobileViewExistencePolicy:String = MobileViewExistencePolicy.DISPOSE_ON_REMOVE;
		
		//--------------------------------------------------------------------------
		//
		//  Protected properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Event handler invoked each time a new view is added to the navigator
		 * 	object display list.
		 */
		protected function elementAddHandler(e:ElementExistenceEvent):void {
			var elm:IVisualElement = e.element;
			if(elm is IFlexMobileView) {
				HummingbirdContainer.getInstance().doLookup(e.element);
			}
		}
		
		/**
		 * 	Event handler invoked each time a new view is removed from the navigator
		 * 	object display list.
		 */
		protected function elementRemoveHandler(e:ElementExistenceEvent):void {
			var elm:IVisualElement = e.element;
			if(elm is IFlexMobileView && $mobileViewExistencePolicy == MobileViewExistencePolicy.DISPOSE_ON_REMOVE) {
				IFlexMobileView(elm).finalize();
			}
		}
	}
}