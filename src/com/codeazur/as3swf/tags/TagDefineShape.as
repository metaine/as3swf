﻿package com.codeazur.as3swf.tags
{
	import com.codeazur.as3swf.SWFData;
	import com.codeazur.as3swf.data.SWFRectangle;
	import com.codeazur.as3swf.data.SWFShapeWithStyle;
	
	public class TagDefineShape extends Tag implements ITag
	{
		public static const TYPE:uint = 2;
		
		public var shapeId:uint;
		public var shapeBounds:SWFRectangle;
		public var shapes:SWFShapeWithStyle;
		
		public function TagDefineShape() {}
		
		public function parse(data:SWFData, length:uint):void {
			cache(data, length);
			shapeId = data.readUI16();
			shapeBounds = data.readRECT();
			shapes = data.readSHAPEWITHSTYLE();
		}
		
		override public function get type():uint { return TYPE; }
		override public function get name():String { return "DefineShape"; }
		
		public function toString(indent:uint = 0):String {
			var str:String = toStringMain(indent) +
				"ID: " + shapeId + ", " +
				"Bounds: " + shapeBounds;
			str += shapes.toString(indent + 2);
			return str;
		}
	}
}
