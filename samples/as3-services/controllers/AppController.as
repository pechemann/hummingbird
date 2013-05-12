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
	
	import events.ResultEvent;
	import events.ServiceEvent;
	import org.flashapi.hummingbird.controller.AbstractController;
	import org.flashapi.hummingbird.events.DependencyEvent;
	import services.ISearchService;
	
	[Qualifier(alias="AppController")]
	public final class AppController extends AbstractController implements IAppController {
		
		public function AppController() {
			super();
			this.addEventListener(DependencyEvent.DEPENDENCY_COMPLETE, this.dependencyCompleteHandler);
		}
		
		//[Service(alias="YahooSearchService")]
		[Service(alias="MockSearchService")]
		public var searchService:ISearchService;
		
		public function doSearch(searchString:String):void {
			this.searchService.search(searchString);
		}
		
		private function dependencyCompleteHandler(e:DependencyEvent):void {
			this.removeEventListener(DependencyEvent.DEPENDENCY_COMPLETE, this.dependencyCompleteHandler);
			this.searchService.addEventListener(ServiceEvent.TRANSACTION_SUCCESS, this.transactionSuccessHandler);
		}
		
		private function transactionSuccessHandler(e:ServiceEvent):void {
			var evt:ResultEvent = new ResultEvent(ResultEvent.RESULT);
			evt.data = this.searchService.getResult();
			this.dispatchEvent(evt);
		}
	}
}