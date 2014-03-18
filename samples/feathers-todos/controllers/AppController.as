/////////////////////////////////////////////////////////////////////////////////////
//
//    Hummingbird Framework Template
//    ==============================
//    
//    Copyright 2013-2014 Pascal ECHEMANN.
//    All Rights Reserved.
//    
//    NOTICE: The author permits you to use, modify, and distribute this file
//    in accordance with the terms of the license agreement accompanying it.
//    
/////////////////////////////////////////////////////////////////////////////////////

package controllers {
	
	import flash.utils.getTimer;
	import org.flashapi.hummingbird.controller.AbstractController;
	import models.IAppModel;
	
	[Qualifier(alias="AppController")]
	public final class AppController extends AbstractController implements IAppController {
		
		[Model(alias="AppModel")]
		public var model:IAppModel;
		
		public function addItem(value:String):void {
			if (value) {
				this.model.addItem(value);
			}
		}
		
		public function setEditionMode(isEditing:Boolean):void {
			this.model.setEditionMode(isEditing);
		}
		
		public function removeItemAt(index:int):void {
			this.model.removeItemAt(index);
		}
	}
}