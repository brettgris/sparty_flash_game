package com.eaglesandcobras.common.types.games.graphics{
	import com.eaglesandcobras.common.types.games.graphics.GameScene;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class CutScene extends GameScene {
		private var _nextButton:MovieClip;
		
		public function CutScene(){
			super();
			addEventListener (Event.COMPLETE, done);
			type = GameScene.CUT;
		}
		
		/******************
		Animation Done
		******************/
		private function done(e:Event):void {
			passLevel = true;
			sceneDone();
		}
		
		
		/******************
		SET NEXT BUTTON
		******************/
		public function set nextButton($m:MovieClip):void {
			_nextButton = $m;
			
			_nextButton.buttonMode = true;
			_nextButton.mouseChildren = false;
			_nextButton.addEventListener (MouseEvent.CLICK, playBtnClick);
		}
		
		private function playBtnClick(e:MouseEvent):void {
			_nextButton.removeEventListener (MouseEvent.CLICK, playBtnClick);
			passLevel = true;
			sceneDone();
		}
	}
}