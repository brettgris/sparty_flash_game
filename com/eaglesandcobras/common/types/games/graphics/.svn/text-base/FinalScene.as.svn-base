package com.eaglesandcobras.common.types.games.graphics{
	import com.eaglesandcobras.common.types.games.graphics.GameScene;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.MovieClip;
	
	public class FinalScene extends GameScene {
		private var _replayButton:MovieClip;
		
		public function FinalScene(){
			super();
			addEventListener (Event.COMPLETE, waiting);
			
			type = GameScene.END;
		}
		
		/******************
		Waiting
		******************/
		private function waiting(e:Event):void {
			sceneWaiting();
		}
		
		/******************
		SET PLAY BUTTON
		******************/
		public function set replayButton($m:MovieClip):void {
			_replayButton = $m;
			
			_replayButton.buttonMode = true;
			_replayButton.addEventListener (MouseEvent.CLICK, playBtnClick);
		}
		
		private function playBtnClick(e:MouseEvent):void {
			_replayButton.removeEventListener (MouseEvent.CLICK, playBtnClick);
			removeEventListener (Event.COMPLETE, waiting);
			passLevel = true;
			sceneDone();
		}
		
		/******************
		SHOW SCORE
		******************/
		
		
		
	}
}