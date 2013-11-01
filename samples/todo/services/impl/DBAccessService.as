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

package services.impl {
	
	// -----------------------------------------------------------
	//  DBAccessService.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 31/10/2013 14:37
	 *  @see http://www.flashapi.org/
	 */
	
	import constants.ServiceOperation;
	import constants.TodoResponseType;
	import domain.business.TodoDAO;
	import domain.db.ITodoDBResult;
	import models.dto.Todo;
	import org.flashapi.hummingbird.events.ServiceEvent;
	import org.flashapi.hummingbird.service.AbstractService;
	import services.IPersistenceService;
	import utils.LogManager;
	
	/**
	 * 	The <code>DBAccessService</code> class represents the default implementation 
	 * 	of the <code>IPersistenceService</code> interface. It is the persistence service
	 * 	of the TodoList application.
	 */
	[Qualifier(alias="PersistenceService")]
	public class DBAccessService extends AbstractService implements IPersistenceService {
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@inheritDoc
		 */
		public function getTodoList():void {
			LogManager.info("DBAccessService: getTodoList()");
			var todoList:Array = DBAccessService.TODO_DAO.getTodoList();
			var evtType:String = (todoList != null) ?
					ServiceEvent.TRANSACTION_SUCCESS : ServiceEvent.TRANSACTION_ERROR;
			var evt:ServiceEvent = new ServiceEvent(evtType);
			evt.operationId = ServiceOperation.SELECT_ALL;
			evt.data = todoList;
			this.dispatchEvent(evt);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function createTodo(value:String):void {
			LogManager.info("DBAccessService: createTodo(), value=" + value);
			var todo:Todo = DBAccessService.TODO_DAO.createTodo(value);
			var evtType:String = (todo != null) ?
					ServiceEvent.TRANSACTION_SUCCESS : ServiceEvent.TRANSACTION_ERROR;
			this.dispatchTranscationEvent(evtType, todo, ServiceOperation.CREATE);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function updateTodoLabel(todo:Todo, oldValue:String):void {
			LogManager.info("DBAccessService: updateTodoLabel(), todo=" + todo);
			var result:ITodoDBResult = DBAccessService.TODO_DAO.updateTodoLabel(todo, oldValue);
			this.onPersistanceResult(result, todo, ServiceOperation.UPDATE_LABEL);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function updateTodoState(todo:Todo, oldValue:Boolean):void {
			LogManager.info("DBAccessService: updateTodoState(), todo=" + todo);
			var result:ITodoDBResult = DBAccessService.TODO_DAO.updateTodoState(todo, oldValue);
			this.onPersistanceResult(result, todo, ServiceOperation.UPDATE_STATE);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function updateAllTodoStates(newState:Boolean):void {
			LogManager.info("DBAccessService: updateAllTodoStates(), newState=" + newState);
			var result:ITodoDBResult = DBAccessService.TODO_DAO.updateAllTodoStates(newState);
			this.onPersistanceResult(result, newState, ServiceOperation.UPDATE_ALL_STATES);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function deleteTodo(todo:Todo):void {
			LogManager.info("DBAccessService: deleteTodo(), todo=" + todo);
			var result:ITodoDBResult = DBAccessService.TODO_DAO.deleteTodo(todo);
			this.onPersistanceResult(result, todo, ServiceOperation.DELETE);
		}
		
		/**
		 * 	@inheritDoc
		 */
		public function deleteCompletedTodos():void {
			LogManager.info("DBAccessService: deleteCompletedTodos()");
			var result:ITodoDBResult = DBAccessService.TODO_DAO.deleteCompletedTodos();
			this.onPersistanceResult(result, null, ServiceOperation.DELETE_COMPLETED);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	The DAO used by the service to persist data.
		 */
		private static const TODO_DAO:TodoDAO = new TodoDAO();
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Invoked when the persistence service sends the result of the current
		 * 	operation.
		 * 
		 * 	@param	result		The result of the operation performed on the service.
		 * 	@param	data		The data related to the operation.
		 * 	@param	operationId	A constant of the <code>ServiceOperation</code>
		 * 						class that describes the operation.
		 * 
		 * 	@see constants.ServiceOperation
		 */
		private function onPersistanceResult(result:ITodoDBResult, data:Object, operationId:uint):void {
			var evtType:String = (result.response == TodoResponseType.SUCCESS) ?
				ServiceEvent.TRANSACTION_SUCCESS : ServiceEvent.TRANSACTION_ERROR;
			this.dispatchTranscationEvent(evtType, data, operationId);
		}
		
		/**
		 * 	Dispatches a <code>ServiceEvent</code> object, according to the specified
		 * 	parameters.
		 * 
		 * 	@param	eventType	The type of event to dispatch; A constant of the
		 * 						<code>ServiceEvent</code> class.
		 * 	@param	data		The data associated to the dispatched event.
		 * 	@param	operationId	The <code>operationId</code> property of the dispatched
		 * 						event. A constant of the <code>ServiceOperation</code>
		 * 						class.
		 * 
		 * 	@see constants.ServiceOperation
		 */
		private function dispatchTranscationEvent(eventType:String, data:Object, operationId:uint):void {
			var evt:ServiceEvent = new ServiceEvent(eventType);
			evt.data = data;
			evt.operationId = operationId;
			this.dispatchEvent(evt);
		}
	}
}