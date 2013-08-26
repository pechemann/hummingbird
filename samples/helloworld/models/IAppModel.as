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
	
	import org.flashapi.hummingbird.model.IModel;
	
	/**
	 * 	The <code>IAppModel</code> interface represents the facade for the default 
	 * 	model of your application.
	 */
	public interface IAppModel extends IModel {
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Returns the prompt message of the application.
		 * 
		 * 	@return The prompt message of the application.
		 */
		function getPromptMessage():String;
		
		/**
		 * 	Sets the prompt message of the application.
		 * 
		 * 	@param	promptMessage	 The new prompt message of the application.
		 */
		function setPromptMessage(promptMessage:String):void;
	}
}