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

package org.flashapi.hummingbird.view {
	
	// -----------------------------------------------------------
	//  AbstractStarlingSpriteView.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 01/05/2013 11:01
	 *  @see http://www.flashapi.org/
	 */
	
	import org.flashapi.hummingbird.events.StarlingDependencyEvent;
	import starling.display.Sprite;
	import starling.events.Event;
	
	//--------------------------------------------------------------------------
	//
	//  Events
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Dispatched when the dependency injection is complete on this <code>IView</code>
	 * 	object.
	 *
	 *  @eventType org.flashapi.hummingbird.events.StarlingDependencyEvent.DEPENDENCY_COMPLETE
	 */
	[Event(name="dependencyComplete", type="org.flashapi.hummingbird.events.StarlingDependencyEvent")]
	
	/**
	 * 	Convenient superclass for view implementations based on the Starling 
	 * 	<code>Sprite</code> class, using the Template Method design pattern.
	 * 
	 * 	@see org.flashapi.hummingbird.view.AbstractStarlingMovieClipView
	 */
	public class AbstractStarlingSpriteView extends Sprite implements IStarlingView {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>AbstractSpriteView</code> instance.
		 */
		public function AbstractStarlingSpriteView() {
			super();
			this.initObj();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@inheritDoc
		 */
		public function finalize():void { }
		
		//--------------------------------------------------------------------------
		//
		//  Protected methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Called when the Dependency Injection process is completely performed on
		 * 	this MVC object.
		 */
		protected function onDependencyComplete():void { }
		
		/**
		 * 	Called when this display object is added to stage.
		 */
		protected function onAddedToStage():void { }
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	Initializes this MVC object.
		 */
		private function initObj():void {
			this.addEventListener(StarlingDependencyEvent.DEPENDENCY_COMPLETE, this.dependencyCompleteHandler);
			this.addEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
		}
		
		/**
		 * 	@private
		 * 
		 * 	Event handler invoked when the Dependency Injection process is completely 
		 * 	performed on this MVC object.
		 */
		private function dependencyCompleteHandler(e:StarlingDependencyEvent):void {
			this.removeEventListener(StarlingDependencyEvent.DEPENDENCY_COMPLETE, this.dependencyCompleteHandler);
			this.onDependencyComplete();
		}
		
		/**
		 * 	@private
		 * 
		 * 	Event handler invoked when the display object has been added to stage.
		 */
		private function addedToStageHandler(e:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
			this.onAddedToStage();
		}
	}
}