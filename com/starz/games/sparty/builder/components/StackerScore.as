package com.starz.games.sparty.builder.components{
	import com.eaglesandcobras.common.types.games.scoring.Scoring;
	
	public class StackerScore extends Scoring{
		public static const PER_BLOCK:int = 50;
		public static const PER_FALL:int = 400;
		public static const PER_SECOND:int = 250;
		
		private var _blocksAdded:int;
		private var _blocksRemoved:int;
		private var _blocks:int;
		private var _time:int;
		private var _timeLeft:int;
		private var _score:int;
		
		public function StackerScore(){
			super();
		}
		
		public function reset():void {
			_score = 0;
			_blocks = 0;
			_blocksAdded = 0;
			_blocksRemoved = 0;
			_time = 0;
			_timeLeft = 0;
		}
		
		public function blockAdded():void {
			_blocksAdded++;
		}
		
		public function blockFell():void {
			_blocksRemoved++;
		}
		
		public function roundEnd($secs:int, $timeGiven:int):void {
			_time = $secs;
			_timeLeft = $timeGiven-$secs;
			
			_score += _blocksAdded*PER_BLOCK;
			
			_score -= _blocksRemoved*PER_FALL;
			
			_score += _time*PER_SECOND;
			
			if (_score<0) _score=0;
			
			_blocks = _blocksAdded-_blocksRemoved;
		}
		
		
		/*************************
		GETTERS
		*************************/
		public function set roundScore($n:int):void {
			_score = $n;
		}
		
		public function get roundScore():int {
			return _score;
		}
		
		public function get roundTime():int {
			return _time;
		}
		
		public function get roundBlocks():int {
			return _blocks;
		}
		
		public function get blocksAdded():int {
			return _blocksAdded;
		}
		
		public function get blocksRemoved():int {
			return _blocksRemoved;
		}
		
		
	}
}