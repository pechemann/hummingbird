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
	
	import org.flashapi.hummingbird.core.AbstractApplicationContext;
	import org.flashapi.hummingbird.HummingbirdAS;
	import org.flashapi.hummingbird.view.IView;
	import views.SearchView;
	
	public class ServicesContext extends AbstractApplicationContext {
		
		include "dependencies.as"
		
		override public function start():void {
			var view:IView = HummingbirdAS.getFactory().createView(SearchView);
			HummingbirdAS.addToScene(view);
		}
	}
}