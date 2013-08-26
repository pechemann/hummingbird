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

package {
	
	import application.AppContext;
	import flash.display.Sprite;
	import flash.events.Event;
	import org.flashapi.hummingbird.HummingbirdAS;
	
	/**
	 * 	The <code>Main</code> class represents the entry point of your application.
	 */
	[SWF(frameRate="30", width="100", height="40", backgroundColor="0xffffff")]
	public class Main extends Sprite {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Constructor.	Creates a new instance of the <code>Main</code> class.
		 */
		public function Main() {
			super();
			if(this.stage) this.init(null);
			else this.addEventListener(Event.ADDED_TO_STAGE, this.init);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Called by the constructor function to initialize the application.
		 */
		private function init(e:Event):void {
			if (e) this.removeEventListener(Event.ADDED_TO_STAGE, this.init);
			//--> Hummingbird Framework declaration:
			HummingbirdAS.setApplicationContext(new AppContext(), this.stage);
		}
	}
}