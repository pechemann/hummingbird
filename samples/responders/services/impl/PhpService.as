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
	
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import org.flashapi.hummingbird.service.AbstractService;
	import org.flashapi.hummingbird.service.ServiceResponder;
	import services.IAppService;
	
	[Qualifier(alias="PhpService")]
	public class PhpService extends AbstractService implements IAppService {
		
		public function getWelcomeMessage(responder:ServiceResponder, name:String):void {
			_responder = responder;
			var request:URLRequest = this.getUrlRequest(name);
			var loader:URLLoader = this.createUrlLoader();
			loader.load(request);
		}
		
		private var _responder:ServiceResponder;
		
		private static const DEST_URL:String = "http://localhost/responders/hello_world.php";
		
		private function getUrlRequest(name:String):URLRequest {
			var request:URLRequest = new URLRequest(PhpService.DEST_URL);
			request.method = URLRequestMethod.GET; 
			var variables:URLVariables = new URLVariables(); 
			variables.name = name;            
			request.data = variables; 
			return request;
		}
		
		private function createUrlLoader():URLLoader {
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, this.httpRequestComplete);
			loader.addEventListener(IOErrorEvent.IO_ERROR, this.httpRequestError); 
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.httpRequestError);
			return loader;
		}
		
		private function httpRequestComplete(e:Event):void {
			var loader:URLLoader = URLLoader(e.target);
			this.operationResult(_responder, loader.data); 
			this.dispose(loader);
		}
		
		private function httpRequestError(e:ErrorEvent):void {
			var loader:URLLoader = URLLoader(e.target);
			this.operationFault(_responder, e.text);
			this.dispose(loader);
		}
		
		private function dispose(loader:URLLoader):void {
			loader.removeEventListener(Event.COMPLETE, this.httpRequestComplete);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, this.httpRequestError);
			loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.httpRequestError);
			loader = null;
			_responder = null;
		}
	}
}