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
	//  TodoModel.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 31/10/2013 14:37
	 *  @see http://www.flashapi.org/
	 */
	
	import constants.TodoDisplayType;
	import events.ModelEvent;
	import flash.utils.Dictionary;
	import org.flashapi.hummingbird.model.AbstractModel;
	import models.dto.Todo;
	import mx.collections.ArrayCollection;
	import utils.LogManager;
	
	/**
	 * 	The <code>TodoModel</code> class represents the default implementation of
	 * 	the <code>ITodoModel</code> interface. It is the main model of the TodoList
	 * 	application.
	 */
	[Qualifier(alias="TodoModel")]
	public class TodoModel extends AbstractModel implements ITodoModel {
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@inheritDoc
		 */
		public function initTodoList(todoList:Array):void {
			LogManager.info("TodoModel: initTodoList(), todoList=" + todoList);
			_todoList = new ArrayCollection(todoList);
			this.dispatchModelEvent(ModelEvent.TODO_LIST_INIT);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function getTodoList():ArrayCollection {
			return _todoList;
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function hasItems():Boolean {
			return Boolean(_itemsNum > 0);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function hasDisplayedItems():Boolean {
			return Boolean(_todoList.length > 0);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function getItemsLeftNum():uint {
			return _itemsNum - _completedItemsNum;
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function getCompletedItemsNum():uint {
			return _completedItemsNum;
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function areAllItemsCompleted():Boolean {
			return Boolean(_itemsNum > 0 && _itemsNum == _completedItemsNum);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function getTodoDisplayType():uint {
			return _todoDisplayType;
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function setTodoDisplayType(todoDisplayType:uint):void {
			LogManager.info("TodoModel: setTodoDisplayType(), todoDisplayType=" + todoDisplayType);
			_todoDisplayType = todoDisplayType;
			this.updateTodosByDisplayType();
			this.dispatchModelEvent(ModelEvent.TODO_DISPLAYED_TYPE_CHANGE);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function addTodo(todo:Todo):void {
			LogManager.info("TodoModel: addTodo(), todo=" + todo);
			_itemsNum++;
			_todoMap[todo.guid] = todo;
			if (todo.completed) {
				_completedItemsNum++;
			}
			if (_todoDisplayType != TodoDisplayType.COMPLETED) {
				this.addItem(todo);
			}
			this.dispatchModelEvent(ModelEvent.TODO_LIST_CHANGE);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function deleteTodo(todo:Todo):void {
			LogManager.info("TodoModel: deleteTodo(), todo=" + todo);
			_itemsNum--;
			if (todo.completed) {
				_completedItemsNum--;
			}
			delete _todoMap[todo.guid];
			this.removeItem(todo);
			todo = null
			this.dispatchModelEvent(ModelEvent.TODO_LIST_CHANGE);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function updateTodoLabel(todo:Todo):void {
			LogManager.info("TodoModel: updateTodoLabel(), todo=" + todo);
			_todoList.refresh();
			this.dispatchModelEvent(ModelEvent.TODO_LIST_CHANGE);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function updateTodoState(todo:Todo):void {
			LogManager.info("TodoModel: updateTodoState(), todo=" + todo);
			(todo.completed) ? _completedItemsNum++ : _completedItemsNum--;
			if (_todoDisplayType == TodoDisplayType.ALL) {
				if (!this.containsItem(todo)) {
					this.addItem(todo);
				}
			} else if (_todoDisplayType == TodoDisplayType.COMPLETED) {
				if (todo.completed && !this.containsItem(todo)) {
					this.addItem(todo);
				} else if (!todo.completed && this.containsItem(todo)) {
					this.removeItem(todo);
				}
			} else if (_todoDisplayType == TodoDisplayType.ACTIVE) {
				if (todo.completed && this.containsItem(todo)) {
					this.removeItem(todo);
				} else if (!todo.completed && !this.containsItem(todo)) {
					this.addItem(todo);
				}
			}
			this.dispatchModelEvent(ModelEvent.TODO_LIST_CHANGE);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function setTodoStates(allTodoCompleted:Boolean):void {
			LogManager.info("TodoModel: setTodoStates(), allTodoCompleted=" + allTodoCompleted);
			var todo:Todo;
			_completedItemsNum = 0;
			for each (todo in _todoMap) {
				todo.completed = allTodoCompleted;
				if(allTodoCompleted) _completedItemsNum++;
			}
			this.updateTodosByDisplayType();
			this.dispatchModelEvent(ModelEvent.TODO_DISPLAYED_TYPE_CHANGE);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function deleteCompletedTodos():void {
			LogManager.info("TodoModel: deleteCompletedTodos()");
			var todo:Todo;
			_completedItemsNum = 0;
			for each (todo in _todoMap) {
				if (todo.completed) {
					if (this.containsItem(todo)) {
						this.removeItem(todo);
					}
					delete _todoMap[todo.guid];
					todo = null;
					_itemsNum--;
				}
			}
			this.dispatchModelEvent(ModelEvent.TODO_LIST_CHANGE);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 	
		 * 	The collection of items currently displyaed in the application.
		 */
		private var _todoList:ArrayCollection;
		
		/**
		 * 	@private
		 * 	
		 * 	Storage for all items in the todo list.
		 */
		private var _todoMap:Dictionary = new Dictionary();
		
		/**
		 * 	@private
		 * 	
		 * 	The current type of items to be displyed in the application.
		 */
		private var _todoDisplayType:uint = TodoDisplayType.ALL;
		
		/**
		 * 	@private
		 * 	
		 * 	The number of items in the todo list.
		 */
		private var _itemsNum:uint = 0;
		
		/**
		 * 	@private
		 * 	
		 * 	The number of completed items in the todo list.
		 */
		private var _completedItemsNum:uint = 0;
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	Removes the specified item from the current items list.
		 * 
		 * 	@param	todo The item to remove from the current items list.
		 */
		private function removeItem(todo:Todo):void {
			_todoList.removeItemAt(_todoList.getItemIndex(todo));
		}
		
		/**
		 * 	@private
		 * 
		 * 	Adds the specified item to the current items list.
		 * 
		 * 	@param	todo The item to add to the current items list.
		 */
		private function addItem(todo:Todo):void {
			_todoList.addItem(todo);
		}
		
		/**
		 * 	@private
		 * 
		 * 	Indicates wheter the specified item is contained in the current items
		 * 	list (<code>true</code>), or not (<code>false</code>).
		 */
		private function containsItem(todo:Todo):Boolean {
			return _todoList.contains(todo);
		}
		
		/**
		 * 	@private
		 * 
		 * 	Dispatches a <code>ModelEvent</code> object of the specified type.
		 * 
		 * 	@param	eventType	The type of the event; a constant of the
		 * 						<code>ModelEvent</code> class.
		 */
		private function dispatchModelEvent(eventType:String):void {
			this.dispatchEvent(new ModelEvent(eventType));
		}
		
		/**
		 * 	@private
		 * 
		 * 	Updates the current items list, depending on their state and the 
		 * 	display type of the application.
		 */
		private function updateTodosByDisplayType():void {
			_todoList.removeAll();
			var todo:Todo;
			if (_todoDisplayType == TodoDisplayType.ALL) {
				for each (todo in _todoMap) {
					this.addItem(todo);
				}
			} else if (_todoDisplayType == TodoDisplayType.COMPLETED) {
				for each (todo in _todoMap) {
					if (todo.completed == true) {
						this.addItem(todo);
					}
				}
			} else if (_todoDisplayType == TodoDisplayType.ACTIVE) {
				for each (todo in _todoMap) {
					if (todo.completed == false) {
						this.addItem(todo);
					}
				}
			}
		}
	}
}