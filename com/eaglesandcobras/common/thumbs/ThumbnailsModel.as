﻿package com.eaglesandcobras.common.thumbs{	import flash.utils.getDefinitionByName;	import flash.events.Event;	import com.eaglesandcobras.common.mvc.Model;	import com.eaglesandcobras.common.data.DataObject;	import com.eaglesandcobras.common.data.DataParser;	import com.eaglesandcobras.common.events.ThumbEvent;	import com.eaglesandcobras.common.graphics.ItemStyle;	import com.eaglesandcobras.common.thumbs.ThumbItem;	import com.eaglesandcobras.common.thumbs.Paging;		public class ThumbnailsModel extends Model{		private var _parser:DataParser;		private var _items:Array;		private var _data:Object;		private var _selectedItem:int =0;		private var _paging:Paging;				public function ThumbnailsModel(){			super();						_items = new Array();			_paging = new Paging();		}				/*****************************		Load Data		*****************************/		public function loadData($do:DataObject):void {			//Method to remove old items						_parser = new DataParser($do);			_parser.addEventListener(Event.COMPLETE, dataLoaded);		}				private function dataLoaded(e:Event):void {			_parser.removeEventListener(Event.COMPLETE, dataLoaded);						_data = _parser.data;						this.dispatchEvent( new ThumbEvent ( ThumbEvent.DATA_READY ) );		}				/*****************************		Load Items		*****************************/		public function loadItems($item:String, $style:ItemStyle):void {			for (var i:Object in _data) {								var classReference:Class = getDefinitionByName($item) as Class;				var item = new classReference();								item.style = $style;				item.content = _data[i];				item.id = i;				_items.push (item);			}						this.dispatchEvent( new ThumbEvent ( ThumbEvent.ITEMS_READY ) );		}				/*****************************		GetItemAt		*****************************/		public function getItemAt($id:int):ThumbItem {			return _items[$id];		}				/*****************************		Return Items		*****************************/		public function get thumbs():Array {			return _items;		}				/*****************************		Selected Item		*****************************/		public function get selectedItem():ThumbItem{			return _items[_selectedItem];		}				public function get selectedItemNum():int{			return _selectedItem;		}				/*****************************		Total Items		*****************************/		public function get totalItems():int{			return _items.length;		}				/*****************************		Paging		*****************************/		public function get paging():Paging{			_paging.totalItems = totalItems;			return _paging;		}				public function set paging($b:Paging):void{			_paging = $b;		}				/*****************************		Total Pages		*****************************/		public function get totalPages():int {			return _paging.totalPages;		}				/*****************************		Current Page		*****************************/		public function get currentPage():int {			return _paging.currentPage;		}				/*****************************		Next Page		*****************************/		public function nextPage():Boolean{			return true;		}	}}