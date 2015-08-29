package com.eaglesandcobras.common.types.games.graphics{
	import com.eaglesandcobras.common.types.games.graphics.GameScene;
	import flash.events.Event;
	
	public class PlayScene extends GameScene {
		private var _pass:Boolean;
		
		public function PlayScene(){
			super();
			addEventListener (Event.COMPLETE, levelComplete);
			type = GameScene.PLAY;
		}
		
		/******************
		Level Complete
		******************/
		private function levelComplete(e:Event):void {
			updatePassLevel();
			sceneDone();
		}
		
		private function updatePassLevel():void {
			trace ("override pass level function!!!");
			passLevel = false;
		}
		
	}
}