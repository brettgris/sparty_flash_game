﻿package com.eaglesandcobras.common.mvc{	import flash.display.Sprite;	import flash.events.Event;		public class App extends Sprite{		private var _model:Model;		private var _view:View;				public function App($model:Model, $view:View){			addEventListener(Event.ADDED_TO_STAGE, onStageAdded);			_model = $model;			_view = $view;		}				private function onStageAdded(e:Event):void {			removeEventListener(Event.ADDED_TO_STAGE, onStageAdded);						addChild(_view);		}				public function get model():Model {			return _model;		}				public function get view():View {			return _view;		}			}}