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
	
	import events.ServiceEvent;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import org.flashapi.hummingbird.service.AbstractService;
	import services.ISearchService;
	
	[Qualifier(alias="GoogleSearchService")]
	public class GoogleSearchService extends AbstractService implements ISearchService {
		
		public function search(searchString:String):void {
			var searchContext:String = "key=[INSERT-YOUR-KEY]&cx=013036536707430787589:_pqjad5hr1a&q=";
			searchContext += searchString;
			var request:URLRequest = new URLRequest(searchContext += "&alt=json");
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, this.completeHandler);
			loader.load(request);
		}
		
		public function getResult():String {
			return _searchResult;
		}
		
		private static const DEST_URL:String = "https://www.googleapis.com/customsearch/v1?";
		
		private var _searchResult:String;
		
		private function completeHandler(e:Event):void {
			var loader:URLLoader = URLLoader(e.target);
			loader.removeEventListener(Event.COMPLETE, this.completeHandler);
			_searchResult = loader.data;
			loader = null;
			this.dispatchEvent(new ServiceEvent(ServiceEvent.TRANSACTION_SUCCESS));
		}
	}
}