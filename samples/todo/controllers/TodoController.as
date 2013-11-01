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
	//  TodoController.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 31/10/2013 14:37
	 *  @see http://www.flashapi.org/
	 */
	
	import constants.ServiceOperation;
	import models.dto.Todo;
	import models.ITodoModel;
	import org.flashapi.hummingbird.controller.AbstractController;
	import org.flashapi.hummingbird.events.ServiceEvent;
	import services.IPersistenceService;
	import utils.LogManager;
	
	/**
	 * 	The <code>TodoController</code> class represents the default implementation   
	 * 	of the <code>ITodoController</code> interface. it is the main controller
	 * 	of the TodoList application.
	 */
	[Qualifier(alias="TodoController")]
	public final class TodoController extends AbstractController implements ITodoController {
		
		//--------------------------------------------------------------------------
		//
		//  Dependencies injection
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	The model of the application.
		 */
		[Model(alias="TodoModel")]
		public var model:ITodoModel;
		
		/**
		 * 	The persitence service to be used by the application.
		 */
		[Service(alias="PersistenceService")]
		public var service:IPersistenceService;
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@inheritDoc
		 */
		public function initTodoList():void {
			LogManager.info("TodoController: initTodoList()");
			this.service.getTodoList();
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function setTodoDisplayType(todoDisplayType:uint):void {
			LogManager.info("TodoController: setTodoDisplayType(), todoDisplayType=" + todoDisplayType);
			this.model.setTodoDisplayType(todoDisplayType);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function addTodo(value:String):void {
			LogManager.info("TodoController: addTodo(), value=" + value);
			this.service.createTodo(value);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function deleteTodo(todo:Todo):void {
			LogManager.info("TodoController: deleteTodo(), todo=" + todo);
			this.service.deleteTodo(todo);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function updateTodoLabel(todo:Todo, oldValue:String):void {
			LogManager.info("TodoController: updateTodoLabel(), todo=" + todo);
			this.service.updateTodoLabel(todo, oldValue);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function updateTodoState(todo:Todo, oldValue:Boolean):void {
			LogManager.info("TodoController: updateTodoState(), todo=" + todo);
			this.service.updateTodoState(todo, oldValue);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function setTodoStates(newState:Boolean):void {
			LogManager.info("TodoController: setTodoStates(), newState=" + newState);
			this.service.updateAllTodoStates(newState);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function deleteCompletedItems():void {
			LogManager.info("TodoController: deleteCompletedItems()");
			this.service.deleteCompletedTodos();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Protected methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 */
		override protected function onDependencyComplete():void {
			this.service.addEventListener(ServiceEvent.TRANSACTION_SUCCESS, this.transactionSuccessHandler);
			this.service.addEventListener(ServiceEvent.TRANSACTION_ERROR, this.transactionErrorHandler);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	Invoked each time the transaction has succeeded after calling the
		 * 	persistence service.
		 */
		private function transactionSuccessHandler(e:ServiceEvent):void {
			LogManager.info("TodoController: transactionSuccessHandler()");
			switch(e.operationId) {
				case ServiceOperation.CREATE :
					this.model.addTodo(e.data as Todo);
					break;
				case ServiceOperation.DELETE :
					this.model.deleteTodo(e.data as Todo);
					break;
				case ServiceOperation.UPDATE_LABEL :
					this.model.updateTodoLabel(e.data as Todo);
					break;
				case ServiceOperation.UPDATE_STATE :
					this.model.updateTodoState(e.data as Todo);
					break;
				case ServiceOperation.UPDATE_ALL_STATES :
					this.model.setTodoStates(e.data);
					break;
				case ServiceOperation.DELETE_COMPLETED :
					this.model.deleteCompletedTodos();
					break;
				case ServiceOperation.SELECT_ALL :
				default :
					this.model.initTodoList(e.data as Array);
					break;
			}
		}
		
		/**
		 * 	@private
		 * 
		 * 	Invoked each time the transaction has failed after calling the
		 * 	persistence service.
		 */
		private function transactionErrorHandler(e:ServiceEvent):void {
			LogManager.error("TodoController: transactionErrorHandler(), operationId=" + e.operationId);
		}
	}
}