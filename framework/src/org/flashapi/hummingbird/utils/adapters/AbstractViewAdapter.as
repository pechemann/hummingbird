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
	//  AbstractViewAdapter.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 16/03/2014 15:45
	 *  @see http://www.flashapi.org/
	 */
	
	import org.flashapi.hummingbird.exceptions.InvalidTypeException;
	
	/**
	 * 	The abstract class for all <code>IViewAdapter</code> objects.
	 */
	public class AbstractViewAdapter implements IViewAdapter {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>AbstractViewAdapter</code> instance.
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
		public function AbstractViewAdapter(adaptee:*) {
			super();
			this.comitAdaptee(adaptee);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Getter / setter properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@inheritDoc
		 */
		public function get onDependencyComplete():Function {
			return $onDependencyComplete;
		}
		public function set onDependencyComplete(value:Function):void {
			$onDependencyComplete = value;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@inheritDoc
		 */
		public function finalize():void {
			this.onFinalize();
			$adaptee = null;
			$onDependencyComplete = null;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Protected properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	A view object for which to add Hummingbird built-in MVC capabilities.
		 */
		protected var $adaptee:Object;
		
		/**
		 * 	@private
		 * 
		 * 	Callback function called when the Dependency Injection process is 
		 * 	completely performed on the <code>$adaptee</code> object.
		 */
		protected var $onDependencyComplete:Function;
		
		//--------------------------------------------------------------------------
		//
		//  Protected methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Abstract method you must override to implement custom actions when
		 * 	the <code>IViewAdapter</code> object is initialized.
		 */
		protected function onInitialize():void { }
		
		/**
		 * 	Abstract method you must override to indicates whether the <code>$adaptee</code> 
		 * 	object type matches with the types waited by this this <code>IViewAdapter</code>
		 * 	implementation, or not.  Default returned value is <code>false</code>.
		 * 
		 * 	@return <code>true</code> if the <code>$adaptee</code> object type matches 
		 * 			with the types waited by this <code>IViewAdapter</code> implementation;
		 * 			<code>false</code> otherwise.
		 */
		protected function checkType():Boolean {
			return false;
		}
		
		/**
		 * 	Abstract method you must override to implement custom actions when
		 * 	the <code>IViewAdapter</code> object is finalized.
		 */
		protected function onFinalize():void { }
		
		/**
		 * 
		 * 	Callback method that must be called when the Dependency Injection process
		 * 	is completely performed on the <code>$adaptee</code> object.
		 */
		protected function dependencyCompleteCallback():void {
			if ($onDependencyComplete != null) {
				$onDependencyComplete();
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
		 * 	Initializes this adapter object.
		 */
		private function comitAdaptee(adaptee:*):void {
			$adaptee = adaptee;
			if (this.checkType() == false) {
				throw new InvalidTypeException();
			}
			this.onInitialize();
		}
	}
}