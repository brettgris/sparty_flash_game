package com.starz.games.sparty.builder.physics{
	import com.eaglesandcobras.common.physics.Actor;
	import flash.geom.Rectangle;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	
	public class TetrisActor extends Actor{
		private var _x:Number;
		private var _y:Number;
		private var _boxes:Array;
		private var _boxSize:Number;
		private var _fillAmount:Number=0;
		
		public function TetrisActor() {
			super();
		}

		
		public function calculate($x:Number, $y:Number, $rotation:Number, $container:DisplayObject, $rect:Rectangle):Number{
			_fillAmount = 0;
			
			for each (var m:MovieClip in graphic.items) {
				var b:Rectangle = m.getBounds($container);
				var r:Rectangle = $rect;
				
				if (r.left<b.left&&r.right>b.right&&r.top<b.top&&r.bottom>b.bottom){
					_fillAmount += _boxSize*_boxSize;
				} else {
					var xDir:Boolean;
					var xOff:Number;
					if (r.left>b.left) {
						xDir = true;
						xOff = r.left-b.left;
					}else if (r.right<b.right) {
						xDir = true;
						xOff = b.right-r.right;
					}else {
						xDir = false;
						xOff = 0;
					}
					
					var yDir:Boolean 
					var yOff:Number;
					if (r.top>b.top) {
						yDir = true;
						yOff = r.top-b.top;
					}else if (r.bottom<b.bottom){
					  	yDir = true;
						yOff = b.bottom-r.bottom;
					}else {
						yDir = false;
						yOff = 0;
					}
					
					if(xOff<_boxSize&&yOff<_boxSize) {
						_fillAmount += ( (_boxSize*_boxSize) );
					}
					
				}
			}
			return _fillAmount;
		}
		
		
		public function set boxSize($num:Number):void {
			_boxSize = $num;
		}

	}
	
}