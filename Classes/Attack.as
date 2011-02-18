package 
{
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	/*
	Attack is an abstract class that presents an attack on screen and keeps track of things like damage.
	An attack is defined by 
	- a list of Actions (the actions array),
	- the length of time between the start of two adjacent actions (the timings array),
	- the nextIndex variable indicates the progress of this attack. It is needed to know which Action to start next.
	- the attackTimer is the timer that indicates when to start drawing the next attack. It's length depends on the timings array.
	*/
	public class Attack extends MovieClip
	{
		protected var actions:Array;
		protected var timings:Array;
		protected var nextIndex:Number;
		protected var attackTimer:Timer;
		public function Attack()
		{
			actions = new Array();
			timings = new Array();
			nextIndex = 0;
		}

		public function startAttack()
		{
			if (actions.length > 0)
			{
				attackTimer = new Timer(timings[0]);
				attackTimer.addEventListener( TimerEvent.TIMER, loadNextAction );
				attackTimer.start();

				addChild(actions[0]);
				actions[0].beginDrawing();

				nextIndex++;
			}
			else
			{
				trace("[FATAL ERROR] 0 length action array in Attack detected!");
			}
		}

		public function loadNextAction(timerEvent:TimerEvent):void
		{
			attackTimer.stop();

			if (! isLastAction())
			{
				attackTimer = new Timer(timings[nextIndex]);
				attackTimer.addEventListener( TimerEvent.TIMER, loadNextAction );
				attackTimer.start();

				addChild(actions[nextIndex]);
				actions[nextIndex].beginDrawing();

				nextIndex++;
			}
			else
			{
				addChild(actions[nextIndex]);
				actions[nextIndex].beginDrawing();
				nextIndex++;
			}
		}

		private function isLastAction():Boolean
		{
			return nextIndex == timings.length;
		}
	}
}