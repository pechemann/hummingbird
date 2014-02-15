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
	//  TabbedViewNavigatorMediator.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.1, 05/01/2014 18:02
	 *  @see http://www.flashapi.org/
	 */
	
	import flash.utils.Dictionary;
	import mx.core.FlexGlobals;
	import mx.events.CollectionEvent;
	import mx.events.FlexEvent;
	import org.flashapi.hummingbird.exceptions.InvalidApplicationTypeException;
	import spark.components.supportClasses.ViewNavigatorBase;
	import spark.components.TabbedViewNavigator;
	import spark.components.TabbedViewNavigatorApplication;
	import spark.events.ElementExistenceEvent;
	
	/**
	 * 	The <code>TabbedViewNavigatorMediator</code> class provides the internal process
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
	public class TabbedViewNavigatorMediator extends AbstractMobileMediator {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>TabbedViewNavigatorMediator</code> instance.
		 */
		public function TabbedViewNavigatorMediator() {
			super();
			this.initObj();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Getter / setter properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Returns the reference to the unique tabbed view navigator that is 
		 * 	managed by the top-level application.
		 */
		public function get tabbedViewNavigator():TabbedViewNavigator {
			return _tabbedViewNavigator;
		}
		
		/**
		 * 	Returns the reference to the selected view navigator for the
		 * 	<code>tabbedViewNavigator</code> property.
		 * 
		 * 	@see #tabbedViewNavigator
		 */
		public function get selectedNavigator():ViewNavigatorBase {
			return _tabbedViewNavigator.selectedNavigator;
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
		private var _tabbedViewNavigatorApplication:TabbedViewNavigatorApplication;
		
		/**
		 * 	@private
		 * 
		 * 	The reference to the tabbed view navigator instantce managed by top-level
		 *  application.
		 */
		private var _tabbedViewNavigator:TabbedViewNavigator;
		
		/**
		 * 	@private
		 * 
		 * 	The internal map that contains all the <code>ViewNavigatorBase</code>
		 * 	objects for the current Flex Mobile Application.
		 */
		private var _navigatorsRef:Dictionary;
		
		/**
		 * 	@private
		 * 
		 * 	The number of <code>ViewNavigatorBase</code> objects used within the
		 * 	current Flex Mobile Application.
		 */
		private var _navigatorsCollSize:int;
		
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
			if (app is TabbedViewNavigatorApplication) {
				_tabbedViewNavigatorApplication = TabbedViewNavigatorApplication(app);
				_tabbedViewNavigatorApplication.addEventListener(FlexEvent.INITIALIZE, this.initializeHandler);
			} else {
				throw new InvalidApplicationTypeException(
					"Application type mismatch: TabbedViewNavigatorApplication required."
				);
			}
		}
		
		/**
		 * 	@private
		 * 
		 * 	Event handler invoked when the top-level application is initialized.
		 */
		private function initializeHandler(e:FlexEvent):void {
			_tabbedViewNavigatorApplication.removeEventListener(FlexEvent.INITIALIZE, this.initializeHandler);
			_navigatorsRef = new Dictionary();
			_tabbedViewNavigator = _tabbedViewNavigatorApplication.tabbedNavigator;
			var tempNav:Vector.<ViewNavigatorBase> = _tabbedViewNavigator.navigators;
			_navigatorsCollSize = tempNav.length;
			var len:int = _navigatorsCollSize - 1;
			while (len >= 0) {
				var vnb:ViewNavigatorBase = tempNav[len];
				vnb.addEventListener(ElementExistenceEvent.ELEMENT_ADD, this.elementAddHandler);
				vnb.addEventListener(ElementExistenceEvent.ELEMENT_REMOVE, this.elementRemoveHandler);
				_navigatorsRef[vnb.uid] = vnb;
				--len;
			}
			_tabbedViewNavigatorApplication.tabbedNavigator.addEventListener(
				CollectionEvent.COLLECTION_CHANGE, this.navigatorsChangeHandler
			);
		}
		
		/**
		 * 	@private
		 * 
		 * 	Event handler invoked each time the navigator object is modified.
		 */
		private function navigatorsChangeHandler(e:CollectionEvent):void {
			var tempNav:Vector.<ViewNavigatorBase> = _tabbedViewNavigatorApplication.tabbedNavigator.navigators;
			var len:int =  tempNav.length;
			var sizeDifference:int;
			var vnb:ViewNavigatorBase;
			if (_navigatorsCollSize == len) return;
			else if (_navigatorsCollSize > len) {
				sizeDifference = _navigatorsCollSize - len;
				for each (vnb in _navigatorsRef) {
					if (tempNav.indexOf(vnb) == -1) {
						vnb.removeEventListener(ElementExistenceEvent.ELEMENT_ADD, this.elementAddHandler);
						vnb.removeEventListener(ElementExistenceEvent.ELEMENT_REMOVE, this.elementRemoveHandler);
						delete _navigatorsRef[vnb.uid];
						--sizeDifference;
					}
					if (sizeDifference == 0) break;
				}
			} else {
				sizeDifference = len - _navigatorsCollSize;
				for (; len >= 0; len-- ) {
					vnb = tempNav[len];
					if (_navigatorsRef[vnb.uid] == undefined) {
						vnb.addEventListener(ElementExistenceEvent.ELEMENT_ADD, this.elementAddHandler);
						vnb.addEventListener(ElementExistenceEvent.ELEMENT_REMOVE, this.elementRemoveHandler);
						_navigatorsRef[vnb.uid] = vnb;
						--sizeDifference;
					}
					if (sizeDifference == 0) break;
				}
			}
			if (tempNav != null) {
				_navigatorsCollSize = tempNav.length;
			} else {
				_navigatorsCollSize = 0;
			}
		}
	}
}