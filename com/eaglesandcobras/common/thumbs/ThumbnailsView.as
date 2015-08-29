package com.eaglesandcobras.common.thumbs{
	import com.eaglesandcobras.common.mvc.View;
	import com.eaglesandcobras.common.thumbs.ThumbItem;
	import com.eaglesandcobras.common.graphics.ItemStyle;
	import com.eaglesandcobras.common.events.ThumbEvent;
	import flash.display.Sprite;
	
	public class ThumbnailsView extends View{
		private var _thumbs:Array;
		private var _itemStyle:ItemStyle;
		private var _container:Sprite;
		
		public function ThumbnailsView(){
			super();
			_thumbs = new Array();
			_itemStyle = new ItemStyle();
			_container = new Sprite();
		}
		
		/*****************************
		Add Items
		*****************************/
		public function addThumbs( $thumbs:Array ):void {
			//remove old thumbs
			
			for ( var i:Object in $thumbs ) {
				_thumbs[i] = _container.addChild ($thumbs[i]);
				addEvents(_thumbs[i]);
			}
		}
		
		/*****************************
		ItemStyle
		*****************************/
		public function set itemStyle($itemStyle:ItemStyle):void {
			_itemStyle = $itemStyle;
		}
		
		public function get itemStyle():ItemStyle {
			return _itemStyle;
		}
		
		/*****************************
		Get Thumbs
		*****************************/
		public function get thumbs():Array{
			return _thumbs;
		}
		
		public function get container():Sprite {
			return _container;
		}
		
		/*****************************
		Select Item
		*****************************/
		public function selectItemNum($id:int):void {
			for ( var i:Object in _thumbs ) {
				if (i==$id) _thumbs[i].select();
				else _thumbs[i].deselect();
			}
		}
		
		/*****************************
		MouseEvents
		*****************************/
		private function addEvents($obj:ThumbItem):void {
			$obj.addEventListener(ThumbEvent.ITEM_CLICK, itemClicked);
		}
		
		private function itemClicked(e:ThumbEvent):void {
			selectItemNum (e.target.id);
		}
		
		
	}
}