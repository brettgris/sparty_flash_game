package com.starz.games.sparty.builder.components {
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import com.eaglesandcobras.common.events.GameEvent;
	
	public class Question3 extends MovieClip{
		private var _correct:Boolean;
		private var _notSelected:ColorTransform;
		private var _selected:ColorTransform;
		private var _answer:int = 2;
		
		public function Question3(){
			super();
			init();
		}
		
		/***********************
		INIT
		***********************/
		
		public function init():void {
			_notSelected = new ColorTransform();
			_notSelected.color = 0xFFFFFF;
			
			_selected = new ColorTransform();
			_selected.color = 0xFF7900;
			
			quest.visible = true;
			
			quest.trueAnswer.buttonMode = true;
			quest.falseAnswer.buttonMode = true;
			
			quest.trueAnswer.transform.colorTransform = _notSelected;
			quest.falseAnswer.transform.colorTransform = _notSelected;
			
			quest.trueAnswer.addEventListener(MouseEvent.CLICK, trueClick);
			quest.falseAnswer.addEventListener(MouseEvent.CLICK, falseClick);
			
			submitBtn.addEventListener(MouseEvent.CLICK, submitClick);
			
			submitBtn.visible = false;
			continueBtn.visible = false;
			
			correct.visible = false;
			wrong.visible = false;
		}
		
		/***********************
		CORRECT ANSWER
		***********************/
		public function set correctAnswer($b:Boolean):void {
			_correct = $b;
		}
		
		/***********************
		CONTROL WHICH ONE IS SELECTED
		***********************/
		private function trueClick(e:MouseEvent):void {
			quest.trueAnswer.transform.colorTransform = _selected;
			quest.falseAnswer.transform.colorTransform = _notSelected;
			
			_answer = 1;
			submitBtn.visible = true;
		}
		
		private function falseClick(e:MouseEvent):void {
			quest.falseAnswer.transform.colorTransform = _selected;
			quest.trueAnswer.transform.colorTransform = _notSelected;
			
			_answer = 0;
			submitBtn.visible = true;
		}
		
		private function submitClick(e:MouseEvent):void {
			quest.visible = false;
			submitBtn.visible = false;
			
			if ( Boolean(_answer) == _correct) correct.visible = true;
			else wrong.visible = true;
			
			continueBtn.visible = true;
			continueBtn.addEventListener(MouseEvent.CLICK, done);
		}
		
		private function done(e:MouseEvent):void {
			continueBtn.removeEventListener(MouseEvent.CLICK, done);
			
			if ( Boolean(_answer) == _correct) this.dispatchEvent( new GameEvent (GameEvent.CORRECT_ANSWER) );
			else this.dispatchEvent( new GameEvent (GameEvent.WRONG_ANSWER) );
			
			this.dispatchEvent( new Event (Event.COMPLETE) );
		}
	}
}