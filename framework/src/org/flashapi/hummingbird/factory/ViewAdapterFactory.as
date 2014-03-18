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

package org.flashapi.hummingbird.factory {
	
	// -----------------------------------------------------------
	//  ViewAdapterFactory.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 15/03/2014 18:24
	 *  @see http://www.flashapi.org/
	 */
	
	import flash.errors.IllegalOperationError;
	import org.flashapi.hummingbird.utils.adapters.IViewAdapter;
	import org.flashapi.hummingbird.view.IView;
	
	/**
	 * 	<code>ViewAdapterFactory</code> is a convenience class you typically use to
	 * 	create instances of the <code>IViewAdapter</code> interface implementators.
	 * 	<p>
	 * 		You cannnot create a new instance of the <code>ViewAdapterFactory</code>
	 * 		class; you must use the <code>makeFactory()</code> method instead.
	 * 	</p>
	 * 
	 * 	@see org.flashapi.hummingbird.utils.adapters.IViewAdapter
	 */
	public class ViewAdapterFactory {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 *  Constructor. 	Creates a new <code>ViewAdapterFactory</code> instance.
		 * 
		 * 	@param	viewAdapterClassRef		The referrence to the class which to
		 * 									use for creating the new implementator
		 * 									of the <code>IViewAdapter</code> interface.
		 * 
		 * 	@throws IllegalOperationError	flash.errors.IllegalOperationError
		 * 									Throws a <code>IllegalOperationError</code>
		 * 									exception if you try to create a new
		 * 									instance of the <code>ViewAdapterFactory</code>
		 * 									class.
		 */
		public function ViewAdapterFactory(viewAdapterClassRef:Class) {
			super();
			if (_enableConstructorAccess == false) {
				throw new IllegalOperationError(
					"You must use the makeFactory() method to create a new ViewAdapterFactory instance."
				);
			}
			_viewAdapterClassRef = viewAdapterClassRef;
			_enableConstructorAccess = false;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Builds and returns a new instance of the <code>ViewAdapterFactory</code>
		 * 	class.
		 * 
		 * 	@param	viewAdapterClassRef	The referrence to the class the will be used
		 * 								for creating the new implementator of the
		 * 								<code>IViewAdapter</code> interface.
		 * 
		 * 	@return	A new instance of the <code>ViewAdapterFactory</code> class.
		 * 
		 * 	@see org.flashapi.hummingbird.utils.adapters.IViewAdapter
		 * 	@see #getViewAdapter()
		 */
		public static function makeFactory(viewAdapterClassRef:Class):ViewAdapterFactory {
			_enableConstructorAccess = true;
			return new ViewAdapterFactory(viewAdapterClassRef);
		}
		
		/**
		 * 	Builds and returns a new <code>IViewAdapter</code> instance, for the 
		 * 	specified <code>IView</code> object.
		 * 
		 * 	@param	adaptee		The <code>IView</code> object for which to add the
		 * 						Hummingbird MVC built-in mechanisms.
		 * 	@param	dependencyCompleteFunction	The callback function called when
		 * 						the Dependency Injection process is completely
		 * 						performed on the <code>adaptee</code> object.
		 * 	@param	addedToStageFunction	The callback function called when the 
		 * 						<code>adaptee</code> object is added to stage.
		 * 	
		 * 	@return	A new adapter object that implements the <code>IViewAdapter</code>
		 * 			interface; the type of this object is specified by the <code>viewAdapterClassRef</code>
		 * 			parameter of the <code>makeFactory()</code> method.
		 * 
		 * 	@see #makeFactory()
		 */
		public function getViewAdapter(	adaptee:IView,
										dependencyCompleteFunction:Function = null):IViewAdapter {
			var adapter:IViewAdapter = new _viewAdapterClassRef(adaptee);
			adapter.onDependencyComplete = dependencyCompleteFunction;
			return adapter;
		}
		
		/**
		 * 	Returns the class reference used by this <code>ViewAdapterFactory</code>
		 * 	instance to build the <code>IViewAdapter</code> object. The type of this
		 * 	object is specified by the <code>viewAdapterClassRef</code> parameter of
		 * 	the <code>makeFactory()</code> method.
		 * 
		 * 	@return Returns the class reference used by this <code>ViewAdapterFactory</code>
		 * 			instance.
		 * 
		 * 	@see #makeFactory()
		 */
		public function getViewAdapterClassRef():Class {
			return _viewAdapterClassRef;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	Helper property to emulate a private constructor in ActionScript 3.0.
		 */
		private static var _enableConstructorAccess:Boolean = false;
		
		/**
		 * 	@private
		 * 
		 * 	The referrence to the class which to use for creating the new implementator
		 * 	of the <code>IViewAdapter</code> interface.
		 */
		private var _viewAdapterClassRef:Class;
	}
}