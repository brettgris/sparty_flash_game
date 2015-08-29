package com.eaglesandcobras.common.events
{
	import flash.events.Event;
	
	public class GameEvent extends Event
	{
		public var params:Object;
		
		public static const SCENE_DONE:String = "SCENE_DONE";
		public static const SCENE_START:String = "SCENE_START";
		public static const SCENE_WAITING:String = "SCENE_WAITING";
		public static const SCENE_CHANGE:String = "SCENE_CHANGE";
		public static const READY_FOR_CHANGE:String = "READY_FOR_CHANGE";
		public static const UPDATE_SCORE:String = "UPDATE_SCORE";
		public static const ROUND_DONE:String = "ROUND_DONE";
		public static const CORRECT_ANSWER:String = "CORRECT_ANSWER";
		public static const WRONG_ANSWER:String = "WRONG_ANSWER";
		public static const PLAY_SOUND:String = "PLAY_SOUND";
		public static const GLOBAL_SOUND:String = "GLOBAL_SOUND";
		
		public function GameEvent($type:String, $params:Object=null, $bubbles:Boolean=false, $cancelable:Boolean=false)
		{
			super($type, $bubbles, $cancelable);
			this.params = $params;
		}
		
		public override function clone():Event {
			
			return new GameEvent(type, this.params, bubbles, cancelable);
			
		}
		public override function toString():String {
			
			return formatToString("GameEvent", "params", "type", "bubbles", "cancelable");
			
		}
	}
}