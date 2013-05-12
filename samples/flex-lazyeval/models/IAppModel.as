/////////////////////////////////////////////////////////////////////////////////////
//
//    Hummingbird Framework Template
//    ==============================
//    
//    Copyright 2013 Pascal ECHEMANN.
//    All Rights Reserved.
//    
//    NOTICE: The author permits you to use, modify, and distribute this file
//    in accordance with the terms of the license agreement accompanying it.
//    
/////////////////////////////////////////////////////////////////////////////////////

package models {
	
	import org.flashapi.hummingbird.model.IModel;
	
	public interface IAppModel extends IModel {
		
		function getWelcomeMessage():String;
		
		function getApplicationState():uint;
		
		function setApplicationState(applicationState:uint):void;
	}
}