package com.starz.games.sparty.builder.physics{
	
	public class TetrisShapes {
		//public static var _rots:Array = [0,45,90,135,180,225,270,315];
		public static var _rots:Array = [0,90,180,270];
		
		public static function nextRotation($rot:int):int {
			$rot++;
			if ($rot==_rots.length) $rot=0;
			return $rot;
		}
		
		public static function previousRotation($rot:int):int {
			$rot--;
			if ($rot==-1) $rot=_rots.length-1;
			return $rot;
		}
		
		public static function getRotation($rot:int):Number {
			return _rots[$rot];
		}
		
		public static function makeShapes():Array{			
			var _shapes:Array = new Array();
			
			//TBAR
			var vert:Array = [ [-1.5,-1,1.5,0],[-.5,0,.5,1] ];
			_shapes.push ( {id:0, verts:vert, obj:"TShape", size:[3,2]} );
			
			//SQUARE
			vert = [ [ -1,-1,1,1 ] ];
			_shapes.push ( {id:1, verts: vert, obj: "Square", size:[2,2]} );
			
			//LINE
			vert = [ [ -2,-.5,2,.5 ] ];
			_shapes.push ( {id:2, verts: vert, obj: "Line", size:[4,1]} );
			
			//PLUS
			vert = [ [ -.5,-1.5,.5,-.5 ],[ -1.5,-.5,1.5,.5 ],[ -.5,.5,.5,1.5 ] ];
			_shapes.push ( {id:3, verts: vert, obj: "Plus", size:[3,3]} );
			
			//L
			vert = [ [ -1,-1.5,0,1.5 ],[ 0,-1.5,1,-.5 ] ];
			_shapes.push ( {id:4, verts: vert, obj: "LOne", size:[2,3]} );
			
			//REVERSE L
			vert = [ [ -1,-1.5,0,-.5 ],[ 0,-1.5,1,1.5 ] ];
			_shapes.push ( {id:5, verts: vert, obj: "LTwo", size:[2,3]} );
			
			//Z
			vert = [ [ -1.5,-1,.5,0 ],[ -.5,0,1.5,1 ] ];
			_shapes.push ( {id:6, verts: vert, obj: "ZOne", size:[3,2]} );
			
			//REVERSE Z
			vert = [ [ -.5,-1,1.5,0 ],[ -1.5,0,.5,1 ] ];
			_shapes.push ( {id:7, verts: vert, obj: "ZTwo", size:[3,2]} );
			
			return _shapes;
		}
		
		public static function randomShape($shapes:Array):Object {
			var shape:Number = Math.round( Math.random()* ($shapes.length*10000) )%$shapes.length;
			return $shapes[shape];
		}
	}
}