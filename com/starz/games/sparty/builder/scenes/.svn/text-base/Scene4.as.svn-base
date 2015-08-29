package com.starz.games.sparty.builder.scenes{
	import com.eaglesandcobras.common.types.games.graphics.CutScene;
	import com.starz.games.sparty.builder.components.StackerScore;
	import com.greensock.TweenLite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.eaglesandcobras.common.events.GameEvent;
	
	public class Scene4 extends CutScene{
		private var _score:StackerScore;
		private var ax:Number;
		private var bx:Number;
		private var qx:Number;
		
		/***************
		CONSTRUCTOR
		***************/
		public function Scene4(){
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
			
			box.nextBtn.addEventListener(MouseEvent.CLICK, hideBox);
			
			TweenLite.to( actor, .5, {x:ax});
			TweenLite.to( box, .5, {x:bx, delay:.25, onComplete:doScoring});
		}
		
		/***************
		UPDATE THE SCORE
		***************/
		private function doScoring():void {
			box.scoringModule.go();
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
			box.nextBtn.removeEventListener(MouseEvent.CLICK, hideBox);
		}
		
		private function doQuestion():void {
			question.init();
			question.x=-1000;
			question.visible = true;
			
			question.addEventListener(Event.COMPLETE, questionFinished);
			question.addEventListener(GameEvent.CORRECT_ANSWER, addMyBonus);
			question.addEventListener(GameEvent.WRONG_ANSWER, removeMyBonus);
			
			
			TweenLite.to(question, .5, {x:qx});
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
		
	}
}