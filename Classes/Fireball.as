﻿package  
{	
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class Fireball extends Attack
	{
		public function Fireball(bpm:Number)
		{
			super();
			buildAttack(bpm);
			super.startAttack();
		}
		
		private function buildAttack(bpm:Number):void
		{
			super.actions.push( new TapAction(300, 300, 2000, 500) );
			super.timings.push( beatsToMilliseconds(4, bpm) );
			super.actions.push( new TapAction(400, 300, 2000, 500) );
		}
	}
}
