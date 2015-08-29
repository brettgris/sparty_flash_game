package com.eaglesandcobras.common.physics{
	import Box2D.Dynamics.b2Body;
	import flash.display.MovieClip;
	
	public class Actor extends Object{
		private var _graphic:MovieClip;
		private var _shape:Array;
		private var _type:String;
		private var _destory:Boolean;
		
		public function Actor(){
			super();
			
			_graphic = new MovieClip();
			_shape = new Array();
			_type = "";
		}
		
		/*******************
		GRAPHIC
		*******************/
		public function set graphic($m:MovieClip):void {
			_graphic = $m;
		}
		
		public function get graphic():MovieClip{
			return _graphic;
		}
		
		/********************
		Shape
		********************/
		public function set shape($a:Array):void {
			_shape = $a;
			update();
		}
		
		public function get shape():Array{
			return _shape;
		}	
		
		/********************
		TYPE
		********************/
		public function set type($a:String):void {
			_type = $a;
		}
		
		public function get type():String{
			return _type;
		}	
		
		/********************
		UPDATE
		********************/
		public function update():void{
			
		}
	}
}