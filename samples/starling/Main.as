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
	
	import flash.display.Sprite;
	import flash.events.Event;
	import org.flashapi.hummingbird.Hummingbird;
	import application.StarlingContext;
	import org.flashapi.hummingbird.starling.StarlingProperties;
	import org.flashapi.hummingbird.starling.StarlingPropertiesBuilder;
	
	[SWF(frameRate="60", width="800", height="600", backgroundColor="0x333333")]
	public class Main extends Sprite {
		
		public function Main() {
			super();
			if(this.stage) this.init(null);
			else this.addEventListener(Event.ADDED_TO_STAGE, this.init);
		}
		
		private function init(e:Event):void {
			if (e) this.removeEventListener(Event.ADDED_TO_STAGE, this.init);
			var props:StarlingProperties =
				new StarlingPropertiesBuilder().antiAliasing(1).showStats(true).build();
			Hummingbird.setApplicationContext(new StarlingContext(), this.stage, props);
		}
	}
}