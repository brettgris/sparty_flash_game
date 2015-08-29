package com.eaglesandcobras.common.graphics{
	
	public class ScrollStyle extends Object{
		private var _direction:String;
		private var _align:String;
		private var _padding:Number;
		private var _width:Number;
		private var _height:Number;
		private var _loop:Boolean;
		
		public static const VERTICAL:String = "VERTICAL";
		public static const HORIZONTAL:String = "HORIZONTAL";
		
		public static const TOP_LEFT:String = "TOP_LEFT";
		public static const BOTTOM_RIGHT:String = "BOTTOM_RIGHT";
		
		public function ScrollStyle(){
			_direction = HORIZONTAL;
			_align = TOP_LEFT;
			_padding=10;
			_width = 400;
			_height = 200;
			_loop = false;
		}
		
		/*****************************
		Height
		*****************************/
		public function set height($b:Number):void {
			_height = $b;
		}
		
		public function get height():Number {
			return _height;
		}
		
		/*****************************
		Width
		*****************************/
		public function set width($b:Number):void {
			_width = $b;
		}
		
		public function get width():Number {
			return _width;
		}
		
		/*****************************
		Padding
		*****************************/
		public function set padding($b:Number):void {
			_padding = $b;
		}
		
		public function get padding():Number {
			return _padding;
		}
		
		/*****************************
		DIRECTION
		*****************************/
		public function set direction($b:String):void {
			_direction = $b;
		}
		
		public function get direction():String {
			return _direction;
		}
		
		/*****************************
		ALIGN
		*****************************/
		public function set align($b:String):void {
			_align = $b;
		}
		
		public function get align():String {
			return _align;
		}
		
		/*****************************
		LOOP
		*****************************/
		public function set loop($b:Boolean):void {
			_loop = $b;
		}
		
		public function get loop():Boolean {
			return _loop;
		}
	}
}