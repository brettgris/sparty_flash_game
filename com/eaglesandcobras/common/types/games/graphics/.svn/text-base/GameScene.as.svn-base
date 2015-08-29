package com.eaglesandcobras.common.types.games.graphics {
	import flash.display.MovieClip;
	import com.eaglesandcobras.common.events.GameEvent;
	import com.eaglesandcobras.common.types.games.scoring.Scoring;
	import flash.events.Event;
	
	public class GameScene extends MovieClip{
		private var _pass:Boolean;
		private var _params:Object;
		private var _score:Scoring;
		private var _type:String;
		private var _bonus:int = 0;
		private var _addBonus:int = 0;

		public static const PLAY:String = "PLAY";
		public static const CUT:String = "CUT";
		public static const INTRO:String = "INTRO";
		public static const END:String = "END";
		public static const TRAINING:String = "TRAINING";
		
		public function GameScene(){
			super();
			_score = new Scoring();
			
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		/******************
		Events
		******************/
		public function sceneWaiting():void {
			this.dispatchEvent( new GameEvent(GameEvent.SCENE_WAITING) );
		}
		
		public function sceneStart():void {
			this.dispatchEvent( new GameEvent(GameEvent.SCENE_START) );
		}
		
		public function sceneDone():void {
			this.dispatchEvent( new GameEvent(GameEvent.SCENE_DONE) );
		}
		
		/******************
		Start Scene
		******************/
		public function go($params:Object=null):void {
			_pass = false;
			_params = $params;
			
			init();
			sceneStart();
		}
		
		private function added(e:Event):void {
		}
		
		public function init():void {
			trace ("Scene init():void function needs to be overwritten");
		}
		
		/******************
		Did they Pass?
		******************/
		public function set passLevel($b:Boolean):void {
			_pass = $b;
		}
		
		public function get passLevel():Boolean {
			return _pass;
		}
		
		/******************
		Did they Pass?
		******************/
		public function get params():Object {
			return _params;
		}
		
		/******************
		ADD SCORE
		******************/
		public function set score($s:Scoring):void {
			_score = $s;
		}
		
		public function get score():Scoring {
			return _score;
		}
		
		/******************
		TYPE OF SCENE
		******************/
		public function set type($s:String):void {
			_type = $s;
		}
		
		public function get type():String {
			return _type;
		}
		
		/******************
		BONUS
		******************/
		public function set bonus($s:int):void {
			_bonus = $s;
		}
		
		public function get bonus():int {
			return _bonus;
		}
		
		/******************
		ADD BONUS
		******************/
		public function set addBonus($s:int):void {
			_addBonus = $s;
		}
		
		public function get addBonus():int {
			return _addBonus;
		}
	}
}