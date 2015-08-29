﻿package com.eaglesandcobras.common.events {  import flash.events.Event;  public class FBEvent extends Event {    public static const SUCCESS:String = "success";    public static const RETRY:String = "retry";    public static const FAILURE:String = "failure";    public static const SHOWING:String = "fb_showing";    public static const SHOWN:String = "fb_shown";    public static const CLOSED:String = "fb_closed";    public static const CLOSING:String = "fb_closing";    public static const STATUS_CHANGED:String = "statusChanged";    public static const PERMISSION_CHANGED:String = "permissionChanged";    public static const ALERT:String = "fb_alert";    public static const ERROR:String = "fb_error";    private var _data:*;    public function FBEvent(type:String, new_data:*= null) {      _data = new_data;      super(type, true, true);    }    public function get data():* { return _data; }  }}