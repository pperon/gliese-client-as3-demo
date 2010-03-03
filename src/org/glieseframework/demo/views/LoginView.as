package org.glieseframework.demo.views
{
	import flash.events.MouseEvent;
	
	import mx.containers.Canvas;
	import mx.core.FlexGlobals;
	
	import spark.components.TextInput;
	
	public class LoginView extends Canvas
	{
		public var username:TextInput;
		public var password:TextInput;
		
		public function LoginView()
		{
			super();
			addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
		protected function clickHandler(event:MouseEvent):void
		{
			FlexGlobals.topLevelApplication.login(username.text, password.text);
		}
	}
}