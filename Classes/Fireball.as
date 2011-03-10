package  
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
			super.actions.push( new TapAction(300, 300, 1000, 200) );
			super.timings.push( beatsToMilliseconds(5, bpm) );
			super.actions.push( new TapAction(400, 300, 1000, 2) );
		}
	}
}
