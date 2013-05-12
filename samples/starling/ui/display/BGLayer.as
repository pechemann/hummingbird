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
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.TextureAtlas;
	import ui.Assets;
	
	public class BGLayer extends Sprite{
		
		public function BGLayer(layer:int) {
			super();
			this.initObj(layer);
		}
		
		public function getParallax():Number {
			return _parallax;
		}
		
		public function setParallax(parallax:Number):void {
			_parallax = parallax;
		}
		
		private var _img1:Image;
		private var _img2:Image;
		private var _layer:int;
		private var _parallax:Number;
		
		private function initObj(layer:int):void {
			_layer = layer;
			this.addEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
		}
		
		private function addedToStageHandler(e:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
			if (_layer == 1) {
				_img1 = new Image(Assets.getTexture("BG_LAYER"));
				_img2 = new Image(Assets.getTexture("BG_LAYER"));
			} else {
				var atlas:TextureAtlas = Assets.getAtlas();
				var layerName:String = "bgLayer" + _layer;
				_img1 = new Image(atlas.getTexture(layerName));
				_img2 = new Image(atlas.getTexture(layerName));
			}
			_img1.x = 0;
			_img1.y = _img2.y = this.stage.stageHeight - _img1.height;
			_img2.x = _img1.width;
			
			this.addChild(_img1);
			this.addChild(_img2);
		}
	}
}