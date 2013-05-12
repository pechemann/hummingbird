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
		
		function getPlayerSpeed():Number;
		
		function setPlayerSpeed(playerSpeed:Number):void;
		
		function getElapsedTime():Number;
		
		function setElapsedTime(elapsedTime:Number):void;
		
		function getState():uint;
		
		function setState(state:uint):void;
		
		function getScore():Number;
		
		function setScore(score:Number):void;
	}
}