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
	
	import application.SampleContext;
	import flash.display.Sprite;
	import flash.events.Event;
	import org.flashapi.hummingbird.HummingbirdAS;
	
	[SWF(frameRate="30", width="170", height="60", backgroundColor="0xffffff")]
	public class Main extends Sprite {
		
		public function Main() {
			super();
			if(this.stage) this.init(null);
			else this.addEventListener(Event.ADDED_TO_STAGE, this.init);
		}
		
		private function init(e:Event):void {
			if (e) this.removeEventListener(Event.ADDED_TO_STAGE, this.init);
			HummingbirdAS.setApplicationContext(new SampleContext(), this.stage);
		}
	}
}