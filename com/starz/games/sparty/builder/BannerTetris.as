package com.starz.games.sparty.builder{
	import flash.display.Sprite;
	import com.eaglesandcobras.common.types.games.Game;
	import com.starz.games.sparty.builder.components.StackerScore;
	import com.starz.games.sparty.builder.scenes.BannerPlay;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.display.MovieClip;
	
	public class BannerTetris extends Sprite {
		private var _game:Game;
		private var _play:BannerPlay;
		private var _score:StackerScore;
		
		private var _goalHeight:Number = 150;
		private var _timerLength:int = 60;
		private var _percent:int = 85;
		
		private var _platform:Object = {width:500, height:30, x:300, y:200};
		
		public function BannerTetris() {
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		/****************************
		SetUpGame
		****************************/
		private function init(e:Event) {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_play = new BannerPlay();
			_score = new StackerScore();
			
			_game = new Game();
			addChild(_game);
			
			stage.addEventListener(FocusEvent.FOCUS_IN, removeFocus);
		}
		
		/****************************
		Start THE GAME
		****************************/
		public function start():void {
			//Scenes? Intro / End
			
			_play.platform = platform;
			_game.addScene(_play, {time:_timerLength, percent:_percent, height:_goalHeight});
			//Score
			_game.addScore(_score);
			
			_game.go();
		}
		
		private function removeFocus(e:FocusEvent):void {
			stage.stageFocusRect = false;
		}
		
		
		/****************************
		SET GOAL HEIGHT / TIME
		****************************/
		public function set goalHeight($n:Number):void {
			_goalHeight = $n;
		}
		
		public function set timeLength($n:int):void {
			_timerLength = $n;
		}
		
		public function set percent($n:int):void {
			_percent = $n;
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
		EndMessage
		****************************/
		public function set endMessage($o:MovieClip):void {
			_play.endMessage = $o;
		}
		
		public function get endMessage():MovieClip {
			return _play.endMessage;
		}
		
		/****************************
		EndMessage
		****************************/
		public function set startMessage($o:MovieClip):void {
			_play.startMessage = $o;
		}
		
		public function get startMessage():MovieClip {
			return _play.startMessage;
		}
		
		/****************************
		EndMessage
		****************************/
		public function set timeDisplay($o:MovieClip):void {
			_play.timeDisplay = $o;
		}
		
		public function get timeDisplay():MovieClip {
			return _play.timeDisplay;
		}
		
		/****************************
		RESET
		****************************/
		public function replayGame():void {
			_game.go();
		}
		
		/******************
		WHERE THE NEXT SHAPE IS POSITION
		******************/
		public function set nextShape($o:Object):void {
			_play.nextShapePosition = $o;
		}
		
		public function get nextShape():Object {
			return _play.nextShapePosition;
		}
	}
}