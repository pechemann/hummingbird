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
	
	import controllers.IAppController;
	import org.flashapi.hummingbird.core.AbstractApplicationContext;
	import org.flashapi.hummingbird.HummingbirdAS;
	
	public class AppContext extends AbstractApplicationContext {
		
		include "dependencies.as"
		
		[Controller(alias="AppController")]
		public var controller:IAppController;
		
		override public function start():void {
			this.controller.sayHello("Pascal");
		}
	}
}