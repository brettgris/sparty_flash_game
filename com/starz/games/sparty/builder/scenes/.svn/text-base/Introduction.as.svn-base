package com.starz.games.sparty.builder.scenes{
	import com.eaglesandcobras.common.types.games.graphics.IntroScene;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.eaglesandcobras.common.events.GameEvent;
	import com.starz.games.sparty.builder.sounds.StackerSounds;
	
	public class Introduction extends IntroScene{
		private var _control:int=0;
		private var _controls:Array;
		private var _timer:Timer;
		
		public function Introduction(){
			super();
		}
		
		override public function init():void {
			playButton = playBtn;
			playBtn.addEventListener(MouseEvent.ROLL_OVER, buttonOver);
			
			_controls = [drop,flip,clock];
			startControls();
		}
		
		private function startControls():void {
			_timer = new Timer(1000, 1);
			_timer.addEventListener(TimerEvent.TIMER, doControl);
			_timer.start();
		}
		
		private function doControl(e:TimerEvent):void {
			_timer.addEventListener(TimerEvent.TIMER, doControl);
			_controls[_control].addEventListener(Event.COMPLETE, nextControl);
			_controls[_control].go();
		}
		
		private function nextControl(e:Event):void {
			_controls[_control].removeEventListener(Event.COMPLETE, nextControl);
			
			_control++;
			if (_control==_controls.length) _control = 0;
			
			startControls();
		}
		
		private function buttonOver(e:MouseEvent):void {
			this.dispatchEvent( new GameEvent (GameEvent.PLAY_SOUND, {sound:StackerSounds.BUTTON_OVER} ));
		}
	}
}