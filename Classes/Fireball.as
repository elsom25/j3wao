﻿﻿package  
{	
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class Fireball extends Attack
	{
		public function Fireball(bpm:Number)
		{
			super();
			buildAttack(bpm);
		}
		
		private function buildAttack(bpm:Number):void
		{
			super.actions.push( new TapAction(900, 200, beatsToMilliseconds(1, bpm), 200, 10) );
			super.timings.push( beatsToMilliseconds(3, bpm) );
			super.actions.push( new TapAction(800, 400, beatsToMilliseconds(1, bpm), 200, 20) );
		}
	}
}
