package org.glieseframework.demo.views
{
	import com.pblabs.engine.PBE;
	import com.pblabs.rendering2D.BasicSpatialManager2D;
	import com.pblabs.rendering2D.ui.FlexSceneView;
	
	import flash.display.Sprite;
	
	import mx.containers.Canvas;
	import mx.core.FlexGlobals;
	import mx.events.FlexEvent;
	
	public class GameView extends Canvas
	{
		public var sceneView:FlexSceneView;
		
		public function GameView()
		{
			super();
			addEventListener(FlexEvent.CREATION_COMPLETE, creationCompleteHandler);
		}
		
		public function loadGameMode(mode:String):void
		{
			trace("load game mode: " + mode);
		}
		
		private function creationCompleteHandler(event:FlexEvent):void
		{
			PBE.startup(FlexGlobals.topLevelApplication as Sprite);
			PBE.initializeScene(sceneView, "scene", null, BasicSpatialManager2D);
		}
	}
}