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
	
	public interface ISearchService extends IService {
		
		function search(searchString:String):void;
		
		function getResult():String;
	}
}