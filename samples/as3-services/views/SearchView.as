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
	
	import controllers.IAppController;
	import events.ResultEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import org.flashapi.hummingbird.view.AbstractSpriteView;
	import ui.BasicButton;
	
	public class SearchView extends AbstractSpriteView {
		
		[Controller(alias="AppController")]
		public var controller:IAppController;
		
		override protected function onDependencyComplete():void {
			this.controller.addEventListener(ResultEvent.RESULT, this.searchResultHandler);
			this.initObj();
		}
		
		private var _input:TextField;
		private var _searchBtn:BasicButton;
		private var _result:TextField;
		
		private function initObj():void {
			this.createSearchInput();
			this.createSearchButton();
			this.createResultText();
			this.createBtnEvent();
		}
		
		private function createSearchInput():void {
			_input = new TextField();
			_input.type = TextFieldType.INPUT;
			_input.x = _input.y = 10;
			_input.width = 200;
			_input.height = 20;
			_input.border = true;
			this.addChild(_input);
		}
		
		private function createSearchButton():void {
			_searchBtn = new BasicButton("Search");
			_searchBtn.x = 225;
			_searchBtn.y = 10;
			this.addChild(_searchBtn);
		}
		
		private function createResultText():void {
			_result = new TextField();
			_result.x = 10;
			_result.y = 40;
			_result.width = 315;
			_result.height = 100;
			_result.border = true;
			this.addChild(_result);
		}
		
		private function createBtnEvent():void {
			_searchBtn.addEventListener(MouseEvent.CLICK, this.doSearchHandler);
		}
		
		private function doSearchHandler(e:MouseEvent):void {
			this.controller.doSearch(_input.text);
		}
		
		private function searchResultHandler(e:ResultEvent):void {
			_result.text = e.data;
		}
	}
}