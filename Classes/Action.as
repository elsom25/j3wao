package  
{	
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.MouseEvent;
	
	public class Action extends MovieClip
	{
		public var actionTimer:Timer;
		
		public function Action(millisecondsUntilCompletion:Number) 
		{
			actionTimer = new Timer(millisecondsUntilCompletion);
			actionTimer.addEventListener( TimerEvent.TIMER, remove );
			addEventListener(MouseEvent.CLICK, handleClick);
			super.addEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}
		
		public function beginDrawing():void
		{
			actionTimer.start();
		}
		
		public function remove(timerEvent:TimerEvent):void
		{
			trace("Removing action");
			super.visible = false
			actionTimer.stop();
		}
		
		public function handleClick(mouseEvent:MouseEvent):void
		{
			trace("Click detected!");
		}
	}
}
