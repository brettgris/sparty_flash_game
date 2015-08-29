package com.starz.games.sparty.builder.physics{
	import Box2D.Dynamics.b2ContactListener;
	import Box2D.Collision.b2ContactPoint;
	import Box2D.Dynamics.b2Body;
	import flash.display.Sprite;

	public class StackerContactListener extends b2ContactListener{
		private var _contactItem:b2Body;
		private var _controller:*;
		
		public function StackerContactListener(){
			super();
		}
		
		override public function Add(point:b2ContactPoint):void {
			super.Add(point);
			
			_controller.hitSound(point.shape2.GetBody());
			
			if (point.shape1.GetBody()==_contactItem) {
				flagBody(point.shape2.GetBody());
			} else if (point.shape2.GetBody()==_contactItem){
				flagBody(point.shape1.GetBody());
			}
		}
		
		public function flagBody($body:b2Body):void {
			_controller.safeRemove($body);
		}
		
		public function set contactItem($b:b2Body):void {
			_contactItem = $b;
		}
		
		public function set controller($s:*):void {
			_controller = $s;
		}
	}
}