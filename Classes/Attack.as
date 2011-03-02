package 
{
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;

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
		protected var damage:Number;
		public function Attack()
		{
			actions = new Array();
			timings = new Array();
			nextIndex = 0;
			damage = 0;
		}
		
		/*
		Sets up the next attack to draw to the screen. Pays no
		attention to timing.
		*/
		public function initializeNextAction():void
		{
			addChild(actions[nextIndex]);
			actions[nextIndex].beginDrawing();
			actions[nextIndex].addEventListener(Action.MISSED_ACTION,cancelAttack);
			nextIndex++;
		}

		public function startAttack()
		{
			if (actions.length > 0)
			{
				attackTimer = new Timer(timings[0]);
				attackTimer.addEventListener( TimerEvent.TIMER, loadNextAction );
				attackTimer.start();
				
				initializeNextAction();
			}
			else
			{
				trace("[FATAL ERROR] 0 length action array in Attack detected!");
			}
			
		}
		
		/*
		Loads the next action, and sets up the attack timer to load the NEXT one in
		the future if applicable.
		*/
		public function loadNextAction(timerEvent:TimerEvent):void
		{
			attackTimer.stop();

			if (! isLastAction())
			{
				attackTimer = new Timer(timings[nextIndex]);
				attackTimer.addEventListener( TimerEvent.TIMER, loadNextAction );
				attackTimer.start();
			}
			initializeNextAction();
		}

		private function isLastAction():Boolean
		{
			return nextIndex == timings.length;
		}
		
		public function beatsToMilliseconds(beats:Number, beatsPerMinute:Number):Number
		{
			const SECONDS_PER_MINUTE:Number = 60;
			const MILLISECONDS_PER_SECOND = 1000;
			
			var minutes = beats / beatsPerMinute;
			var seconds = minutes * SECONDS_PER_MINUTE;
			var milliseconds = seconds * MILLISECONDS_PER_SECOND;
			
			return milliseconds;
		}
		
		public function getDamage():Number
		{
			return damage;
		}
		
		public function cancelAttack(event:Event):void
		{
			for each (var act:Action in actions) {
				act.remove();
			}
			attackTimer.stop();
		}
		
	}
}