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
	
	import org.flashapi.hummingbird.model.IModel;
	import feathers.data.ListCollection;
	
	public interface IAppModel extends IModel {
		
		function getTodoList():ListCollection;
		
		function getItemLabelField():String;
		
		function addItem(value:String):void;
		
		function removeItemAt(index:int):void;
		
		function setEditionMode(isEditing:Boolean):void;
		
		function getEditionMode():Boolean;
	}
}