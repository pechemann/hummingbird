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

package controllers {
	
	import org.flashapi.hummingbird.controller.IController;
	
	public interface IAppController extends IController {
		
		function addItem(value:String):void;
		
		function setEditionMode(isEditing:Boolean):void;
		
		function removeItemAt(index:int):void;
	}
}