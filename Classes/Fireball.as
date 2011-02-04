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
			super.actions.push( new TapAction(100, 100, 800) );
			
			super.timings.push( 1000 );
			super.actions.push( new TapAction(300, 300, 300) );
			
			super.attackTimer = new Timer( super.timings[0] );
			attackTimer.addEventListener( TimerEvent.TIMER, loadNextAction );
			super.attackTimer.start();
		}
	}
}
