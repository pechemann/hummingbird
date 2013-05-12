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

package application {
	
	import constants.ViewId;
	import controllers.IViewsController;
	import org.flashapi.hummingbird.core.AbstractApplicationContext;
	import org.flashapi.hummingbird.Hummingbird;
	
	public class StarlingContext extends AbstractApplicationContext {
		
		include "dependencies.as"
		
		[Controller(alias="ViewsController")]
		public var viewsController:IViewsController;
		
		override public function start():void {
			Hummingbird.getStarling().start();
			this.viewsController.setView(ViewId.WELCOME_VIEW);
		}
	}
}