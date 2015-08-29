package com.starz.games.sparty.builder.scenes{
	import com.eaglesandcobras.common.types.games.graphics.FinalScene;
	import com.starz.games.sparty.builder.components.StackerScore;
	import com.greensock.TweenLite;
	import com.eaglesandcobras.common.events.GameEvent;
	import flash.events.MouseEvent;
	import com.starz.games.sparty.builder.sounds.StackerSounds;
	
	public class GameOver extends FinalScene{
		private var _score:StackerScore;
		
		public function GameOver(){
			super();
		}
		
		override public function init():void {
			replayButton = box.replayBtn;
			
			box.replayBtn.addEventListener(MouseEvent.ROLL_OVER, buttonOver);
			_score = score as StackerScore;
			
			if (params.passLevel) {
				box.winMessage.visible = true;
				box.loseMessage.visible= false;
			} else {
				box.winMessage.visible = false;
				box.loseMessage.visible = true;
			}
			
			updateScore();
			animateIn();
		}
		
		/***************
		SET INITIAL SCORES
		***************/
		private function updateScore():void {
			box.scoringModule.updateScore(_score.totalScore, _score.roundScore);
		}
		
		private function animateIn():void {
			//var ax:Number = actor.x;
			var bx:Number = box.x;
			
			//actor.x = 1000;
			box.x = 1500;
			
			//TweenLite.to( actor, .5, {x:ax});
			TweenLite.to( box, .5, {x:bx, delay:.25, onComplete:doScore});
			this.dispatchEvent( new GameEvent (GameEvent.PLAY_SOUND, {sound:StackerSounds.TRANSITION_SOUND} ) );
		}
		
		private function doScore():void{
			box.scoringModule.go();
		}
		
		private function buttonOver(e:MouseEvent):void {
			this.dispatchEvent( new GameEvent (GameEvent.PLAY_SOUND, {sound:StackerSounds.BUTTON_OVER} ));
		}
	}
}