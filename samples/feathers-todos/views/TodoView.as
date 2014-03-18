package views {
	
	import controllers.IAppController;
	import events.ModelEvent;
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.List;
	import feathers.controls.PanelScreen;
	import feathers.controls.ScrollContainer;
	import feathers.controls.TextInput;
	import feathers.events.FeathersEventType;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import models.IAppModel;
	import org.flashapi.hummingbird.factory.ViewAdapterFactory;
	import org.flashapi.hummingbird.Hummingbird;
	import org.flashapi.hummingbird.utils.adapters.IViewAdapter;
	import org.flashapi.hummingbird.utils.adapters.StarlingViewAdapter;
	import org.flashapi.hummingbird.view.IStarlingView;
	import starling.display.DisplayObject;
	import starling.events.Event;
	import ui.renderers.TodoItemRenderer;
	
	public class TodoView extends PanelScreen implements IStarlingView {
		
		public function TodoView() {
			super();
			this.initObj();
		}
		
		[Model(alias="AppModel")]
		public var model:IAppModel;
		
		[Controller(alias="AppController")]
		public var controller:IAppController;
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@inheritDoc
		 */
		public function finalize():void {
			_adapter.finalize();
			_adapter = null;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------
		
		private var _adapter:IViewAdapter;
		
		private var _list:List;
		
		private var _input:TextInput;
		private var _toolbar:ScrollContainer;
		private var _editButton:Button;
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		private function initObj():void {
			_adapter = 	ViewAdapterFactory
						.makeFactory(StarlingViewAdapter)
						.getViewAdapter(this, this.onDependencyComplete);
			this.addEventListener(FeathersEventType.INITIALIZE, this.initializeHandler);
		}
		
		private function onDependencyComplete():void {
			Hummingbird.getLogger().debug("TodoView.onDependencyComplete()");
			this.model.addEventListener(ModelEvent.EDITION_MODE_CHANGE, this.editionModeChangeHandler);
		}
		
		private function initializeHandler():void {
			this.width = this.stage.stageWidth;
			this.height = this.stage.stageHeight;
			this.layout = new AnchorLayout();
			this.headerFactory = this.customHeaderFactory;
			this.footerFactory = this.customFooterFactory;

			_list = new List();
			_list.isSelectable = false;
			_list.dataProvider = this.model.getTodoList();
			_list.itemRendererType = TodoItemRenderer;
			_list.itemRendererProperties.labelField = this.model.getItemLabelField();
			const listLayoutData:AnchorLayoutData = new AnchorLayoutData(0, 0, 0, 0);
			listLayoutData.topAnchorDisplayObject = _input;
			_list.layoutData = listLayoutData;
			this.addChild(_list);
		}
		
		private function customHeaderFactory():Header {
			const HEADER:Header = new Header();
			HEADER.title = "TODOS";
			HEADER.titleAlign = Header.TITLE_ALIGN_PREFER_LEFT;
			if(!_input) {
				_input = new TextInput();
				_input.prompt = "What needs to be done?";
				//we can't get an enter key event without changing the returnKeyLabel
				//not using ReturnKeyLabel.GO here so that it will build for web
				_input.textEditorProperties.returnKeyLabel = "go";
				_input.addEventListener(FeathersEventType.ENTER, this.inputEnterHandler);
			}
			HEADER.rightItems = new <DisplayObject>[_input];
			return HEADER;
		}

		private function customFooterFactory():ScrollContainer {
			if(!_toolbar) {
				_toolbar = new ScrollContainer();
				_toolbar.nameList.add(ScrollContainer.ALTERNATE_NAME_TOOLBAR);
			} else {
				_toolbar.removeChildren();
			}
			if(!_editButton) {
				_editButton = new Button();
				_editButton.isToggle = true;
				_editButton.label = "Edit";
				_editButton.addEventListener(Event.CHANGE, this.editButtonCchangeHandler);
			}
			_toolbar.addChild(_editButton);
			return _toolbar;
		}
		
		private function inputEnterHandler():void {
			this.controller.addItem(_input.text);
			_input.text = "";
		}
		
		private function editButtonCchangeHandler(e:Event):void {
			this.controller.setEditionMode(_editButton.isSelected);
		}
		
		private function editionModeChangeHandler(e:ModelEvent):void {
			const isEditing:Boolean = this.model.getEditionMode();
			_list.itemRendererProperties.isEditable = isEditing;
			_input.visible = !isEditing;
		}
	}
}