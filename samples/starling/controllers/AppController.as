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

package controllers {
	
	import constants.GameState;
	import constants.Speed;
	import flash.utils.getTimer;
	import org.flashapi.hummingbird.controller.AbstractController;
	import models.IAppModel;
	
	[Qualifier(alias="AppController")]
	public final class AppController extends AbstractController implements IAppController {
		
		public function AppController() {
			super();
			this.initObj();
		}
		
		[Model(alias="AppModel")]
		public var model:IAppModel;
		
		public function setState(state:uint):void {
			if (state == GameState.IDLE) {
				_playerSpeedFunc = this.idlePlayerSpeedFunc;
			} else if (state == GameState.FLYING) {
				_playerSpeedFunc = this.flyingPlayerSpeedFunc;
			}
			this.model.setState(state);
		}
		
		public function nextFrame():void {
			_previousTime = _currentTime;
			_currentTime = getTimer();
			var elapsedTime:Number = (_currentTime - _previousTime) * 0.01;
			var playerSpeed:Number = _playerSpeedFunc(this.model.getPlayerSpeed());
			this.model.setScore(playerSpeed * elapsedTime * 0.01);
			this.model.setElapsedTime(elapsedTime);
			this.model.setPlayerSpeed(playerSpeed);
		}
		
		private var _previousTime:int;
		private var _currentTime:int;
		private var _playerSpeedFunc:Function;
		
		private function initObj():void {
			_previousTime = 0;
			_playerSpeedFunc = idlePlayerSpeedFunc;
		}
		
		private function idlePlayerSpeedFunc(oldPlayerSpeed:Number):Number {
			oldPlayerSpeed += (Speed.HERO_MIN_SPEED - oldPlayerSpeed) * 0.05;
			return oldPlayerSpeed;
		}
		
		private function flyingPlayerSpeedFunc(oldPlayerSpeed:Number):Number {
			oldPlayerSpeed -= (oldPlayerSpeed - Speed.HERO_MIN_SPEED) * 0.01;
			return oldPlayerSpeed;
		}
	}
}