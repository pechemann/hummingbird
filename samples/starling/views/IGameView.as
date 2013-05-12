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

package views {
	
	import org.flashapi.hummingbird.view.IView;
	
	/**
	 * ...
	 * @author Pascal ECHEMANN
	 */
	public interface IGameView extends IView {
		
		function initialize():void;
		
		function freeze():void;
	}
}