package com.eaglesandcobras.common.events
{
    import flash.events.*;

    public class ModelEvent extends Event
    {
        protected var _obj:Object = null;
        public static const DATA_LOAD_COMPLETE:String = "DATA_LOAD_COMPLETE";
        public static const CHANGE:String = "CHANGE";
        public static const DATA_LOAD_START:String = "DATA_LOAD_START";
        public static const DATA_LOAD_ERROR:String = "DATA_LOAD_ERROR";
        public static const COMMON_ERROR:String = "COMMON_ERROR";
        public static const DATA_LOAD_PROGRESS:String = "DATA_LOAD_PROGRESS";

        public function ModelEvent(param1:String, param2:Object = null)
        {
            _obj = null;
            super(param1);
            _obj = param2;
            return;
        }// end function

        public function get message() : String
        {
            if (_obj == null)
            {
                return "";
            }
            if (_obj.message == undefined)
            {
                return "";
            }
            return _obj.message;
        }// end function

        public function get bytesLoaded() : Number
        {
            if (_obj == null)
            {
                return 0;
            }
            if (_obj.bytesLoaded == undefined)
            {
                return 0;
            }
            return _obj.bytesLoaded;
        }// end function

        public function get bytesTotal() : Number
        {
            if (_obj == null)
            {
                return 0;
            }
            if (_obj.bytesTotal == undefined)
            {
                return 0;
            }
            return _obj.bytesTotal;
        }// end function

    }
}
