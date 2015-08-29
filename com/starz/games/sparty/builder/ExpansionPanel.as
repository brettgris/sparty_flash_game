package com.starz.games.sparty.builder {
	import flash.display.Sprite;
	import com.starz.games.sparty.builder.BannerTetris;
	
	public class ExpansionPanel extends Sprite {
		private var _tetris:BannerTetris;
		
		public function ExpansionPanel(){
			super();
			init();
		}
		
		/****************************
		CONSTRUCTOR
		****************************/
		private function init():void {
			addGame();
		}
		
		/****************************
		ADD GAME
		****************************/
		private function addGame():void {
			_tetris = new BannerTetris();
			_tetris.width = stage.stageWidth;
			_tetris.height = stage.stageHeight;
			
			_tetris.start();
		}
	}
}