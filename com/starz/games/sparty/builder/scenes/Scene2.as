package com.starz.games.sparty.builder.scenes{
	import com.eaglesandcobras.common.types.games.graphics.CutScene;
	import com.starz.games.sparty.builder.components.StackerScore;
	import com.greensock.TweenLite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.eaglesandcobras.common.events.GameEvent;
	import flash.utils.setTimeout;
	import com.starz.games.sparty.builder.sounds.StackerSounds;
	
	public class Scene2 extends CutScene{
		private var _score:StackerScore;
		private var ax:Number;
		private var bx:Number;
		private var qx:Number;
		
		/***************
		CONSTRUCTOR
		***************/
		public function Scene2(){
			super();
			ax = actor.x;
			bx = box.x;
			qx = question.x;
		}
		
		override public function init():void {
			//nextButton = box.nextBtn;
			_score = score as StackerScore;
			
			question.visible = false;
			question.correctAnswer = false;
			
			updateScore();
			animateIn();
		}
		
		/***************
		SET INITIAL SCORES
		***************/
		private function updateScore():void {
			box.scoringModule.updateScore(_score.totalScore, _score.roundScore);
		}
		
		/***************
		BRING IN ACTOR AND PANEL
		***************/
		private function animateIn():void {		
			actor.x = -500;
			box.x = -1000;
			
			box.nextBtn.addEventListener(MouseEvent.ROLL_OVER, buttonOver);
			box.nextBtn.addEventListener(MouseEvent.CLICK, hideBox);
			
			TweenLite.to( actor, .5, {x:ax});
			setTimeout(boxIn, 250);
		}
		
		private function boxIn():void {
			TweenLite.to( box, .5, {x:bx, onComplete:doScoring});
			this.dispatchEvent( new GameEvent (GameEvent.PLAY_SOUND, {sound:StackerSounds.TRANSITION_SOUND} ) );
		}
		
		/***************
		UPDATE THE SCORE
		***************/
		private function doScoring():void {
			box.scoringModule.go();
			//box.scoringModule.addEventListener(GameEvent.PLAY_SOUND, playMySound);
			allDone();
		}
		
		private function allDone():void {
			_score.addScore(_score.roundScore);
			_score.addTime(_score.roundTime);
			_score.addUnits(_score.roundBlocks);
		}
		
		/***************
		DO QUESTION
		***************/
		private function hideBox(e:MouseEvent):void {
			TweenLite.to( box, .5, {x:-1000, onComplete:doQuestion});
			this.dispatchEvent( new GameEvent (GameEvent.PLAY_SOUND, {sound:StackerSounds.TRANSITION_SOUND} ) );
			box.nextBtn.removeEventListener(MouseEvent.CLICK, hideBox);
		}
		
		private function doQuestion():void {
			question.init();
			
			question.x=-1000;
			question.visible = true;
			
			question.submitBtn.addEventListener(MouseEvent.ROLL_OVER, buttonOver);
			question.continueBtn.addEventListener(MouseEvent.ROLL_OVER, buttonOver);
			
			question.addEventListener(Event.COMPLETE, questionFinished);
			question.addEventListener(GameEvent.CORRECT_ANSWER, addMyBonus);
			question.addEventListener(GameEvent.WRONG_ANSWER, removeMyBonus);
			
			TweenLite.to(question, .5, {x:qx});
			this.dispatchEvent( new GameEvent (GameEvent.PLAY_SOUND, {sound:StackerSounds.TRANSITION_SOUND} ) );
		}
		
		private function questionFinished(e:Event):void {
			question.removeEventListener(Event.COMPLETE, questionFinished);
			passLevel = true;
			sceneDone();
		}
		
		private function addMyBonus(e:GameEvent):void {
			bonus = 15;
		}
		private function removeMyBonus(e:GameEvent):void {
			bonus = 0;
		}
		
		private function playMySound(e:GameEvent):void {
			this.dispatchEvent( e );
		}
		
		private function buttonOver(e:MouseEvent):void {
			this.dispatchEvent( new GameEvent (GameEvent.PLAY_SOUND, {sound:StackerSounds.BUTTON_OVER} ));
		}
	}
}