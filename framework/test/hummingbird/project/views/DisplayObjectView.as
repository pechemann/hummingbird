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

package  hummingbird.project.views {
	
	// -----------------------------------------------------------
	//  DisplayObjectView.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 16/03/2014 19:45
	 *  @see http://www.flashapi.org/
	 */
	
	import flash.display.Sprite;
	import hummingbird.project.controllers.IBasicController;
	import hummingbird.project.models.IBasicModel;
	import hummingbird.project.orchestrators.IBasicOrchestrator;
	import org.flashapi.hummingbird.factory.ViewAdapterFactory;
	import org.flashapi.hummingbird.HummingbirdAS;
	import org.flashapi.hummingbird.utils.adapters.ViewAdapter;
	import org.flashapi.hummingbird.utils.adapters.IViewAdapter;
	import org.flashapi.hummingbird.view.IView;
	
	/**
	 * 	A <code>DisplayObject</code> that has a <code>ASViewAdapter</code> object.
	 */
	public class DisplayObjectView extends Sprite implements IView {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function DisplayObjectView() {
			super();
			this.initObj();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Dependencies injections
		//
		//--------------------------------------------------------------------------
		
		[Model(alias="BasicModel")]
		public var model:IBasicModel;
		
		[Controller(alias="BasicController")]
		public var controller:IBasicController;
		
		[Orchestrator(alias="BasicOrchestrator")]
		public var orchestrator:IBasicOrchestrator;
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@inheritDoc
		 */
		public function finalize():void {
			this.model = null;
			this.controller = null;
			this.orchestrator = null;
			_adapter.finalize();
			_adapter = null;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	The adpter for this view.
		 */
		private var _adapter:IViewAdapter;
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Initializes this object.
		 */
		private function initObj():void {
			_adapter = 	ViewAdapterFactory
						.makeFactory(ViewAdapter)
						.getViewAdapter(this, this.onDependencyComplete);
		}
		
		private function onDependencyComplete():void {
			HummingbirdAS.getLogger().info("StarlingDisplayObjectView.onDependencyComplete()");
		}
	}
}