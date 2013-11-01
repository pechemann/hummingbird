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

package domain.db {
	
	// -----------------------------------------------------------
	//  TodoDB.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 31/10/2013 14:37
	 *  @see http://www.flashapi.org/
	 */
	
	import flash.utils.Dictionary;
	import org.flashapi.hummingbird.exceptions.SingletonException;
	import models.dto.Todo;
	
	/**
	 * 	The <code>TodoDB</code> singleton emulates a client-side Data Base implementation
	 * 	for the TodoList application.
	 */
	public class TodoDB extends Object {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	Constructor. Creates a new <code>TodoDB</code> instance.
		 */
		public function TodoDB() {
			super();
			if (INSTANCE) {
				throw new SingletonException("You must use the getInstance() methods to access TodoDB objects");
			}
			this.initObj();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Singleton
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Returns the reference to the <code>TodoDB</code> singleton.
		 * 	
		 * 	@return	The unique <code>TodoDB</code> instance.
		 */
		public static function getInstance():TodoDB {
			return TodoDB.INSTANCE;
		}
		
		/**
		 * 	@private
		 * 
		 * 	The unique <code>TodoDB</code> instance.
		 */
		private static const INSTANCE:TodoDB = new TodoDB();
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Returns all the items in the Data Base.
		 * 
		 * 	@return	A string, at the JSON format, that represents all of the items in
		 * 			the Data Base.
		 */
		public function selectAll():String {
			var list:Array = [];
			var row:TodoDBRow;
			for each(row in _db) {
				list.push(row);
			}
			return JSON.stringify(list);
		}
		
		/**
		 * 	Updates all the values in the Data Base for the specified field.
		 * 
		 * 	@param	field	The field to be updated in the Data Base.
		 * 	@param	value	The new value for the field to update.
		 * 
		 * 	@return	A string, at the JSON format, that represents the result of
		 * 			the Data Base operation.
		 */
		public function updateAll(field:String, value:Object):String {
			var list:Array = [];
			var row:TodoDBRow;
			for each(row in _db) {
				row[field] = value;
			}
			var operationResult:Object = { response:0, error:0 };
			return JSON.stringify(operationResult);
		}
		
		/**
		 * 	Removes all the rows in the Data Base for the specified field with the
		 * 	matching value.
		 * 
		 * 	@param	field	The field to match the value for each row in the Data Base.
		 * 	@param	value	The value to match.
		 * 
		 * 	@return	A string, at the JSON format, that represents the result of
		 * 			the Data Base operation.
		 */
		public function removeAll(field:String, value:Object):String {
			var list:Array = [];
			var row:TodoDBRow;
			var id:uint;
			for each(row in _db) {
				if (row[field] == value) {
					id = row.id;
					_db[id] = null;
					delete _db[id];
				}
			}
			var operationResult:Object = { response:0, error:0 };
			return JSON.stringify(operationResult);
		}
		
		
		/**
		 * 	Creates a new row in the Data Base.
		 * 
		 * 	@param	data	A string that represents the label information
		 * 					for the row to create in the Data Base.
		 * 
		 * 	@return	A string, at the JSON format, that represents the information 
		 * 			of the new row created in the Data Base.
		 */
		public function insertRow(data:String):String {
			var newRow:TodoDBRow = new TodoDBRow();
			newRow.id = _primaryKeyId;
			newRow.label = data;
			newRow.completed;
			_db[_primaryKeyId] = newRow;
			_primaryKeyId++;
			var obj:Object = { label:newRow.label, id:newRow.id, completed:newRow.completed };
			return JSON.stringify(obj);
		}
		
		/**
		 * 	Updates the specified row in the Data Base.
		 * 
		 * 	@param	data	A string, at the JSON format, that represents 
		 * 					information of a row in the Data Base.
		 * 
		 * 	@return	A string, at the JSON format, that represents the result of
		 * 			the Data Base operation.
		 */
		public function updateRow(data:String):String {
			var obj:Object = JSON.parse(data);
			var id:uint = uint(obj.id);
			var operationResult:Object;
			if (_db[id]) {
				var editedRow:TodoDBRow = _db[id];
				editedRow.label = obj.label;
				editedRow.completed = obj.completed;
				operationResult = { response:0, error:0 };
			} else {
				operationResult = { response:1, error:1 };
			}
			return JSON.stringify(operationResult);
		}
		
		/**
		 * 	Removes the specified row from the Data Base.
		 * 
		 * 	@param	data	A string, at the JSON format, that represents 
		 * 					information of the row to remove.
		 * 
		 * 	@return	A string, at the JSON format, that represents the result of
		 * 			the Data Base operation.
		 */
		public function deleteRow(data:String):String {
			var obj:Object = JSON.parse(data);
			var id:uint = uint(obj.id);
			var operationResult:Object;
			if (_db[id]) {
				_db[id] = null;
				delete _db[id];
				operationResult = { response:0, error:0 };
			} else {
				operationResult = { response:1, error:1 };
			}
			return JSON.stringify(operationResult);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	The map used for storing rows in the Data Base.
		 */
		private var _db:Dictionary;
		
		/**
		 * 	@private
		 * 
		 * 	The primary key for the Data Base.
		 */
		private var _primaryKeyId:uint;
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	Initializes the Data Base.
		 */
		private function initObj():void {
			_db = new Dictionary();
			_primaryKeyId = 0;
		}
	}
}