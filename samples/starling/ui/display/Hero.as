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
	
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import ui.Assets;
	
	public class Hero extends Sprite {
		
		public function Hero() {
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
		}
		
		public function initialize():void {
			Starling.juggler.add(_heroArt);
		}
		
		public function freeze():void {
			Starling.juggler.remove(_heroArt);
		}
		
		private var _heroArt:MovieClip;
		
		private function addedToStageHandler(e:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
			this.createHeroArt();
		}
		
		private function createHeroArt():void {
			_heroArt = new MovieClip(Assets.getAtlas().getTextures("fly_"), 20);
			_heroArt.x = Math.ceil(_heroArt.width / 2);
			_heroArt.y = Math.ceil(_heroArt.height / 2);
			this.addChild(_heroArt);
		}
	}
}