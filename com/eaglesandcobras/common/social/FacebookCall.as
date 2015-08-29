﻿package com.eaglesandcobras.common.social {	import flash.events.EventDispatcher;	import com.adobe.crypto.MD5;	import com.eaglesandcobras.common.net.JSONLoader;	import com.eaglesandcobras.common.events.FBEvent;	import flash.events.Event;	import flash.net.URLLoader;	import flash.net.URLRequest;	import flash.net.URLRequestMethod;	import flash.net.URLVariables;	import flash.net.URLLoaderDataFormat;		public class FacebookCall extends EventDispatcher {		public var apikey:String;		public var secretkey:String;		private static const restURL:String = "http://api.facebook.com/restserver.php";				public function FacebookCall(api:String, secret:String):void {			apikey = api;			secretkey = secret;		}				public static function callMethod(method:String,callArgs:Object = null):JSONLoader {      		var urlArgs:URLVariables = flattenArgs(method, callArgs);			var loader:JSONLoader = new JSONLoader();     		var request:URLRequest = new URLRequest(restURL);      		request.contentType = "application/x-www-form-urlencoded";      		request.method = URLRequestMethod.GET;      		request.data = urlArgs;			      		loader.dataFormat = URLLoaderDataFormat.TEXT;      		loader.load(request);      		return loader;    	}				private static function flattenArgs(method:String,callArgs:Object = null):URLVariables {      		callCount++;     		var urlArgs:URLVariables = new URLVariables();      		if (callArgs) {        		for (var key:String in callArgs) {          			if (callArgs[key] is Array) {            			urlArgs[key] = callArgs[key].join(",");          			} else {            			urlArgs[key] = callArgs[key];          			}        		}      		}      		urlArgs['v'] = '1.0';      		urlArgs['format'] = 'JSON';      		urlArgs['method'] = method;      		urlArgs['api_key'] = apikey;      		urlArgs['call_id'] = datePrefix + callCount;      		//urlArgs['session_key'] = FBConnect.session.key;      		var argsArray:Array = new Array();      		for(var arg:String in urlArgs) {        		var val:* = urlArgs[arg];        		argsArray.push(arg + "=" + val);      		}      		argsArray.sort();      		//var hashString:String = argsArray.join("") + FBConnect.session.secret;			var hashString:String = argsArray.join("") + secretkey;      		urlArgs['sig'] = MD5.hash(hashString);      		return urlArgs;    	}	}}