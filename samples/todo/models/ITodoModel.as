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

package models {
	
	// -----------------------------------------------------------
	//  ITodoModel.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 31/10/2013 14:37
	 *  @see http://www.flashapi.org/
	 */
	
	import org.flashapi.hummingbird.model.IModel;
	import models.dto.Todo;
	import mx.collections.ArrayCollection;
	
	/**
	 * 	The <code>ITodoModel</code> interface represents the facade for the 
	 * 	model of the TodoList application.
	 */
	public interface ITodoModel extends IModel {
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Sets the initial list of items, retreived from the Data Base.
		 * 
		 * 	@param	todoList	The list items stored in the Data Base.
		 */
		function initTodoList(todoList:Array):void;
		
		/**
		 * 	Returns the collection of items to be displayed the todo list. This
		 * 	collection is the data provider for the <code>TodoList</code> component.
		 * 
		 * 	@return An <code>ArrayCollection</code> object; the data provider for
		 * 			the <code>TodoList</code> component.
		 */
		function getTodoList():ArrayCollection;
		
		/**
		 * 	Indicates whether any items are in the todo list (<code>true</code>),
		 * 	or not (<code>false</code>).
		 * 
		 * 	@return <code>true</code> if any items are in the todo list; 
		 * 			<code>false</code> otherwise.
		 */
		function hasItems():Boolean;
		
		/**
		 * 	Indicates whether any items are currently displayed (<code>true</code>),
		 * 	or not (<code>false</code>).
		 * 
		 * 	@return <code>true</code> if any items are currently displayed; 
		 * 			<code>false</code> otherwise.
		 */
		function hasDisplayedItems():Boolean;
		
		/**
		 * 	Returns the current number of left items.
		 * 	
		 * @return	The current number of left items.
		 */
		function getItemsLeftNum():uint;
		
		/**
		 * 	Returns the current number of completed items.
		 * 	
		 * @return	The current number of completed items.
		 */
		function getCompletedItemsNum():uint
		
		/**
		 * 	Indicates whether all items are in the todo list are completed
		 * 	(<code>true</code>), or not (<code>false</code>).
		 * 
		 * 	@return <code>true</code> if all items are in the todo list are ; 
		 * 			completed <code>false</code> otherwise.
		 */
		function areAllItemsCompleted():Boolean;
		
		/**
		 * 	Returns the current type of items to be displyed in the application.
		 * 	The initial value is <code>TodoDisplayType.ALL</code>.
		 * 	
		 * 	@return	A constant of the <code>TodoDisplayType</code> class.
		 * 
		 * 	@see constants.TodoDisplayType
		 * 	@see #setTodoDisplayType()
		 */
		function getTodoDisplayType():uint;
		
		/**
		 * 	Sets the current type of items to be displyed in the application.
		 * 
		 * 	@param	todoDisplayType	A constant of the <code>TodoDisplayType</code>
		 * 							class.
		 * 
		 * 	@see constants.TodoDisplayType
		 * 	@see #setTodoDisplayType()
		 */
		function setTodoDisplayType(todoDisplayType:uint):void;
		
		/**
		 * 	Adds a new item to the todo list.
		 * 
		 * 	@param	todo The new item to add the todo list.
		 */
		function addTodo(todo:Todo):void;
		
		/**
		 * 	Removes the specified item from the todo list.
		 * 
		 * 	@param	todo The item remove from the todo list.
		 */
		function deleteTodo(todo:Todo):void;
		
		/**
		 * 	Updates the <code>label</code> property for the specified <code>Todo</code>
		 * 	instance.
		 * 
		 * 	@param	todo	The item for which to update the label.
		 */
		function updateTodoLabel(todo:Todo):void;
		
		/**
		 * 	Updates the <code>completed</code> property for the specified 
		 * 	<code>Todo</code> instance.
		 * 
		 * 	@param	todo	The item for which to update the state.
		 */
		function updateTodoState(todo:Todo):void;
		
		/**
		 * 	Sets the state for all items.
		 * 
		 * 	@param	allTodoCompleted	Indicates whether all items are
		 * 								in the todo list must be completed
		 * 								(<code>true</code>), or not (<code>false</code>).
		 */
		function setTodoStates(allTodoCompleted:Boolean):void;
		
		/**
		 * 	Removes all the completed items from the todo list.
		 */
		function deleteCompletedTodos():void;
	}
}