package
{
	import mx.containers.ViewStack;
	import mx.events.FlexEvent;
	
	import org.glieseframework.Gliese;
	import org.glieseframework.Session;
	import org.glieseframework.demo.modes.OverlandMode;
	import org.glieseframework.game.UserPlayer;
	import org.glieseframework.message.common.ModeChangeMessageHandler;
	
	import spark.components.Application;
	
	public class GlieseClientDemo extends Application
	{	
		
		[Bindable]
		[Embed(source="../resources/glieseconfig.xml",mimeType ="application/octet-stream")]
		public var GlieseConfigFile:Class;
		
		public var viewStack:ViewStack;
		
		public function GlieseClientDemo()
		{
			super();
			addEventListener(FlexEvent.APPLICATION_COMPLETE, init);
		}
		
		private function init(event:FlexEvent):void
		{
			Gliese.registerClass(ModeChangeMessageHandler);
			Gliese.registerClass(OverlandMode);
			Gliese.initialize(new GlieseConfigFile(), initCallback);
		}
		
		private function initCallback(session:Session):void
		{
			_session = session;
		}
		
		public function login(username:String, password:String):void
		{
			_player = _session.login(username, password);
		}
		
		public function showLoginView():void
		{
			viewStack.selectedIndex = 0;
		}
		
		public function showGameView():void
		{
			viewStack.selectedIndex = 1;
		}
		
		private var _player:UserPlayer;
		private var _session:Session;
	}
}