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

package ui.display {
	
	import org.flashapi.hummingbird.Hummingbird;
	import starling.animation.Juggler;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import ui.Assets;
	
	public class Hero extends Sprite {
		
		public function Obstacle(type:uint, distance:int, watchOut:Boolean = true, speed:uint = 0) {
			super();
			this.initObj(type, distance, watchOut, speed);
		}
		
		public function initialize():void {
			var juggler:Juggler = Hummingbird.getStarling().juggler;
			if (_type == 4) {
				juggler.add(_framedAnim);
			}
			juggler.add(watchOutAnim);
			
		}
		
		public function freeze():void {
			var juggler:Juggler = Hummingbird.getStarling().juggler;
			if (_type == 4) {
				juggler.remove(_framedAnim);
			}
			juggler.remove(watchOutAnim);
		}
		
		public function getPosition():String {
			return _position;
		}
		
		public function setPosition(position:String):void {
			_position = position;
		}
		
		public function getSpeed():uint {
			return _speed;
		}
		
		public function setSpeed(speed:uint):void {
			_speed = speed;
		}
		
		public function getDistance():int {
			return _distance;
		}
		
		public function setDistance(distance:int):void {
			_distance = distance;
		}
		
		public function getWatchOut():Boolean {
			return _watchOut;
		}
		
		public function setWatchOut(watchOut:Boolean):void {
			_watchOut = watchOut;
			if (_watchOutAnim) {
				_watchOutAnim.visible = _watchOut;
			}
		}
		
		public function getAlreadyHit():Boolean {
			return _alreadyHit;
		}
		
		public function setAlreadyHit(alreadyHit:Boolean):void {
			_alreadyHit = alreadyHit;
			if (_alreadyHit) {
				_crashImg.visible = true;
				if (_type == 4) _framedAnim.visible = false;
				else _img.visible = false;
			}
		}
		
		private var _type:uint;
		private var _speed:uint;
		private var _distance:int;
		private var _watchOut:Boolean;
		private var _alreadyHit:Boolean;
		private var _postion:String;
		private var _img:Image;
		private var _crashImg:Image;
		private var _framedAnim:MovieClip;
		private var _watchOutAnim:MovieClip;
		
		private function initObj(type:uint, distance:int, watchOut:Boolean, speed:uint):void {
			_type = type;
			_distance = distance;
			_watchOut = watchOut;
			_speed = speed;
			_alreadyHit = false;
			this.addEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
		}
		
		private function addedToStageHandler(e:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
			this.createObstacleArt();
			this.createObstacleCrashArt();
			this.createWatchOutAnim();
		}
		
		private function createObstacleArt():void {
			if (_type == 4) {
				_framedAnim = new MovieClip(Assets.getAtlas().getTexture("obstacle" + type + "_0", 10));
				_framedAnim.x = _framedAnim.y = 0;
				this.addChild(_framedAnim);
			} else {
				_img = new Image(Assets.getAtlas().getTexture("obstacle" + type));
				_img.x = _img.y = 0;
				this.addChild(_img);
			}
		}
		
		private function createObstacleCrashArt():void {
			_crashImg = new Image(Assets.getAtlas().getTexture("obstacle" + type + "_crash"));
			_crashImg.visible = false;
			this.addChild(_crashImg);
		}
		
		private function createWatchOutAnim():void {
			_watchOutAnim = new MovieClip(Assets.getAtlas().getTexture("watchOut_", 10));
			_watchOutAnim.x = -_watchOutAnim.texture.width;
			_watchOutAnim.y = (_type == 4) ?
				_framedAnim.y + (_framedAnim.texture.height - _watchOutAnim.texture.height) / 2 :
				_watchOutAnim.y = _framedAnim.y + (_img.texture.height / 2);
			this.addChild(_watchOutAnim);
		}
	}
}