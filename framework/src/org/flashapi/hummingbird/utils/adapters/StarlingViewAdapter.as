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

package org.flashapi.hummingbird.utils.adapters {
	
	// -----------------------------------------------------------
	//  StarlingViewAdapter.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 15/03/2014 17:52
	 *  @see http://www.flashapi.org/
	 */
	
	import org.flashapi.hummingbird.events.StarlingDependencyEvent;
	import org.flashapi.hummingbird.view.IStarlingView;
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Event;
	
	/**
	 * 	The <code>StarlingViewAdapter</code> adapts a Starling <code>DisplayObject</code>,
	 * 	or <code>DisplayObjectContainer</code>, to let him know when a MVC dependency
	 * 	injection has been performed on it and when the Hummingbird has added it to
	 * 	the scene.
	 */
	public class StarlingViewAdapter extends AbstractViewAdapter {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>StarlingViewAdapter</code> instance.
		 * 
		 *  @param	adaptee	A view object for which to add Hummingbird built-in MVC
		 * 					capabilities.
		 * 
		 * 	@throws IllegalOperationError	org.flashapi.hummingbird.exceptions.InvalidTypeException
		 * 									Throws a <code>InvalidTypeException</code>
		 * 									exception if type of the <code>$adaptee</code>    
		 * 									object does not matchwith the types waited  
		 * 									by this <code>IViewAdapter</code> implementation.
		 */
		public function StarlingViewAdapter(adaptee:IStarlingView) {
			super(adaptee);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overriden protected methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@inheritDoc
		 */
		override protected function onFinalize():void {
			if ($adaptee.hasEventListener(StarlingDependencyEvent.DEPENDENCY_COMPLETE)) {
				$adaptee.removeEventListener(StarlingDependencyEvent.DEPENDENCY_COMPLETE, this.dependencyCompleteHandler);
			}
		}
		
		/**
		 * 	@inheritDoc
		 */
		override protected function onInitialize():void {
			$adaptee.addEventListener(StarlingDependencyEvent.DEPENDENCY_COMPLETE, this.dependencyCompleteHandler);
		}
		
		/**
		 * 	@inheritDoc
		 */
		override protected function checkType():Boolean {
			return  ($adaptee is DisplayObjectContainer || $adaptee is DisplayObject)
					? true : false;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	Event handler invoked when the Dependency Injection process is completely 
		 * 	performed on the adaptee object.
		 */
		private function dependencyCompleteHandler(e:StarlingDependencyEvent):void {
			$adaptee.removeEventListener(StarlingDependencyEvent.DEPENDENCY_COMPLETE, this.dependencyCompleteHandler);
			this.dependencyCompleteCallback();
		}
	}
}