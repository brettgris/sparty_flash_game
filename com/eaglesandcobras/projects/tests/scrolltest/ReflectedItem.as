package com.eaglesandcobras.projects.tests.scrolltest{
	import com.eaglesandcobras.common.thumbs.ThumbItem;
	
	public class ReflectedItem extends ThumbItem{
		
		public function ReflectedItem(){
			super();
			init();
		}
		
		/*****************************
		INIT - set up item here
		*****************************/
		private function init():void {
			//add Loader
			//Set size and what not here
		}
		
		/*****************************
		Update Image and Description and URL here
		*****************************/
		override public function update():void {
			myTitle.text = content.title;
		}
	}
}