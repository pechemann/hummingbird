/////////////////////////////////////////////////////////////////////////////////////
//
//    Hummingbird Framework Template
//    ==============================
//    
//    Copyright 2013-2014 Pascal ECHEMANN.
//    All Rights Reserved.
//    
//    NOTICE: The author permits you to use, modify, and distribute this file
//    in accordance with the terms of the license agreement accompanying it.
//    
/////////////////////////////////////////////////////////////////////////////////////

package models {
	
	import feathers.data.ListCollection;
	import org.flashapi.hummingbird.model.AbstractModel;
	import models.dto.TodoItem;
	import events.ModelEvent;
	
	[Qualifier(alias="AppModel")]
	
	public class AppModel extends AbstractModel implements IAppModel {
		
		public function AppModel() {
			super();
			this.initObj();
		}
		
		public function getTodoList():ListCollection {
			return _todoList;
		}
		
		public function addItem(value:String):void {
			var newItem:TodoItem = new TodoItem();
			newItem.description = value;
			_todoList.addItem(newItem);
			this.dispatchEvent(new ModelEvent(ModelEvent.DATA_UPDATE));
		}
		
		public function removeItemAt(index:int):void {
			_todoList.removeItemAt(index);
			this.dispatchEvent(new ModelEvent(ModelEvent.DATA_UPDATE));
		}
		
		public function setEditionMode(isEditing:Boolean):void {
			_isEditing = isEditing;
			this.dispatchEvent(new ModelEvent(ModelEvent.EDITION_MODE_CHANGE));
		}
		
		public function getEditionMode():Boolean {
			return _isEditing;
		}
		
		public function getItemLabelField():String {
			return this.ITEM_LABEL_FIELD;
		}
		
		private const ITEM_LABEL_FIELD:String = "description";
		
		private var _todoList:ListCollection;
		
		private var _isEditing:Boolean;
		
		private function initObj():void {
			_todoList = new ListCollection();
			_isEditing = false;
		}
	}
}