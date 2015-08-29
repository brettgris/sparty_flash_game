package com.eaglesandcobras.common.types.games.scoring{
	
	public class Scoring extends Object{
		private var _totalScore:int=0;
		private var _time:int = 0;
		private var _units:int = 0;
		
		public function Scoring() {
			super();
		}
		
		/***********************
		TOTAL SCORE
		***********************/
		public function get totalScore():int{
			return _totalScore;
		}
		
		public function set totalScore($n:int):void {
			_totalScore = $n;
		}
		
		/***********************
		TIME
		***********************/
		public function get time():int {
			return _time;
		}
		
		public function set time($n:int):void {
			_time = $n;
		}
		
		/***********************
		Units
		***********************/
		public function get units():int{
			return _units;
		}
		
		public function set units($n:int):void{
			_units = $n;
		}
		
		/***********************
		ADD / SUBTRACT SCORE
		***********************/
		public function addScore($n:int):void {
			_totalScore+=$n;
		}
		
		public function subtractScore($n:int):void {
			_totalScore-=$n;
		}
		
		/***********************
		ADD TIME
		***********************/
		public function addTime($n:int):void {
			_time+=$n;
		}
		
		/***********************
		ADD UNITS
		***********************/
		public function addUnits($n:int):void {
			_units+=$n;
		}
		
	}
}