package com.starz.games.sparty.builder.scenes{
	import com.eaglesandcobras.common.types.games.graphics.PlayScene;
	import com.starz.games.sparty.builder.physics.Stacker;
	import com.starz.games.sparty.builder.components.StackerScore;
	import com.eaglesandcobras.common.events.GameEvent;
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	
	public class BannerPlay extends PlayScene{
		private var _t:Timer;
		private var _time:int;
		private var _stacker:Stacker;
		private var _platform:Object = {width:500, height:30, x:300, y:200};
		private var _score:StackerScore;
		private var _startMessage:MovieClip = new MovieClip();
		private var _endMessage:MovieClip = new MovieClip();
		private var _timeDisplay:MovieClip = new MovieClip();
		private var _warning:Warning;
		private var _nextShapePosition = {x:500, y:80};
		
		public function BannerPlay(){
			super();
		}
		
		/********************
		SET IT UP
		********************/
		override public function init():void {
			_score = score as StackerScore;
			_score.reset();
			
			passLevel = false;
			
			_startMessage.visible = true;
			_startMessage.gotoAndPlay(1);
			_startMessage.addEventListener(Event.COMPLETE, startPlaying);
			
			_endMessage.visible = false;
			_timeDisplay.visible = false;
			_timeDisplay.timeText.text = params.time;
			
			_time = params.time as int;
			
			_t = new Timer(1000, Number (params.time));
			_t.addEventListener(TimerEvent.TIMER, timerClick);
			_t.addEventListener(TimerEvent.TIMER_COMPLETE, timerEnd);
			
			_stacker = new Stacker();
			_stacker.goal = params.height;
			_stacker.goalPercent = params.percent;
			_stacker.nextShapePosition.x = _nextShapePosition.x;
			_stacker.nextShapePosition.y = _nextShapePosition.y;
			_stacker.platformPosition = platform;
			
			addChildAt(_stacker,0);

			_stacker.addEventListener(GameEvent.ROUND_DONE, challengeMeet);
			_stacker.addEventListener(GameEvent.UPDATE_SCORE, scoreUpdate);
			
			_warning = new Warning();

			
		}
		
		/******************
		EVERYTHING IS READY, start the game
		******************/
		private function startPlaying(e:Event=null):void {
			startMessage.removeEventListener(Event.COMPLETE, startPlaying);
			
			startMessage.visible = false;
			timeDisplay.visible = true;
			
			_t.start();
			_stacker.startPlaying();
		}
		
		/****************************
		Platform Position
		****************************/
		public function set platform($o:Object):void {
			_platform = $o;
		}
		
		public function get platform():Object {
			return _platform;
		}
		
		/****************************
		END MESSAGE
		****************************/
		public function set endMessage($o:MovieClip):void {
			_endMessage = $o;
		}
		
		public function get endMessage():MovieClip {
			return _endMessage;
		}
		
		/****************************
		START MESSAGE
		****************************/
		public function set startMessage($o:MovieClip):void {
			_startMessage = $o;
		}
		
		public function get startMessage():MovieClip {
			return _startMessage;
		}
		
		/****************************
		TIME DISPLAY
		****************************/
		public function set timeDisplay($o:MovieClip):void {
			_timeDisplay = $o;
		}
		
		public function get timeDisplay():MovieClip {
			return _timeDisplay;
		}
		
		
		/****************************
		TIMER
		****************************/
		private function timerClick(e:TimerEvent):void{
			_time--;
			
			timeDisplay.timeText.text = String (_time);
			
			if (_time==10) addChildAt(_warning,0);
		}
		
		/******************
		OOOOOPPPPPPS TIME UP, LOSER!
		******************/
		private function timerEnd(e:TimerEvent):void {
			passLevel = false;
			gameOver();
		}
		
		private function gameOver():void {
			if (this.contains(_warning)) removeChild(_warning);
			
			roundScoreUpdate();
			
			_stacker.end();
			_stacker.removeEventListener(GameEvent.ROUND_DONE, challengeMeet);
			
			removeStack();
			timeDisplay.visible = false;
			
			endMessage.visible = true;
			
			endMessage.score(_score.roundScore, _score.roundTime, _score.roundBlocks);
			
			if (passLevel) endMessage.win();
			else endMessage.lose();
		}
		
		/******************
		They WON, do what?
		******************/
		private function challengeMeet(e:GameEvent=null):void {
			_t.stop();
			passLevel = true;
			gameOver();
		}
		
		/******************
		SCORING!
		******************/
		private function scoreUpdate(e:GameEvent):void {
			if (e.params.type == Stacker.BLOCK_ADD) _score.blockAdded();
			else if (e.params.type == Stacker.BLOCK_FALL) _score.blockFell();
		}
		
		private function roundScoreUpdate():void {
			_score.roundEnd(_time, params.time);
		}
		
		
		/******************
		ALL DONE
		******************/
		private function removeStack():void {
			_stacker.removeEventListener(GameEvent.UPDATE_SCORE, scoreUpdate);
			removeChild(_stacker);
		}
		
		/******************
		WHERE THE NEXT SHAPE IS POSITION
		******************/
		public function set nextShapePosition($o:Object):void {
			_nextShapePosition = $o;
		}
		
		public function get nextShapePosition():Object {
			return _nextShapePosition;
		}
	}
}