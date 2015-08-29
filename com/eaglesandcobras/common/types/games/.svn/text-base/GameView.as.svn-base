package com.eaglesandcobras.common.types.games{
	import com.eaglesandcobras.common.mvc.View;
	import com.eaglesandcobras.common.types.games.graphics.GameScene;
	import com.eaglesandcobras.common.events.GameEvent;
	
	public class GameView extends View {
		private var _scene:GameScene;
		
		public function GameView(){
			super();
		}
		
		/******************
		Load my Scene
		******************/
		public function changeScene( $scene:GameScene, $params:Object=null ):void {
			if (_scene) removeChild(_scene);
			
			_scene = $scene;
			
			addChild (_scene);
			_scene.go($params);
			
			
			_scene.addEventListener(GameEvent.SCENE_DONE, sceneFinished);
		}
		
		/******************
		Scene is all done, tell controller to get you the next one
		******************/
		private function sceneFinished(e:GameEvent):void {
			_scene.removeEventListener(GameEvent.SCENE_DONE, sceneFinished);
			
			this.dispatchEvent( new GameEvent ( GameEvent.READY_FOR_CHANGE ) );
		}
	}
}