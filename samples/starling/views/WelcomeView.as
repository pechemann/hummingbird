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

package views {
	
	import constants.ViewId;
	import controllers.IViewsController;
	import flash.utils.getTimer;
	import org.flashapi.hummingbird.Hummingbird;
	import org.flashapi.hummingbird.view.AbstractStarlingSpriteView;
	import starling.animation.Tween;
	import starling.display.Button;
	import starling.display.Image;
	import starling.events.Event;
	import ui.Assets;
	
	public class WelcomeView extends AbstractStarlingSpriteView implements IGameView {
		
		[Controller(alias="ViewsController")]
		public var viewsController:IViewsController;
		
		public function initialize():void {
			_hero.x = -_hero.width;
			var tween:Tween = new Tween(_hero, 2.0);
			tween.animate("x", 80);
			Hummingbird.getStarling().juggler.add(tween);
			this.addEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
		}
		
		public function freeze():void {
			this.removeEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
		}
		
		override protected function onAddedToStage():void {
			this.drawScreen();
			this.createEvents();
		}
		
		private var _bg:Image;
		private var _title:Image;
		private var _hero:Image;
		
		private var _playBtn:Button;
		private var _aboutBtn:Button;
		
		private function drawScreen():void {
			_bg = this.addBgImage("BG_WELCOME", 0, 0);
			_title = this.addImage("welcome_title", 440, 20);
			_hero = this.addImage("welcome_hero", 0, 100);
			_playBtn = this.createButton("welcome_playButton", 500, 260);
			_aboutBtn = this.createButton("welcome_aboutButton", 410, 380);
		}
		private function addBgImage(name:String, xPos:Number, yPos:Number):Image {
			var img:Image = new Image(Assets.getTexture(name));
			img.x = xPos;
			img.y = yPos;
			this.addChild(img);
			return img;
		}
		
		private function addImage(name:String, xPos:Number, yPos:Number):Image {
			var img:Image = new Image(Assets.getAtlas().getTexture(name));
			img.x = xPos;
			img.y = yPos;
			this.addChild(img);
			return img;
		}
		
		private function createButton(name:String, xPos:Number, yPos:Number):Button {
			var btn:Button = new Button(Assets.getAtlas().getTexture(name));
			btn.x = xPos;
			btn.y = yPos;
			this.addChild(btn);
			return btn;
		}
		
		private function enterFrameHandler(e:Event):void {
			var tCos:Number =  Math.cos(getTimer() * 0.002);
			_hero.y = 100 + tCos * 25;
			_playBtn.y = 260 + tCos * 10;
			_aboutBtn.y = 380 + tCos * 10;
		}
		
		private function createEvents():void {
			this.addEventListener(Event.TRIGGERED, this.mainMenuClickEvent);
		}
		
		private function mainMenuClickEvent(e:Event):void {
			switch(e.target) {
				case _playBtn :
					this.viewsController.setView(ViewId.IN_GAME_VIEW);
					break;
				case _aboutBtn :
					this.viewsController.setView(ViewId.ABOUT_VIEW);
					break;
				default :
			}
		}
	}
}