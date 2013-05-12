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
	
	import constants.GameState;
	import controllers.IAppController;
	import controllers.IViewsController;
	import models.IAppModel;
	import org.flashapi.hummingbird.view.AbstractStarlingSpriteView;
	import starling.display.Button;
	import starling.events.Event;
	import ui.Assets;
	import ui.display.GameBackground;
	import ui.display.Hero;
	
	public class InGameView extends AbstractStarlingSpriteView implements IGameView {
		
		[Model(alias="AppModel")]
		public var appModel:IAppModel;
		
		[Controller(alias="AppController")]
		public var appController:IAppController;
		
		[Controller(alias="ViewsController")]
		public var viewsController:IViewsController;
		
		public function initialize():void {
			this.setBackgroundSpeed();
			_background.initialize();
			_hero.x = -this.stage.stageWidth;
			_hero.y = -this.stage.stageHeight * 0.5;
			_hero.initialize();
			this.addEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
		}
		
		public function freeze():void {
			this.removeEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
			_background.freeze();
			_hero.freeze();
		}
		
		private var _background:GameBackground;
		private var _startBtn:Button;
		private var _hero:Hero;
		
		override protected function onAddedToStage():void {
			this.createGameStage();
			this.startButton();
		}
		
		private function createGameStage():void {
			_background = new GameBackground();
			this.addChild(_background);
			_hero = new Hero();
			this.addChild(_hero);
		}
		
		private function startButton():void {
			_startBtn = new Button(Assets.getAtlas().getTexture("startButton"));
			_startBtn.x = (this.stage.stageWidth - _startBtn.width) / 2;
			_startBtn.y = (this.stage.stageHeight - _startBtn.height) / 2;
			_startBtn.addEventListener(Event.TRIGGERED, this.starButtonClickHandler);
			this.addChild(_startBtn);
		}
		
		private function enterFrameHandler(e:Event):void {
			//trace("enterFrameHandler");
			this.appController.nextFrame();
			var stageOffset:Number = this.stage.stageWidth / 4 - _hero.width;
			var heroState:uint = this.appModel.getState();
			if (heroState == GameState.IDLE) {
				if (_hero.x < stageOffset) {
					_hero.x += (stageOffset + 10 - _hero.x) * 0.05;
					_hero.y = this.stage.stageHeight * 0.5;
					this.setBackgroundSpeed();
				} else {
					this.appController.setState(GameState.FLYING);
				}
			} else if (heroState == GameState.FLYING) {
				this.setBackgroundSpeed();
			} else if (heroState == GameState.OVER) {
				
			}
		}
		
		private function setBackgroundSpeed():void {
			_background.setSpeed(this.appModel.getPlayerSpeed() * this.appModel.getElapsedTime());
		}
		
		private function starButtonClickHandler(e:Event):void {
			_startBtn.visible = false;
			_startBtn.removeEventListener(Event.TRIGGERED, this.starButtonClickHandler);
			this.appController.setState(GameState.IDLE);
		}
	}
}