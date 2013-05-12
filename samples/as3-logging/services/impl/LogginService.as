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
	
	import models.dto.Credentials;
	import org.flashapi.hummingbird.service.AbstractService;
	import services.ILogginService;
	
	[Qualifier(alias="LogginService")]
	public class LogginService extends AbstractService implements ILogginService {
		
		public function sendCrendentials(credentials:Credentials):Boolean {
			return Boolean(
				credentials.loggin == "Pascal" &&
				credentials.password == "hummingbird"
			);
		}
	}
}