package com.starz.games.sparty.builder.components{
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import com.greensock.TweenLite;
	import flash.utils.setTimeout;
	import com.eaglesandcobras.common.events.GameEvent;
	import com.starz.games.sparty.builder.sounds.StackerSounds;

	public class EndLevelScore extends MovieClip{
		private var _score:StackerScore;
		private var _t:Timer;
		private var _var:Object;
		private var _itemNum:int =0;
		
		public function EndLevelScore(){
			super();
		}
		
		public function update($s:StackerScore):void {
			_score = $s;
			
			divideLine.visible = false;
			roundItem.visible = false;
			
			roundScore.scoreTxt.text = 0;
			
			_var = new Object();
			
			_t = new Timer(1000, 1);
			_t.addEventListener(TimerEvent.TIMER, startScoring);
			_t.start();
		}
		
		private function startScoring(e:TimerEvent):void {
			_t.removeEventListener(TimerEvent.TIMER, done);
			
			_var.rX = roundScore.x;
			
			divideLine.alpha = 0;
			divideLine.visible = true;
			
			if ( _score.roundScore>0) {
				TweenLite.to (divideLine, .5, {alpha:1});
				TweenLite.to( roundScore, .5 , {x:_var.rX-85, onComplete:showBlocksAdded});
			} else {
				setTimeout (done, 2000);
			}
			
		}
		
		private function showBlocksAdded():void {
			roundItem.itemTxt.text = "BLOCKS ADDED";
			roundItem.scoreTxt.text = String ( _score.blocksAdded );
			
			roundItem.visible = true;
			
			_itemNum = _score.blocksAdded;
			_t = new Timer ( 50, _itemNum );
			_t.addEventListener(TimerEvent.TIMER, updateItemBlockAdded);
			_t.addEventListener(TimerEvent.TIMER_COMPLETE, showBlocksRemoved);
			_t.start();
		}
		
		private function updateItemBlockAdded(e:TimerEvent):void {
			this.dispatchEvent( new GameEvent (GameEvent.PLAY_SOUND, {sound:StackerSounds.SCORE_IT} ) );
			
			_itemNum--;
			roundItem.scoreTxt.text = String ( _itemNum );
			
			var current:int = int (roundScore.scoreTxt.text);
			roundScore.scoreTxt.text = String ( current + StackerScore.PER_BLOCK );
		}
		
		private function showBlocksRemoved(e:TimerEvent):void {
			_t.removeEventListener(TimerEvent.TIMER, updateItemBlockAdded);
			_t.removeEventListener(TimerEvent.TIMER_COMPLETE, showBlocksRemoved);
			
			_itemNum = _score.blocksRemoved;
			
			
			if (_itemNum==0) showTimeLeft();
			else {
				roundItem.itemTxt.text = "BLOCKS REMOVED";
				roundItem.scoreTxt.text = String ( _itemNum );
				
				_t = new Timer ( 50, _itemNum );
				_t.addEventListener(TimerEvent.TIMER, updateItemBlockRemoved);
				_t.addEventListener(TimerEvent.TIMER_COMPLETE, showTimeLeft);
				_t.start();
			}
		}
		
		private function updateItemBlockRemoved(e:TimerEvent):void {
			_itemNum--;
			roundItem.scoreTxt.text = String ( _itemNum );
			
			this.dispatchEvent( new GameEvent (GameEvent.PLAY_SOUND, {sound:StackerSounds.SCORE_IT} ) );
			
			var current:int = int (roundScore.scoreTxt.text);
			roundScore.scoreTxt.text = String ( current - StackerScore.PER_FALL);
		}
		
		private function showTimeLeft(e:TimerEvent=null):void {
			_t.removeEventListener(TimerEvent.TIMER, updateItemBlockRemoved);
			_t.removeEventListener(TimerEvent.TIMER_COMPLETE, showTimeLeft);
			
			_itemNum = _score.roundTime;
			
			if (_itemNum==0) doneAdding();
			else {
				roundItem.itemTxt.text = "TIME LEFT";
				roundItem.scoreTxt.text = String ( _itemNum );
				
				_t = new Timer ( 50, _itemNum );
				_t.addEventListener(TimerEvent.TIMER, updateItemTime);
				_t.addEventListener(TimerEvent.TIMER_COMPLETE, doneAdding);
				_t.start();
			}
		}
		
		private function updateItemTime(e:TimerEvent):void {
			_itemNum--;
			roundItem.scoreTxt.text = String ( _itemNum );
			
			this.dispatchEvent( new GameEvent (GameEvent.PLAY_SOUND, {sound:StackerSounds.SCORE_IT} ) );
			
			var current:int = int (roundScore.scoreTxt.text);
			roundScore.scoreTxt.text = String ( current + StackerScore.PER_SECOND);
		}
		
		private function doneAdding(e:TimerEvent=null):void {
			_t.removeEventListener(TimerEvent.TIMER, updateItemTime);
			_t.removeEventListener(TimerEvent.TIMER_COMPLETE, doneAdding);
			
			roundItem.visible = false;
			divideLine.visible = false;
			
			var current:int = int (roundScore.scoreTxt.text);
			if ( current <0 ) roundScore.scoreTxt.text = 0;
			
			_score.roundScore = int ( roundScore.scoreTxt.text );
			
			TweenLite.to( roundScore, .5 , {x:_var.rX, onComplete:done});
		}
		
		/****************************
		ALL DONE
		****************************/
		private function done():void {
			this.dispatchEvent( new Event (Event.COMPLETE) );
		}
	}
}