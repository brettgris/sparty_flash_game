package com.starz.games.sparty.builder.scenes{
	import com.eaglesandcobras.common.types.games.graphics.PlayScene;
	import com.starz.games.sparty.builder.physics.Stacker;
	import com.starz.games.sparty.builder.components.StackerScore;
	import com.eaglesandcobras.common.events.GameEvent;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import flash.utils.setTimeout;
	import com.greensock.TweenLite;
	import flash.text.TextFieldAutoSize;
	import com.starz.games.sparty.builder.sounds.StackerSounds;
	
	
	public class GamePlay extends PlayScene{
		private var _t:Timer;
		private var _time:int;
		private var _stacker:Stacker;
		private var _endLevel:EndLevel;
		private var _startLevel:LevelStart;
		private var _txtTimer:Timer;
		private var _getSetWords:Array = ["READY?", "SET?", "BUILD!"];
		private var _startVar:int = 0;
		private var _warning:Warning;
		
		private var _score:StackerScore;
		
		public function GamePlay(){
			super();
			
		}
		
		override public function init():void {
			_score = score as StackerScore;
			_score.reset();
			
			passLevel = false;
			
			
			_time = Number (params.time)+addBonus;
			
			timeContainer.timeText.text = String(_time);
			
			_t = new Timer(1000, Number (params.time)+addBonus);
			_t.addEventListener(TimerEvent.TIMER, timerClick);
			_t.addEventListener(TimerEvent.TIMER_COMPLETE, timerEnd);
			
			_stacker = new Stacker();
			_stacker.goal = params.height;
			_stacker.goalPercent = params.percent;
			addChild(_stacker);
			
			_stacker.addEventListener(GameEvent.PLAY_SOUND, playStackerSound);
			
			preLevel();
			
			_stacker.addEventListener(GameEvent.ROUND_DONE, challengeMeet);
			_stacker.addEventListener(GameEvent.UPDATE_SCORE, scoreUpdate);
			
			_warning = new Warning();
			_warning.width = stage.stageWidth;
			_warning.height = stage.stageHeight
			_warning.alpha = .5;
			_warning.mouseEnabled = false;			
		}
		
		/******************
		SETTING UP THE PRELEVEL STUFF
		******************/
		private function preLevel():void {
			_startLevel = new LevelStart();
			addChild(_startLevel);
			
			_startLevel.box.roundTxt.text = "ROUND "+params.round.toString();
			_startLevel.box.titleTxt.text = params.title;
			_startLevel.box.descTxt.text = params.desc;
			_startLevel.box.tipTxt.text = params.tip;
			
			_startLevel.box.roundTxt.wordWrap = true;
			_startLevel.box.titleTxt.wordWrap = true;
			_startLevel.box.descTxt.wordWrap = true;
			_startLevel.box.tipTxt.wordWrap = true;
			
			_startLevel.box.roundTxt.autoSize = TextFieldAutoSize.CENTER;
			_startLevel.box.titleTxt.autoSize = TextFieldAutoSize.CENTER;
			_startLevel.box.descTxt.autoSize = TextFieldAutoSize.CENTER;
			_startLevel.box.tipTxt.autoSize = TextFieldAutoSize.CENTER;
			
			_startLevel.box.bg.height = 20+_startLevel.box.roundTxt.height+_startLevel.box.titleTxt.height+_startLevel.box.descTxt.height+_startLevel.box.tipTxt.height;
			
			
			_startLevel.box.roundTxt.y = _startLevel.box.bg.y+10;
			_startLevel.box.titleTxt.y = _startLevel.box.roundTxt.y+_startLevel.box.roundTxt.height;
			_startLevel.box.descTxt.y = _startLevel.box.titleTxt.y+_startLevel.box.titleTxt.height;
			_startLevel.box.tipTxt.y = _startLevel.box.descTxt.y+_startLevel.box.descTxt.height+5;
			
			_startLevel.box.countdown.y = _startLevel.box.bg.y + _startLevel.box.bg.height+_startLevel.box.countdown.height/2+5;
			
			_startVar = 0;
			
			_startLevel.box.y = -300;
			TweenLite.to(_startLevel.box, .5, {y:425-_startLevel.box.bg.height/2});
			this.dispatchEvent( new GameEvent (GameEvent.PLAY_SOUND, {sound:StackerSounds.TRANSITION_SOUND} ) );
			
			setTimeout(readySetGo, params.enterTime*1000);
		}
		
		private function readySetGo():void {
			_txtTimer = new Timer(1000, _getSetWords.length+1);
			_txtTimer.addEventListener(TimerEvent.TIMER, changeWords);
			_txtTimer.addEventListener(TimerEvent.TIMER_COMPLETE, startPlaying);
			_txtTimer.start();
		}
		
		private function changeWords(e:TimerEvent):void {
			if (_startVar<_getSetWords.length) {
				this.dispatchEvent( new GameEvent (GameEvent.PLAY_SOUND, {sound:StackerSounds.BEEP_SOUND} ) );
				_startLevel.box.countdown.countdownTxt.text = _getSetWords[_startVar];
				_startVar++;
			}
		}
		
		/******************
		EVERYTHING IS READY, start the game
		******************/
		private function startPlaying(e:TimerEvent):void {
			removeChild(_startLevel);
			_t.start();
			_stacker.startPlaying();
		}
		
		/******************
		They WON, do what?
		******************/
		private function challengeMeet(e:Event=null):void {
			_t.stop();
			passLevel = true;
			addEndLevel();
		}
		
		/******************
		CHANGE THE TIME
		******************/
		private function timerClick(e:TimerEvent):void {
			_time--;
			
			timeContainer.timeText.text = String (_time);
			
			if (_time==10) addChildAt(_warning,1);
			if (_time<=10) {
				this.dispatchEvent( new GameEvent (GameEvent.PLAY_SOUND, {sound:StackerSounds.BEEP_SOUND} ) );			
			}
		}
		
		/******************
		OOOOOPPPPPPS TIME UP, LOSER!
		******************/
		private function timerEnd(e:TimerEvent):void {
			passLevel = false;
			addEndLevel();
		}
		
		/******************
		CHANGE THE TIME
		******************/
		private function addEndLevel():void {
			roundScoreUpdate();
			
			if (this.contains(_warning)) removeChild(_warning);
			
			_stacker.end();
			_stacker.removeEventListener(GameEvent.ROUND_DONE, challengeMeet);
			
			_endLevel = new EndLevel();
			addChild(_endLevel);
			
			//_endLevel.box.scorer.addEventListener(GameEvent.PLAY_SOUND, playStackerSound);
			
			if (passLevel){
				_endLevel.box.wallBuilt.passTxt.text = params.passMessage;
				_endLevel.box.wallBuilt.visible = true;
				_endLevel.box.timeUp.visible = false;
			} else {
				_endLevel.box.wallBuilt.visible = false;
				_endLevel.box.timeUp.visible = true;
			}
			
			_endLevel.box.scorer.update(_score);
			_endLevel.box.scorer.addEventListener(Event.COMPLETE, changeLevel);
			
			this.dispatchEvent( new GameEvent (GameEvent.PLAY_SOUND, {sound:StackerSounds.TRANSITION_SOUND} ) );
			
			_endLevel.box.y = -300;
			TweenLite.to(_endLevel.box, .5, {y:325});
			
			//setTimeout(changeLevel, 6000);
		}
		
		
		/******************
		ALL DONE
		******************/
		private function changeLevel(e:Event=null):void {
			removeChild(_endLevel);
			
			removeStack();
			sceneDone();
		}
		
		private function removeStack():void {
			_stacker.removeEventListener(GameEvent.UPDATE_SCORE, scoreUpdate);
			removeChild(_stacker);
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
		PLAY SOUND
		******************/
		private function playStackerSound(e:GameEvent):void {
			this.dispatchEvent( e );
		}
	}
}