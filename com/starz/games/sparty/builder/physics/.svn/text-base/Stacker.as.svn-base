package com.starz.games.sparty.builder.physics{
	import flash.display.Sprite;
	import flash.events.Event;
	import Box2D.Dynamics.b2World;
	import com.eaglesandcobras.common.physics.*;
	import com.starz.games.sparty.builder.physics.*;
	import com.eaglesandcobras.common.events.GameEvent;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2Body;
	import flash.events.MouseEvent;
	import flash.utils.getDefinitionByName;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.utils.setTimeout;
	import flash.geom.Rectangle;
	import flash.display.DisplayObject;
	import com.starz.games.sparty.builder.components.StackerScore;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import com.starz.games.sparty.builder.sounds.StackerSounds;
	
	public class Stacker extends Sprite{
		public static const BLOCK_FALL:String = "BLOCK_FALL";
		public static const BLOCK_ADD:String = "BLOCK_ADD";
		
		private var _overlay:Overlay;
		private var _container:Sprite;
		private var _world:b2World;
		private var _shapes:Array;
		private var _floor:b2Body;
		private var _platform:b2Body;
		private var _listener:StackerContactListener;
		private var _delete:Object;
		private var _next:Object;
		private var _nextShape:MovieClip;
		private var _current:Object;
		private var _currentShape:MovieClip;
		private var _rot:int = 0;
		private var _test:b2Body;
		private var _goal:Number = 100;
		private var _goalPercent:Number = 40;
		private var _goalArea:GoalArea;
		private var _goalLevel:GoalLevel;
		private var _filledArea:FilledArea;
		private var _scoreItem:ScoreItem;
		private var _percent:Number=0;
		private var _mouse:Object = {x:0, y:0};
		private var _nextShapePosition = {x:500, y:80};
		private var _platformPosition:Object = {width:410, height:150, x:292, y:625};
		private var _t:Timer;
		private var _hitSounds:Boolean;
		
		private const SQUARE:Number = 25;
		
		public function Stacker(){
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		/******************
		CONSTRUCTOR
		******************/
		private function init(e:Event=null):void{
			_t = new Timer(100, 1);
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.focus = this;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHit);
			
			_container = new Sprite();
			addChild (_container );
			
			setupWorld();
			addWalls();
			addPlatform();
			
			addShapes();
			addContactListener();
			
			addOverlay();

			_delete = new Object();
			
		}
		
		/******************
		Overlay
		******************/
		private function addOverlay():void {
			_overlay = new Overlay();
			_overlay.width = stage.stageWidth;
			_overlay.height = stage.stageHeight;
			addChild (_overlay);
			
			
			_overlay.addEventListener(MouseEvent.MOUSE_MOVE, trackMouse);
		}
		
		public function startPlaying():void {
			goalArea();
			//addOverlay();
			getFirst();
			getCurrent();
			addEventListener(Event.ENTER_FRAME, update);
		}
		
				
		/******************
		Drop Shape
		******************/
		private function dropShape(e:MouseEvent):void {
			this.dispatchEvent( new GameEvent( GameEvent.UPDATE_SCORE, {type:BLOCK_ADD} ) );
			
			_hitSounds = true;
			
			_overlay.removeEventListener(MouseEvent.MOUSE_MOVE, updateCurrent);
			_overlay.removeEventListener(MouseEvent.CLICK, dropShape);
			
			BOX2DAdder.addTetris(_world, _currentShape, _current.verts, e.stageX, e.stageY, SQUARE, TetrisShapes.getRotation(_rot), false);
			
			_scoreItem = new ScoreItem();
			addChild(_scoreItem);
			_scoreItem.mouseEnabled = false;
			_scoreItem.x = e.stageX;
			_scoreItem.y = e.stageY-25;
			_scoreItem.addEventListener(Event.COMPLETE, removeScoreItem);
			_scoreItem.addScore();
			
			_t = new Timer(400, 1);
			_t.addEventListener(TimerEvent.TIMER, getCurrent);
			_t.start();
			
			//this.dispatchEvent( new GameEvent (GameEvent.PLAY_SOUND, {sound:StackerSounds.BRICK_DROP}) );
			
		}
		
		private function removeScoreItem(e:Event):void {
			e.target.removeEventListener(Event.COMPLETE, removeScoreItem);
			
			var item:DisplayObject = e.target as DisplayObject;
			removeChild(item);
		}
		
		/******************
		Keyboard Rotation
		******************/
		private function keyHit(e:KeyboardEvent):void {
			if (e.keyCode==39||e.keyCode==68){
				_rot = TetrisShapes.nextRotation(_rot);
				_currentShape.rotation = TetrisShapes.getRotation(_rot);
			}else if (e.keyCode==37||e.keyCode==65){
				_rot = TetrisShapes.previousRotation(_rot);
				_currentShape.rotation = TetrisShapes.getRotation(_rot);
			}
		}
		
		/******************
		FIRST
		******************/
		private function getFirst():void {
			_next= TetrisShapes.randomShape(_shapes);
			
			var myClass:Class = getDefinitionByName(_next.obj) as Class;
			_nextShape = new myClass();
			_nextShape.width = SQUARE*_next.size[0];
			_nextShape.height = SQUARE*_next.size[1];
			_container.addChild(_nextShape);
			
			_nextShape.x = _nextShapePosition.x;
			_nextShape.y = _nextShapePosition.y;
		}
		
		
		/******************
		Current
		******************/
		private function getCurrent(e:TimerEvent=null):void {
			_rot = 0;
			
			_current = _next;
			_currentShape = _nextShape;	
			
			_currentShape.x = _mouse.x;
			_currentShape.y = _mouse.y;
			
			_next= TetrisShapes.randomShape(_shapes);
			
			var myClass:Class = getDefinitionByName(_next.obj) as Class;
			_nextShape = new myClass();

			_nextShape.width = SQUARE*_next.size[0];
			_nextShape.height = SQUARE*_next.size[1];
			
			_container.addChild(_nextShape);
			_nextShape.x = _nextShapePosition.x;
			_nextShape.y = _nextShapePosition.y;
			
			_overlay.addEventListener(MouseEvent.MOUSE_MOVE, updateCurrent);
			_overlay.addEventListener(MouseEvent.CLICK, dropShape);
		}
		
		/******************
		Current
		******************/
		private function updateCurrent(e:MouseEvent):void {
			_currentShape.x = e.stageX;
			_currentShape.y = e.stageY;
		}
		
		private function trackMouse(e:MouseEvent):void {
			_mouse.x = e.stageX;
			_mouse.y = e.stageY;
			
			stage.focus = this;
		}
	
		/******************
		SET UP WORLD
		******************/
		private function setupWorld():void{
			_world = BOX2DAdder.addWorld();
		}
		
		/******************
		Contact Listener
		******************/
		private function addContactListener():void {
			_listener = new StackerContactListener();
			_listener.contactItem = _floor;
			_listener.controller = this;
			_world.SetContactListener(_listener);
		}
		
		public function hitSound($b:b2Body):void {
			if (_hitSounds){
				this.dispatchEvent( new GameEvent( GameEvent.PLAY_SOUND, {sound:StackerSounds.BRICK_HIT} ) );
				_hitSounds = false;
			}
		}

		
		/******************
		ADD WALL
		******************/
		private function addWalls():void{
			_floor = BOX2DAdder.addBox(_world, new Wall(), stage.stageWidth/2, 900, 2000, 10, true);
			_container.addChild(_floor.m_userData.graphic);
		}
		
		/******************
		GOAL AREA
		******************/
		private function goalArea():void{
			_goalArea = new GoalArea();
			addChildAt (_goalArea,0);
			_goalArea.alpha = .5;
			
			_goalLevel = new GoalLevel();
			addChildAt(_goalLevel,1);
			_goalLevel.mouseEnabled = false;
			
			var plat:MovieClip = _platform.m_userData.graphic;
			
			_goalArea.body.width = plat.width;
			_goalArea.body.height = goal;
			
			_goalArea.x = _platform.GetPosition().x* BOX2DAdder.RATIO;
			_goalArea.y = _platform.GetPosition().y* BOX2DAdder.RATIO-plat.height/2
			
			_goalLevel.x = _goalArea.x;
			_goalLevel.y = _goalArea.y - _goalArea.body.height;
			
			_goalArea.txt.y = 0-_goalArea.body.height/2;
			
			//_filledArea = new FilledArea();
//			addChildAt(_filledArea,3);
//			
//			_filledArea.leftBound.y = _goalArea.y;
//			_filledArea.rightBound.y = _goalArea.y;
//			_filledArea.topBound.y = _goalArea.y;
		}
		
		/******************
		ADD PLATFORM
		******************/
		private function addPlatform():void{
			_platform = BOX2DAdder.addBox(_world, new Platform(), _platformPosition.x, _platformPosition.y, _platformPosition.width, _platformPosition.height, true);
			_container.addChild(_platform.m_userData.graphic);
			
			_platform.m_userData.graphic.width = _platformPosition.width;
			_platform.m_userData.graphic.height = _platformPosition.height;
			
			_platform.m_userData.graphic.x = _platformPosition.x;
			_platform.m_userData.graphic.y = _platformPosition.y;
			
		}
		
		/******************
		SHAPES
		******************/
		private function addShapes():void {
			_shapes = TetrisShapes.makeShapes();
		}
		
		/******************
		REMOVE
		******************/
		private function removeBodies():void {
			for each (var b:b2Body in _delete){
				var thisX:Number = b.m_userData.graphic.x;
				
				if ( _container.contains(b.m_userData.graphic) ) _container.removeChild(b.m_userData.graphic);
				_world.DestroyBody(b);
				this.dispatchEvent( new GameEvent( GameEvent.UPDATE_SCORE, {type:BLOCK_FALL} ) );
				
				_scoreItem = new ScoreItem();
				addChild(_scoreItem);
				_scoreItem.mouseEnabled = false;
				
				if (thisX>_goalArea.x) {
					_scoreItem.x = _goalArea.x+_goalArea.width/2+50;
				} else {
					_scoreItem.x = _goalArea.x-_goalArea.width/2-50;
				}
				
				_scoreItem.y = _goalArea.y;
				_scoreItem.addEventListener(Event.COMPLETE, removeScoreItem);
				_scoreItem.minusScore();
				
				this.dispatchEvent( new GameEvent( GameEvent.PLAY_SOUND, {sound:StackerSounds.BRICK_FALL} ) );
			}
			_delete = new Object();
		}
		
		public function safeRemove($body:b2Body):void {
			_delete[$body] = $body;
			
		}
		
		/******************
		UPDATE THE WORLD
		******************/
		public function update(e:Event):void {
			_world.Step(1/30, 10);
			
			removeBodies();
			render();
			calcPercent();
		}		
		
		/******************
		DRAWING FUNCTIONS
		******************/
		private function render():void {
			for (var bb:b2Body = _world.m_bodyList; bb; bb = bb.m_next) {
				if (bb.m_userData) {
					if (bb.m_userData.graphic is Sprite) {
						bb.m_userData.graphic.x = bb.GetPosition().x * BOX2DAdder.RATIO;
						bb.m_userData.graphic.y = bb.GetPosition().y * BOX2DAdder.RATIO;
						bb.m_userData.graphic.rotation = bb.GetAngle() * (180/Math.PI);
					}
				}
			}
		}
		
		public function debug_draw():void {
			var s:Sprite = new Sprite();
			addChild(s);
			
			var dbgDraw:b2DebugDraw = new b2DebugDraw();
			
			var dbgSprite:Sprite = new Sprite();
			s.addChild(dbgSprite);
			
			dbgDraw.m_sprite=s;
			dbgDraw.m_drawScale=30;
			dbgDraw.m_alpha=1;
			dbgDraw.m_fillAlpha=.5;
			dbgDraw.m_lineThickness=1;
			dbgDraw.m_drawFlags=b2DebugDraw.e_shapeBit;
			
			_world.SetDebugDraw(dbgDraw);
		}
 
 		/******************
		Goal Set
		******************/
		public function get goal():Number{
			return _goal;
		}
		
		public function set goal($obj:Number):void {
			_goal = $obj;
		}
		
		public function set goalPercent($obj:Number):void {
			_goalPercent = $obj;
		}
		
		/******************
		Calculate Percent
		******************/
		public function calcPercent():void {
			var _bound:Rectangle = _goalArea.getBounds(this);
			
			var fillVolume:Number = _goalArea.width*_goalArea.height;
			/*_filledArea.leftBound.x = 1000;
			_filledArea.rightBound.x = -1000;
			_filledArea.topBound.y = 1000;*/
			
			_goalLevel.y = _goalArea.y - _goalArea.body.height;
			
			var itemVolume:Number = 0;			
			var testVolume:Number = 0;
			for (var bb:b2Body = _world.m_bodyList; bb; bb = bb.m_next) {
				if (bb.m_userData) {
					if (bb.m_userData.graphic is Sprite) {
						if (bb.m_userData.type=="tetris") {
							/******************
							Calculate Filled Area
							******************/
							var b = bb.m_userData.graphic;
							var iv:Number = bb.m_userData.calculate(b.x, b.y, b.rotation, _container, _bound);
							if (iv) {
								itemVolume+=iv;
								//if (bb.IsSleeping()) 
								testVolume +=iv;
							} 
							
							/******************
							Position Bound Lines
							******************/
							var tbound:Rectangle = bb.m_userData.graphic.getBounds(this);
							//if (_goalLevel.y > tbound.top) 
							
							if (tbound.top<_goalLevel.y){
								_goalLevel.y = tbound.top;
							}
							//else _goalLevel.y = _goalArea.y - _goalArea.body.height;
							
							/*if (tbound.left<_filledArea.leftBound.x) {
								_filledArea.leftBound.x = tbound.left;
							}
							if (tbound.right>_filledArea.rightBound.x) {
								_filledArea.rightBound.x = tbound.right;
							}
							if (tbound.top<_filledArea.topBound.y){
								_filledArea.topBound.y = tbound.top;
							}
								
							_filledArea.topBound.x = _filledArea.leftBound.x;
							_filledArea.topBound.width = _filledArea.rightBound.x-_filledArea.leftBound.x;
								
							_filledArea.leftBound.height = _filledArea.leftBound.y-_filledArea.topBound.y;
							_filledArea.rightBound.height = _filledArea.rightBound.y-_filledArea.topBound.y;
						
							_filledArea.fillPercent.x = _filledArea.rightBound.x;
							_filledArea.fillPercent.y = _filledArea.topBound.y;*/
						}
					}
				}
			}
			
			_percent = Math.round ( (itemVolume/fillVolume)*100);
			var _percentLeft = _goalPercent - _percent;
			if (_percentLeft<0) _percentLeft=0
			_goalLevel.fillPercent.percentText.text = _percentLeft+"% LEFT";
			
			/******************
			Did You Win???
			******************/
			var testPerc = Math.round ( (testVolume/fillVolume)*100);
			if (testPerc>=_goalPercent) {
				this.dispatchEvent( new GameEvent (GameEvent.ROUND_DONE) );				
			}
		}
		
		/******************
		END THE GAMEPLAY
		******************/
		public function end():void {
			_overlay.removeEventListener(MouseEvent.MOUSE_MOVE, updateCurrent);
			_overlay.removeEventListener(MouseEvent.CLICK, dropShape);
			
			//_currentShape.visible = false;
			_goalLevel.visible = false;
			
			_t.stop();
			//_filledArea.visible = false;
		}
		
		/******************
		WHAT PERCENT
		******************/
		public function get percent():Number {
			return _percent;
		}
		
		/******************
		WHERE THE NEXT SHAPE IS POSITION
		******************/
		public function set nextShapePosition($o:Object):void {
			_nextShapePosition = $o;
		}
		
		public function get nextShapePosition():Object {
			return _nextShapePosition;
		}
		
		
		/******************
		WHERE IS THE PLATFORM
		******************/
		public function set platformPosition($o:Object):void {
			_platformPosition = $o;
		}
		
		public function get platformPosition():Object {
			return _platformPosition;
		}
	}
}