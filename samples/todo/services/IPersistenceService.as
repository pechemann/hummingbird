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

package services {
	
	// -----------------------------------------------------------
	//  IPersistenceService.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 31/10/2013 14:37
	 *  @see http://www.flashapi.org/
	 */
	
	import org.flashapi.hummingbird.service.IService;
	import models.dto.Todo;
	
	/**
	 * 	The <code>IPersistenceService</code> interface represents the facade for the 
	 * 	persistence service of the TodoList application.
	 */
	public interface IPersistenceService extends IService {
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Returns the initial list from the persisted data.
		 */
		function getTodoList():void;
		
		/**
		 * 	Creates a new persisted item. 
		 * 
		 * 	@param	value	The label of the new item.
		 */
		function createTodo(value:String):void;
		
		/**
		 * 	Updates the label of the specified item in the persisted data.
		 * 
		 * 	@param	todo	The item to update.
		 * 	@param	oldValue	The old value for the label for the specified item.
		 */
		function updateTodoLabel(todo:Todo, oldValue:String):void;
		
		/**
		 * 	Updates the state of the specified item in the persisted data.
		 * 
		 * 	@param	todo	The item to update.
		 * 	@param	oldValue	The old value for the state for the specified item.
		 */
		function updateTodoState(todo:Todo, oldValue:Boolean):void;
		
		/**
		 * 	Updates the state of all items in the persisted data.
		 * 
		 * 	@param	newState	The state of all items in the persisted data.
		 */
		function updateAllTodoStates(newState:Boolean):void;
		
		/**
		 * 	Removes the specified item from the persisted data.
		 * 
		 * 	@param	todo	The item to remove.
		 */
		function deleteTodo(todo:Todo):void;
		
		/**
		 * 	Removes all completed items from the persisted data at one time.
		 */
		function deleteCompletedTodos():void;
	}
}