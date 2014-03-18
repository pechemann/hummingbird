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

package application {
	
	import org.flashapi.hummingbird.core.AbstractApplicationContext;
	import org.flashapi.hummingbird.Hummingbird;
	import org.flashapi.hummingbird.view.IView;
	import ui.theme.TodosTheme;
	import views.TodoView;
	
	public class FeathersContext extends AbstractApplicationContext {
		
		include "dependencies.as"
		
		override public function start():void {
			new TodosTheme();
			Hummingbird.getStarling().start();
			var view:IView = Hummingbird.getFactory().createView(TodoView);
			Hummingbird.addToScene(view);
		}
	}
}