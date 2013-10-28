/////////////////////////////////////////////////////////////////////////////////////
//
//    Simplified BSD License
//    ======================
//    
//    Copyright 2013 Pascal ECHEMANN. All rights reserved.
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
	//  DefinitionRegistry.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.1, 24/10/2013 18:39
	 *  @see http://www.flashapi.org/
	 */
	
	import org.flashapi.hummingbird.controller.IController;
	import org.flashapi.hummingbird.core.IMVCObject;
	import org.flashapi.hummingbird.exceptions.InvalidTypeException;
	import org.flashapi.hummingbird.model.IModel;
	import org.flashapi.hummingbird.orchestrator.IOrchestrator;
	import org.flashapi.hummingbird.service.IService;
	import org.flashapi.hummingbird.utils.constants.InterfaceReference;
	
	/**
	 * 	Default implementation of the <code>IDefinitionRegistry</code> interface:
	 * a full-fledged MVC objects factory based on MVC definition objects.
	 * 
	 * 	<p>Typical usage is registering all MVC objects definitions first, before
	 * 	accessing them. MVC object definition lookup is therefore an inexpensive
	 * 	operation in a local MVC object definition table, operating on pre-built
	 * 	MVC object definition metadata objects.</p>
	 */
	public class DefinitionRegistry implements IDefinitionRegistry {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>DefinitionRegistry</code> instance 
		 * 					with the specified parameter.
		 *
		 * 	@param	iocRef	The class reference of the <code>IHummingbirdContainer</code>
		 * 					which is associated with this <code>DefinitionRegistry</code>
		 * 					instance.
		 */
		public function DefinitionRegistry(iocRef:Class) {
			super();
			this.initObj(iocRef);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@inheritDoc
		 */
		public function getModel(alias:String):IModel {
			var obj:IMVCObject = _iocRef.getInstance().getMVCObject(alias);
			this.checkType(alias, obj, IModel, InterfaceReference.MODEL);
			return obj as IModel;
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function getController(alias:String):IController {
			var obj:IMVCObject = _iocRef.getInstance().getMVCObject(alias);
			this.checkType(alias, obj, IController, InterfaceReference.CONTROLLER);
			return obj as IController;
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function getService(alias:String):IService {
			var obj:IMVCObject = _iocRef.getInstance().getMVCObject(alias);
			this.checkType(alias, obj, IService, InterfaceReference.SERVICE);
			return obj as IService;
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function getOrchestrator(alias:String):IOrchestrator {
			var obj:IMVCObject = _iocRef.getInstance().getMVCObject(alias);
			this.checkType(alias, obj, IOrchestrator, InterfaceReference.CONTROLLER);
			return obj as IOrchestrator;
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function removeDefinition(alias:String):IMVCObject {
			return _iocRef.getInstance().removeMVCObject(alias);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function hasDefinition(alias:String):Boolean {
			return _iocRef.getInstance().hasMVCObject(alias);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 *  The reference to the <code>IHummingbirdContainer</code> which is associated
		 * 	with this <code>DefinitionRegistry</code> instance.
		 */
		private var _iocRef:Object;
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	Initializes the definition registry object.
		 * 
		 * 	@param	iocRef	The class reference of the <code>IHummingbirdContainer</code>
		 * 					which is associated with this <code>DefinitionRegistry</code>
		 * 					instance.
		 */
		private function initObj(iocRef:Class):void {
			_iocRef = iocRef;
		}
		
		/**
		 * 	@private
		 * 
		 * 	Tests whether the object with the specified alias implements the expected
		 * 	type, defined by the specified interface.
		 * 
		 * 	@param	alias					The alias of the object to test.
		 * 	@param	obj						The object to test.
		 * 	@param	expectedType			The expected type reference.
		 * 	@param	expectedInterfaceRef	The string reference to the expected
		 * 									interface.
		 * 
		 * 	@throws org.flashapi.hummingbird.exceptions.InvalidTypeException
		 * 			Throws a <code>InvalidTypeException</code> exception if the
		 * 			<code>IFactory</code> object is asked for a MVC object instance
		 * 			alias for which the type mismatches.
		 */
		private function checkType(alias:String, obj:IMVCObject, expectedType:Class, expectedInterfaceRef:String):void {
			if ((obj is expectedType) == false) {
				var msg:String = 	"Implicit coercion of a value for the alias " + alias
									+ " to a possibly unrelated type " + expectedInterfaceRef;
				throw new InvalidTypeException(msg);
			}
		}
	}
}