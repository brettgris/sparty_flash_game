package com.eaglesandcobras.common.types.games{
	import com.eaglesandcobras.common.mvc.Model;
	import com.eaglesandcobras.common.types.games.graphics.GameScene;
	import com.eaglesandcobras.common.types.games.scoring.Scoring;
	import com.eaglesandcobras.common.events.GameEvent;
	import com.eaglesandcobras.common.sounds.SoundLoader;
	
	public class GameModel extends Model {
		private var _scenes:Array;
		private var _current:int;
		private var _score:Scoring;
		private var _sounds:SoundLoader;
		
		public function GameModel(){
			super();
			init();
		}
		
		private function init():void {
			_scenes = new Array();
			_current = 0;
		}
		
		/******************
		Game Play Order
		******************/
		public function addScene($scene:GameScene, $params:Object=null):void {
			_scenes.push ({scene:$scene, params:$params});
		}
		
		/******************
		Tell controller the Current Scene
		******************/
		public function getCurrentScene():GameScene {
			return _scenes[_current].scene;
		}
		
		public function getCurrentParams():Object {
			return _scenes[_current].params;
		}
		
		/******************
		Change Current
		******************/
		public function nextScene($b:Boolean):void {
			_scenes[_current].scene.removeEventListener(GameEvent.PLAY_SOUND, playSound);
			
			if ($b) {			
				var currentBonus:int = _scenes[_current].scene.bonus;
				
				if (_current==_scenes.length-1) {
					_current = 0;
					_score.totalScore = 0;
				}
				else _current++;
				if (_current==_scenes.length-1) _scenes[_current].params = {passLevel:true};
				
				_scenes[_current].scene.addBonus = currentBonus;
			} else {
				_current = _scenes.length-1;
				_scenes[_current].params = {passLevel:false};
			}
			
			_scenes[_current].scene.addEventListener(GameEvent.PLAY_SOUND, playSound);
		}
		
		/******************
		SCORE
		******************/
		public function addScore($s:Scoring):void {
			_score = $s;
			for (var i:* in _scenes) {
				_scenes[i].scene.score = _score;
			}
		}
		
		/******************
		SOUNDS
		******************/
		public function addSounds($s:SoundLoader):void {
			_sounds = $s;
			_sounds.loadSounds();
			
			_scenes[_current].scene.addEventListener(GameEvent.PLAY_SOUND, playSound);
		}
		
		private function playSound(e:GameEvent):void {
			_sounds.playSound( e.params.sound );
		}
	}
}