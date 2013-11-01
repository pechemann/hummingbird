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

package controllers {
	
	// -----------------------------------------------------------
	//  ITodoController.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 31/10/2013 14:37
	 *  @see http://www.flashapi.org/
	 */
	
	import models.dto.Todo;
	import org.flashapi.hummingbird.controller.IController;
	
	/**
	 * 	The <code>ITodoController</code> interface represents the facade for the 
	 * 	controller of the TodoList application.
	 */
	public interface ITodoController extends IController {
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Initializes the list of items.
		 */
		function initTodoList():void;
		
		/**
		 * 	Changes the type of items to be displayed, according to their current
		 * 	state.
		 * 
		 *	 @param	todoType 	The type of items to be displayed; a constant of 
		 * 						the <code>TodoDisplayType</code> class.
		 * 
		 * 	@see constants.TodoDisplayType
		 */
		function setTodoDisplayType(todoType:uint):void;
		
		/**
		 * 	Adds a new item to the todo list.
		 * 
		 * 	@param	value	The label value of the new item.
		 */
		function addTodo(value:String):void;
		
		/**
		 * 	Removes the specified item from the todo list.
		 * 
		 * 	@param	todo	The item to remove.
		 */
		function deleteTodo(todo:Todo):void;
		
		/**
		 * 	Updates the label of the specified item.
		 * 
		 * 	@param	todo		The item to be updated.
		 * 	@param	oldValue	The old "label" value of the item to update.
		 */
		function updateTodoLabel(todo:Todo, oldValue:String):void;
		
		/**
		 * 	Updates the state of the specified item.
		 * 
		 * 	@param	todo		The item to be updated.
		 * 	@param	oldValue	The old "completed" value of the item to update.
		 */
		function updateTodoState(todo:Todo, oldValue:Boolean):void;
		
		/**
		 * 	Changes the state for all the items in the todo list.
		 * 
		 * 	@param	newState	The new state for all of the items in the
		 * 						todo list.
		 */
		function setTodoStates(newState:Boolean):void;
		
		/**
		 * 	Deletes all completed items from the todo list at one time.
		 */
		function deleteCompletedItems():void;
	}
}