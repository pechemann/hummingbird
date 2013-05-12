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
	
	import models.dto.Credentials;
	import org.flashapi.hummingbird.controller.AbstractController;
	import models.IAppModel;
	import services.ILogginService;
	
	[Qualifier(alias="AppController")]
	public final class AppController extends AbstractController implements IAppController {
		
		[Model(alias="AppModel")]
		public var model:IAppModel;
		
		[Service(alias="LogginService")]
		public var logginService:ILogginService;
		
		public function setCredentials(loggin:String, password:String):void {
			var credentials:Credentials = new Credentials();
			credentials.loggin = loggin;
			credentials.password = password;
			var isLogged:Boolean = this.logginService.sendCrendentials(credentials);
			if (isLogged) {
				this.logginService = null;
				this.model.setLogging(loggin);
			} else {
				this.model.setLogging(null);
			}
		}
	}
}