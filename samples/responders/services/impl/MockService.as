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

package services.impl {
	
	import org.flashapi.hummingbird.service.AbstractService;
	import org.flashapi.hummingbird.service.ServiceResponder;
	import services.IAppService;
	
	[Qualifier(alias="MockService")]
	public class MockService extends AbstractService implements IAppService {
		
		public function getWelcomeMessage(responder:ServiceResponder, name:String):void {
			var message:String = "Hello " + name + "!";
			this.operationResult(responder, message); 
		}
	}
}