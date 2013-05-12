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
	import org.flashapi.hummingbird.service.AbstractService;
	import services.ISearchService;
	
	[Qualifier(alias="MockSearchService")]
	public class MockSearchService extends AbstractService implements ISearchService {
		
		public function search(searchString:String):void {
			_searchString = searchString;
			this.dispatchEvent(new ServiceEvent(ServiceEvent.TRANSACTION_SUCCESS));
		}
		
		public function getResult():String {
			return "You have searched: " + _searchString;
		}
		
		private var _searchString:String;
	}
}