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
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class GameBackground extends Sprite{
		
		public function GameBackground() {
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
		}
		
		public function initialize():void {
			this.addEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
		}
		
		public function freeze():void {
			this.removeEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
		}
		
		public function getSpeed():Number {
			return _speed;
		}
		
		public function setSpeed(speed:Number):void {
			_speed = speed;
		}
		
		private var _speed:Number;
		private var _bgLayer1:BGLayer;
		private var _bgLayer2:BGLayer;
		private var _bgLayer3:BGLayer;
		private var _bgLayer4:BGLayer;
		
		private function addedToStageHandler(e:Event):void {
			_speed = 0;
			_bgLayer1 = this.createLayer(1, 0.02);
			_bgLayer2 = this.createLayer(2, 0.2);
			_bgLayer3 = this.createLayer(3, 0.5);
			_bgLayer4 = this.createLayer(4, 1.0);
		}
		
		private function createLayer(layer:int, parallax:Number):BGLayer {
			var bgLayer:BGLayer = new BGLayer(layer);
			bgLayer.setParallax(parallax);
			this.addChild(bgLayer);
			return bgLayer;
		}
		
		private function enterFrameHandler(e:Event):void {
			
			var stageWidth:Number = this.stage.stageWidth;
			
			this.setBGLayerPos(_bgLayer1, stageWidth);
			this.setBGLayerPos(_bgLayer2, stageWidth);
			this.setBGLayerPos(_bgLayer3, stageWidth);
			this.setBGLayerPos(_bgLayer4, stageWidth);
		}
		
		private function setBGLayerPos(bgLayer:BGLayer, stageWidth:Number):void {
			bgLayer.x -= Math.ceil(_speed * bgLayer.getParallax());
			if (bgLayer.x < -stageWidth) bgLayer.x = 0;
		}
	}
}