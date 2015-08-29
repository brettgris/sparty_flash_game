package com.eaglesandcobras.common.sounds {
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	
	public class SoundLoader {
		private var _sounds:Object;
		private var _sound:Sound;
		private var _volume:Number = .5;
		private var _transform:SoundTransform;
		private var _efx:SoundChannel;
		private var _soundPlay:Boolean = true;
		
		/*************************
		CONSTRUCTOR
		*************************/
		public function SoundLoader() {
			init();
		}
		
		private function init(){
			_efx = new SoundChannel();
			
			_sounds = new Object();
			
			_transform = new SoundTransform();
			_transform.volume = .3;
		}		
		
		/*************************
		LOAD INTERNAL
		*************************/
		public function loadSounds():void {
			trace ("override loadSounds. I need Sounds");
		}
		
		/*************************
		ADD A SOUND
		*************************/
		public function addSound($soundPath:String, $external:Boolean=true):void {
			if ($external) loadExternal($soundPath);
			else loadInternal($soundPath);
		}
		
		private function loadExternal($soundPath:String):void {
			_sound = new Sound();
			_sound.load(new URLRequest($soundPath));
			
			_sounds[$soundPath] = _sound;
		}
		
		private function loadInternal($soundPath:String):void {
			var _class:Class = getDefinitionByName($soundPath) as Class;
			var _sound = new _class() as Sound;
			
			_sounds[$soundPath] = _sound;
		}
		
		/**********************************
		PLAY SOUND
		***********************************/
		public function playSound($soundPath:String):void {
			if (_soundPlay) {
				_efx = _sounds[$soundPath].play();
				_efx.soundTransform = _transform;
			}
		}
		
		/**********************************
		GLOBAL SOUND CONTROL
		***********************************/
		public function switchSound():Boolean{
			if (_soundPlay) _soundPlay=false;
			else _soundPlay = true;
			
			return _soundPlay;
		}
	}
}