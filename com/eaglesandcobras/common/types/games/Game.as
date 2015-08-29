package com.eaglesandcobras.common.types.games{
	import com.eaglesandcobras.common.mvc.App;
	import com.eaglesandcobras.common.types.games.*;
	import com.eaglesandcobras.common.types.games.graphics.GameScene;
	import com.eaglesandcobras.common.events.GameEvent;
	import com.eaglesandcobras.common.types.games.scoring.Scoring;
	
	import flash.events.Event;
	import com.google.analytics.GATracker;
	import com.eaglesandcobras.common.sounds.SoundLoader;
	
	public class Game extends App {
		private var _model:GameModel;
		private var _view:GameView;
		private var _score:Scoring;
		
		/*-----Tracking variables--------*/
		private var _tracker:GATracker;
		private var _trackVars:Object = new Object();
		
		public function Game() {
			super(new GameModel(), new GameView());
			init();
		}
		
		/******************
		Set up
		******************/
		private function init():void {
			_model = model as GameModel;
			_view = view as GameView;
			
			_view.addEventListener(GameEvent.READY_FOR_CHANGE, viewReady);
			
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		
		/******************
		Load the Scenes
		******************/
		public function addScene($scene:GameScene, $params:Object=null):void {
			_model.addScene($scene, $params);
		}
		
		/******************
		SCORE
		******************/
		public function addScore($score:Scoring):void {
			_score = $score;
		}
		
		/******************
		ALL READY START THE GAME
		******************/
		public function go():void {
			if (_score) _model.addScore(_score);
			
			track();
			
			_view.changeScene( _model.getCurrentScene(), _model.getCurrentParams() );
			
		}
		
		/******************
		Scene is done. Get the next one and go
		******************/
		private function viewReady(e:GameEvent):void {
			_model.nextScene( _model.getCurrentScene().passLevel );
			go();
		}
		
		/******************
		ADD TRACKING
		******************/
		public function addTracking($account:String, $gameName:String):void {
			_trackVars.account = $account;
			_trackVars.namePrefix = "Game/"+$gameName+"/";
			
			_trackVars.track = true;
		}
		
		private function addedToStage(e:Event):void {
			if (_trackVars.track) {
				_tracker = new GATracker(this, _trackVars.account, "AS3", false);
				
				_tracker.trackPageview(_trackVars.namePrefix);
			}
		}
		
		private function track():void {
			if (_trackVars.track) {
				
				if (_model.getCurrentScene().type == GameScene.INTRO) {
					_tracker.trackEvent("GameEvent", "Start Game");
				} else if (_model.getCurrentScene().type == GameScene.PLAY) {
					_tracker.trackEvent("GameEvent", "Play Level");
				} else if (_model.getCurrentScene().type == GameScene.END) {
					_tracker.trackEvent("GameEvent", "End Game");
				}
			}
		}
		
		/******************
		ADD SOUNDS
		******************/
		public function addSounds($s:SoundLoader):void {
			_model.addSounds($s);
		}
		
	}
}