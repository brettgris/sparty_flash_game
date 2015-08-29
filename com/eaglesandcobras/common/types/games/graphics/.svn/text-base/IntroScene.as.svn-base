package com.eaglesandcobras.common.types.games.graphics{
	import com.eaglesandcobras.common.types.games.graphics.GameScene;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.MovieClip;
	
	public class IntroScene extends GameScene {
		private var _playButton:MovieClip;
		
		public function IntroScene(){
			super();
			addEventListener (Event.COMPLETE, waiting);
			type = GameScene.INTRO;
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
		public function set playButton($m:MovieClip):void {
			_playButton = $m;
			
			_playButton.buttonMode = true;
			_playButton.mouseChildren = false;
			_playButton.addEventListener (MouseEvent.CLICK, playBtnClick);
		}
		
		private function playBtnClick(e:MouseEvent):void {
			_playButton.removeEventListener (MouseEvent.CLICK, playBtnClick);
			removeEventListener (Event.COMPLETE, waiting);
			passLevel = true;
			sceneDone();
		}
		
		/******************
		SET HELP BUTTON
		******************/
	}
}