package 
{
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class Attack extends MovieClip
	{
		protected var actions:Array
		protected var timings:Array
		protected var nextIndex:Number
		protected var attackTimer:Timer
		
		public function Attack()
		{
			actions = new Array();
			timings = new Array();
			nextIndex = 0;
		}
		
		public function loadNextAction(timerEvent:TimerEvent):void
		{
			trace("Loading next action");
			attackTimer.stop();
			
			if (nextIndex != timings.length)
			{
				attackTimer = new Timer(timings[nextIndex]);
				attackTimer.addEventListener( TimerEvent.TIMER, loadNextAction );
				attackTimer.start();
				
				addChild(actions[nextIndex+1]);
				actions[nextIndex+1].beginDrawing()
				
				nextIndex++;
			}
		}
	}
}
