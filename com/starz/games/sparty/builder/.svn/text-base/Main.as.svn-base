package com.starz.games.sparty.builder {
	import flash.display.Sprite;
	import com.eaglesandcobras.common.types.games.Game;
	import com.starz.games.sparty.builder.scenes.*;
	import com.starz.games.sparty.builder.components.*;
	import flash.events.FocusEvent;
	import com.starz.games.sparty.builder.sounds.StackerSounds;
	import com.greensock.TweenLite;
	import com.eaglesandcobras.common.events.GameEvent;
	import flash.events.Event;
	
	[SWF(width="570", height="650", frameRate="30", backgroundColor="#FFFFFF")]
	
	public class Main extends Sprite {
		private var _g:Game;
		private var _soundController:SoundCont;
		private var _sounds:StackerSounds;
		
		public function Main(){
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event=null){
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stageFocusRemove();
			addGame();
			addBranding();
			addSound();
		}
		
		/*************************
		GAME
		*************************/
		
		private function addGame():void {
			_g = new Game();
			var _score:StackerScore = new StackerScore();
						
			var _intro:Introduction = new Introduction();
			var _play:GamePlay = new GamePlay();
			var _cut1:Scene1 = new Scene1();
			var _cut2:Scene2 = new Scene2();
			var _cut3:Scene3 = new Scene3();
			var _final:GameOver = new GameOver();
			
			_g.addScene( _intro);
			_g.addScene( _play, {round:1, time:60, height:125, percent:75, enterTime:6, title:"PREPARE THE FOUNDATION", desc:"Use the bricks to build a wall that fills the white square, leaving as few gaps as possible. Leave too many gaps and your wall may collapse.", tip:"TIP: The percentage tracker shows you how close you are to your goal.", passMessage:"Your skill with stone is indeed impressive. Advance to the next level of construction."});
			_g.addScene( _cut1);
			_g.addScene( _play, {round:2, time:60, height:200, percent:80, enterTime:3, title:"CONSTRUCT THE WALLS", desc:"Use the bricks to build a wall that fills the white square, leaving as few gaps as possible. Leave too many gaps and your wall may collapse.", tip:"TIP: The percentage tracker shows you how close you are to your goal.", passMessage:"Bravo! You are a rock legend of Capua. Move on to the next stage of your almighty arena.", tip:""});
			_g.addScene( _cut2);
			_g.addScene( _play, {round:3, time:90, height:300, percent:85, enterTime:3, title:"ERECT THE TOWERS", desc:"Use the bricks to build a wall that fills the white square, leaving as few gaps as possible. Leave too many gaps and your wall may collapse.", tip:"TIP: The percentage tracker shows you how close you are to your goal.", passMessage:"The gods praise your diabolical dexterity.The final level of the amphitheater awaits.", tip:"" });
			_g.addScene( _cut3);
			_g.addScene( _play, {round:4, time:115, height:400, percent:85, enterTime:3, title:"FINISH THE AMPHITHEATER", desc:"Use the bricks to build a wall that fills the white square, leaving as few gaps as possible. Leave too many gaps and your wall may collapse.", tip:"TIP: The percentage tracker shows you how close you are to your goal.", passMessage:"Behold, the magnificent deed is done. Jupiter himself would marvel at your performance.", tip:"" });
			_g.addScene( _final);			
			
			_g.addScore(_score);
			
			_sounds = new StackerSounds();
			_g.addSounds(_sounds);
			
			_g.addTracking ( "UA-20387649-1", "BuildYourLegacy");
			
			addChild(_g);
			_g.go();
		}
		
		/*************************
		BRANDING
		*************************/
		private function addBranding():void {
			var brand:Branding = new Branding();
			addChild(brand);
			
			brand.mouseEnabled = false;
			
			brand.y = stage.stageHeight-73;
			
			//TweenLite.to( brand, .2, {y:brand.y-73, delay:1.5});
		}
		
		/*************************
		REMOVE YELLOW BOX SO WE CAN HAVE KEY EVENTS
		*************************/
		
		private function stageFocusRemove():void {
			 stage.stageFocusRect = false;
		}
		
		private function addSound():void {
			_soundController = new SoundCont();
			addChild(_soundController);
			
			_soundController.y = stage.stageHeight - 80;
			_soundController.x = 10;
			
			_soundController.addEventListener(GameEvent.GLOBAL_SOUND, switchSound);
		}
		
		private function switchSound(e:GameEvent):void {
			_sounds.switchSound();
		}
	}
}