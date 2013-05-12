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
	
	import org.flashapi.hummingbird.model.AbstractModel;
	
	[Qualifier(alias="AppModel")]
	public class AppModel extends AbstractModel implements IAppModel {
		
		public function AppModel() {
			super();
			this.initObj();
		}
		
		public function getPlayerSpeed():Number {
			return _playerSpeed;
		}
		
		public function setPlayerSpeed(playerSpeed:Number):void {
			_playerSpeed = playerSpeed;
		}
		
		public function getElapsedTime():Number {
			return _elapsedTime;
		}
		
		public function setElapsedTime(elapsedTime:Number):void {
			_elapsedTime = elapsedTime;
		}
		
		public function getScore():Number {
			return _score;
		}
		
		public function setScore(score:Number):void {
			_score = score;
		}
		
		public function getState():uint {
			return _state;
		}
		
		public function setState(state:uint):void {
			_state = state;
		}
		
		private var _state:uint;
		private var _score:Number;
		private var _elapsedTime:Number;
		private var _hitObstacleNum:Number;
		private var _playerSpeed:Number;
		private var _obstacleGapCount:uint;
		
		private function initObj():void {
			_hitObstacleNum = 0;
			_obstacleGapCount = 0;
			_elapsedTime = 0;
			_playerSpeed = 0;
		}
	}
}