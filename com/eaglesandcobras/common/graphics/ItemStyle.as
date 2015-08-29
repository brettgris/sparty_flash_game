﻿package com.eaglesandcobras.common.graphics{	import com.eaglesandcobras.common.graphics.StateStyle;	import flash.display.MovieClip;		public class ItemStyle extends Object{		private var _default:StateStyle;		private var _over:StateStyle;		private var _selected:StateStyle;				public function ItemStyle(){			_default = new StateStyle();			_over = new StateStyle();			_selected = new StateStyle();		}				/*****************************		Default		*****************************/		public function set defaultStyle($b:StateStyle):void {			_default = $b;		}				public function get defaultStyle():StateStyle {			return _default;		}				/*****************************		Over		*****************************/		public function set overStyle($b:StateStyle):void {			_over = $b;		}				public function get overStyle():StateStyle {			return _over;		}				/*****************************		Selected		*****************************/		public function set selectedStyle($b:StateStyle):void {			_selected = $b;		}				public function get selectedStyle():StateStyle {			return _selected;		}				/*****************************		Fill		*****************************/		public function set fill($b:Boolean):void {			_default.fill = $b;			_over.fill = $b;			_selected.fill = $b;		}		/*****************************		Stroke		*****************************/		public function set stroke($b:Boolean):void {			_default.stroke = $b;			_over.stroke = $b;			_selected.stroke = $b;		}		/*****************************		Item Width		*****************************/		public function set width($b:Number):void {			_default.width = $b;			_over.width = $b;			_selected.width = $b;		}				public function get width():Number {			return _default.width;		}		/*****************************		Item Height		*****************************/		public function set height($b:Number):void {			_default.height = $b;			_over.height = $b;			_selected.height = $b;		}				public function get height():Number {			return _default.height;		}			}}