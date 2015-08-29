package com.eaglesandcobras.common.types.preloader{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.display.Loader;
	import flash.text.TextField;
	
	public class Preloader extends MovieClip{
		private var _loadBar:MovieClip;
		private var _loadWidth:Number;
		private var _loadTxt:TextField;
		private var _loadContainer:MovieClip;
		private var _loadPath:String;
		private var _loader:Loader;
		private var _content:MovieClip;
		
		public function Preloader() {
			super();
		}
		
		/******************************
		WHAT WILL CHANGE SIZE ON LOAD
		******************************/
		public function set loadBar($m:MovieClip):void {
			_loadBar = $m;
			_loadWidth = _loadBar.width;
			_loadBar.width = 0;
		}
		
		/******************************
		TEXT DISPLAY OF PERCENT
		******************************/
		public function set percentText($t:TextField):void {
			_loadTxt = $t;
		}
		
		/******************************
		WHAT IS THE PARENT PRELOADER THAT NEEDS TO GO AWAY
		******************************/
		public function set loadContainer($m:MovieClip):void {
			_loadContainer = $m;
		}
		
		/******************************
		WHAT SHOULD WE LOAD
		******************************/
		public function set loadPath($s:String):void {
			_loadPath = $s;
		}
		
		/******************************
		LOAD IT
		******************************/
		public function load():void {
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, doProgress);
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaded);
		}
		
		private function doProgress(e:ProgressEvent):void {
			var per:Number = e.bytesLoaded/e.bytesTotal;
			
			if ( _loadDisplay) _loadDisplay.width = _loadWidth * per;
			
			if ( _loadTxt) _loadTxt.text = Math.round (per*100);
		}
		
		private function loaded(e:Event):void {
			removeChild( _loadContainer );
			
			_content = addChild(_loader.content);
		}
	}
}