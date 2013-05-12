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

package models {
	
	import org.flashapi.hummingbird.model.AbstractModel;
	
	[Qualifier(alias="HomeModel")]
	public class HomeModel extends AbstractModel implements IHomeModel{
		
		public function getMessage():String {
			return "You are on the home page!";
		}
	}
}