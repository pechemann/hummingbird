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

package controllers {
	
	import org.flashapi.hummingbird.controller.AbstractController;
	import org.flashapi.hummingbird.service.ServiceResponder;
	import services.IAppService;
	
	[Qualifier(alias="AppController")]
	public final class AppController extends AbstractController implements IAppController {
		
		[Service(alias="MockService")]
		//[Service(alias="PhpService")]
		//[Service(alias="AirService")]
		public var service:IAppService;
		
		public function sayHello(name:String):void {
			var responder:ServiceResponder =
				new ServiceResponder(this.resultHandler, this.faultHandler);
			this.service.getWelcomeMessage(responder, name);
		}
		
		private function resultHandler(result:Object):void {
			trace(String(result));
		}
		
		private function faultHandler(fault:Object):void {
			trace(String(fault));
		}
	}
}