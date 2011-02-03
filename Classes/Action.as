package  
{	
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class Action extends MovieClip
	{
		public var actionTimer:Timer;
		
		public function Action(millisecondsUntilCompletion:Number) 
		{
			actionTimer = new Timer(millisecondsUntilCompletion);
			actionTimer.addEventListener( TimerEvent.TIMER, remove );
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
	}
}
