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

package ui {
	
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class Assets {
		
		public static function getAtlas():TextureAtlas {
			if (_atlasTexture == null) {
				var texture:Texture = Assets.getTexture("SPRITE_SHEET");
				var xml:XML = XML(new Assets.SPRITE_SHEET_DEF());
				_atlasTexture = new TextureAtlas(texture, xml);
			}
			return Assets._atlasTexture;
		}
		
		public static function getTexture(name:String):Texture {
			if (Assets.GAME_TEXTURE[name] == undefined) {
				var bitmap:Bitmap = new Assets[name]();
				Assets.GAME_TEXTURE[name] = Texture.fromBitmap(bitmap);
			}
			return Assets.GAME_TEXTURE[name];
		}
		
		private static const GAME_TEXTURE:Dictionary = new Dictionary();
		
		private static var _atlasTexture:TextureAtlas;
		
		[Embed(source="assets/graphics/spritesheet.png")]
		private static const SPRITE_SHEET:Class;
		
		[Embed(source="assets/graphics/spritesheet.xml", mimeType="application/octet-stream")]
		private static const SPRITE_SHEET_DEF:Class;
		
		[Embed(source="assets/graphics/bgWelcome.jpg")]
		private static const BG_WELCOME:Class;
		
		[Embed(source="assets/graphics/bgLayer.jpg")]
		private static const BG_LAYER:Class;
	}
}