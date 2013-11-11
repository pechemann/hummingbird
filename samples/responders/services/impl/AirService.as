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
	
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import org.flashapi.hummingbird.service.AbstractService;
	import org.flashapi.hummingbird.service.ServiceResponder;
	import services.IAppService;
	
	[Qualifier(alias="AirService")]
	public class AirService extends AbstractService implements IAppService {
		
		public function getWelcomeMessage(responder:ServiceResponder, name:String):void {
			var file:File = File.applicationDirectory.resolvePath("hello.txt");
			var fileStream:FileStream = new FileStream();
			try {
				fileStream.open(file, FileMode.READ);
				var message:String = String(fileStream.readUTFBytes(fileStream.bytesAvailable));
				message.replace(/name/, name);
				this.operationResult(responder, message); 
				fileStream.close();
			} catch (e:Error) {
				this.operationFault(responder, e.message); 
			}
		}
	}
}