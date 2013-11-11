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

package services {
	
	import org.flashapi.hummingbird.service.IService;
	import org.flashapi.hummingbird.service.ServiceResponder;
	
	public interface IAppService extends IService {
		
		/**
		 * 	
		 * 
		 * 	@param The responder used to handle the response of the service.
		 */
		function getWelcomeMessage(responder:ServiceResponder, name:String):void;
	}
}