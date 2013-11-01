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

package domain.business {
	
	// -----------------------------------------------------------
	//  TodoDAO.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 31/10/2013 14:37
	 *  @see http://www.flashapi.org/
	 */
	
	import constants.TodoResponseType;
	import domain.db.ITodoDBResult;
	import domain.db.TodoDB;
	import models.dto.Todo;
	
	use namespace business_internal;
	
	/**
	 * 	A data access object used to emulate a business layed in the TodoList application.
	 */
	public class TodoDAO extends Object {
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Returns the initial list of items registered in the Data Base.
		 * 	Equivalent to the SQL syntax: <code>SELECT * FROM TodoTable</code>
		 * 
		 * 	@return An array of all items registered in the Data Base.
		 */
		public function getTodoList():Array {
			var result:String = TodoDB.getInstance().selectAll();
			var todoList:Array = JSON.parse(result) as Array;
			return todoList;
		}
		
		/**
		 * 	Persists a new item in the Data Base and returns the <code>Todo</code>
		 * 	instance that represents the new row in the Data Base.
		 * 	Equivalent to the SQL syntax: <code>INSERT INTO TodoTable(label) VALUES ('value')</code>
		 * 
		 * 	@param	value	The of the new item.
		 * 
		 * 	@return	The <code>Todo</code> instance that represents the new
		 * 			row in the Data Base.
		 */
		public function createTodo(value:String):Todo {
			var result:String = TodoDB.getInstance().insertRow(value);
			return this.getTodoBean(result);
		}
		
		/**
		 * 	Removes the item, specified by the <code>todo</code> parameter,
		 * 	from the Data Base.
		 * 	Equivalent to the SQL syntax: <code>DELETE FROM TodoTable WHERE id = 'todo.id'</code>
		 * 
		 * 	@param	todo	The <code>Todo</code> instance to remove from DB.
		 * 
		 * 	@return	A <code>ITodoDBResult</code> object that contains the result
		 * 			of the operation.
		 */
		public function deleteTodo(todo:Todo):ITodoDBResult {
			var data:String = JSON.stringify(todo);
			var answer:String = TodoDB.getInstance().deleteRow(data);
			return this.getResult(answer);
		}
		
		/**
		 * 	Modifies the "label" field of the item, specified by the <code>todo</code>
		 * 	parameter.
		 * 	Equivalent to the SQL syntax: <code>UPDATE TodoTable SET label = 'todo.label' WHERE id = 'todo.id'</code>
		 * 
		 * 	@param	todo		The <code>Todo</code> instance to modify in DB.
		 * 	@param	oldValue	The old value of the specified <code>Todo</code>
		 * 						instance used by the rollback process.
		 * 
		 * 	@return	A <code>ITodoDBResult</code> object that contains the result
		 * 			of the operation.
		 */
		public function updateTodoLabel(todo:Todo, oldValue:String):ITodoDBResult {
			var data:String = JSON.stringify(todo);
			var answer:String = TodoDB.getInstance().updateRow(data);
			var result:ITodoDBResult = this.getResult(answer);
			if (result.response == TodoResponseType.ERROR) {
				todo.label = oldValue;
			}
			return result;
		}
		
		/**
		 * 	Modifies the "completed" field of the item, specified by the <code>todo</code>
		 * 	parameter.
		 * 	Equivalent to the SQL syntax: <code>UPDATE TodoTable SET completed = 'todo.completed' WHERE id = 'todo.id'</code>
		 * 
		 * 	@param	todo		The <code>Todo</code> instance to modify in DB.
		 * 	@param	oldValue	The old value of the specified <code>Todo</code>
		 * 						instance used by the rollback process.
		 * 
		 * 	@return	A <code>ITodoDBResult</code> object that contains the result
		 * 			of the operation.
		 */
		public function updateTodoState(todo:Todo, oldValue:Boolean):ITodoDBResult {
			var data:String = JSON.stringify(todo);
			var answer:String = TodoDB.getInstance().updateRow(data);
			var result:ITodoDBResult = this.getResult(answer);
			if (result.response == TodoResponseType.ERROR) {
				todo.completed = oldValue;
			}
			return result;
		}
		
		/**
		 * 	Modifies the "completed" field of all items in the Data Base.
		 * 	Equivalent to the SQL syntax: <code>UPDATE TodoTable SET completed = 'newState'</code>
		 * 
		 * 	@param	newState	The new value of the "completed" field
		 * 						for all items in the Data Base.
		 * 
		 * 	@return	A <code>ITodoDBResult</code> object that contains the result
		 * 			of the operation.
		 */
		public function updateAllTodoStates(newState:Boolean):ITodoDBResult {
			var answer:String = TodoDB.getInstance().updateAll("completed", newState);
			return this.getResult(answer);
		}
		
		/**
		 * 	Removes all the completed items from the Data Base.
		 * 	Equivalent to the SQL syntax: <code>DELETE FROM TodoTable WHERE completed = 'true'</code>
		 * 
		 * 	@return	A <code>ITodoDBResult</code> object that contains the result
		 * 			of the operation.
		 */
		public function deleteCompletedTodos():ITodoDBResult {
			var answer:String = TodoDB.getInstance().removeAll("completed", true);
			return this.getResult(answer);
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Simulates the GUID for an item in the database.
		 */
		private static var _pseudoGuigGenerator:uint = 0;
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Unserializes and returns the <code>Todo</code> instance represented by
		 * 	the string returned from the data base.
		 * 
		 * 	@param	json	A string returned from the data base, at the JSON format.
		 * 
		 * 	@return	A <code>Todo</code> instance that represents a row the Data Base.
		 */
		private function getTodoBean(json:String):Todo {
			var obj:Object = JSON.parse(json);
			var todo:Todo = new Todo();
			todo.business_internal::setGuid(++_pseudoGuigGenerator);
			todo.business_internal::setId(obj.id);
			todo.label = obj.label;
			todo.completed = obj.completed;
			return todo;
		}
		
		/**
		 * 	Unserializes and returns the response of a Data Base operation, represented 
		 * 	by <code>answer</code> parameter.
		 * 
		 * 	@param	answer	A string returned from the data base, at the JSON format.
		 * 
		 * 	@return	A <code>ITodoDBResult</code> object that represents the response
		 * 			of a Data Base operation.
		 */
		private function getResult(answer:String):ITodoDBResult {
			var obj:Object = JSON.parse(answer);
			var result:TodoDBResult = new TodoDBResult();
			result.response = obj.response;
			result.error = obj.error;
			return result;
		}
	}
}