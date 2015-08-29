package com.eaglesandcobras.common.types.games.graphics{
	import com.eaglesandcobras.common.types.games.graphics.GameScene;
	
	public class QuestionScene extends GameScene {
		private var _submitButton:MovieClip;
		
		public function QuestionScene() {
			super();
			type = GameScene.TRAINING;
		}
		
		/******************
		SET SUBMIT BUTTON
		******************/
		public function set submitButton($m:MovieClip):void {
			_submitButton = $m;
			
			_submitButton.buttonMode = true;
			_submitButton.mouseChildren = false;
			_submitButton.addEventListener (MouseEvent.CLICK, submitBtnClick);
		}
		
		private function submitBtnClick(e:MouseEvent):void {
			_submitButton.removeEventListener (MouseEvent.CLICK, submitBtnClick);
			passLevel = true;
			sceneDone();
		}
		
		/**********************
		SET CORRECT ANSWER
		**********************/
		
	}
}