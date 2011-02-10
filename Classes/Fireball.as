package  
{	
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class Fireball extends Attack
	{
		public function Fireball()
		{
			super();
			buildAttack();
			startAttack();
		}
		
		private function buildAttack():void
		{
			super.actions.push( new TapAction(300, 300, 500, 1000, 200)  );
			super.timings.push( 1000 );
			super.actions.push( new TapAction(400, 300, 500, 1000, 200) );
		}
	}
}
