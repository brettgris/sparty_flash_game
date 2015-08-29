package com.starz.games.sparty.builder.components{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import com.greensock.TweenLite;
	import com.eaglesandcobras.common.events.GameEvent;
	import com.starz.games.sparty.builder.sounds.StackerSounds;
	
	public class CutScoring extends MovieClip{
		private var _t:Timer;
		private var _roundScore:int;
		
		public function CutScoring(){
			super();
			
			init();
		}
		
		private function init():void{
			divider.alpha = 0;
			roundScore.alpha = 0;
			divider.visible = false;
			roundScore.visible = false;
			totalScore.visible = false;
			totalScore.x = 0;
		}
		
		/**************************
		UPDATE SCORE
		**************************/
		public function updateScore($totalScore:int, $roundScore):void {
			totalScore.scoreTxt.text = $totalScore;
			roundScore.scoreTxt.text = $roundScore;
			
			_roundScore = $roundScore;
		}
		
		/***************
		GO
		***************/
		public function go():void {
			totalScore.x = 0;
			
			divider.visible = true;
			roundScore.visible = true;	
			totalScore.visible = true;
			
			if (_roundScore>0) {
				TweenLite.to(totalScore, .5, {x:-1*bg.width/4});
				TweenLite.to(divider, .5, {alpha:1});
				TweenLite.to(roundScore, .5, {delay:.25, alpha:1, onComplete:updateTotal});
			}			
		}
		
		/***************
		ANIMATE TOTAL
		***************/
		private function updateTotal():void {
			_t = new Timer( 50, Math.floor( int( roundScore.scoreTxt.text)/100 ) );
			_t.addEventListener(TimerEvent.TIMER, totalChange);
			_t.addEventListener(TimerEvent.TIMER_COMPLETE, totalDone);
			_t.start();
		}
		
		private function totalChange(e:TimerEvent):void {
			this.dispatchEvent( new GameEvent (GameEvent.PLAY_SOUND, {sound:StackerSounds.SCORE_IT} ) );
			
			var s:int = int ( totalScore.scoreTxt.text );
			totalScore.scoreTxt.text = s + 100;
			var p:int = int ( roundScore.scoreTxt.text );
			roundScore.scoreTxt.text = p - 100;
		}
		
		private function totalDone(e:TimerEvent=null):void {
			_t.removeEventListener(TimerEvent.TIMER, totalChange);
			_t.removeEventListener(TimerEvent.TIMER_COMPLETE, totalDone);
			
			var o:int = _roundScore%100;
			var s:int = int ( totalScore.scoreTxt.text );
			totalScore.scoreTxt.text = s + o;
			
			roundScore.scoreTxt.text = 0;
			
			TweenLite.to(totalScore, .5, {x:0});
			TweenLite.to(divider, .5, {alpha:0});
			TweenLite.to(roundScore, .5, {alpha:0});
		}
	}
}