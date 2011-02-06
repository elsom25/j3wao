package  
{	
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class IceSpear extends Attack
	{
		public function IceSpear()
		{
			super();
			buildAttack();
			startAttack();
		}
		
		private function buildAttack():void
		{			
			super.actions.push( new TapAction(50, 50, 1700) );
			
			super.timings.push( 2000 );			
			super.actions.push( new TapAction(100, 100, 1700) );
			
			super.timings.push( 2000 );			
			super.actions.push( new TapAction(150, 150, 1700) );
			
			super.timings.push( 2000 );			
			super.actions.push( new TapAction(200, 200, 1700) );
			
			super.timings.push( 2000 );			
			super.actions.push( new TapAction(250, 250, 1700) );
			
			super.attackTimer = new Timer( super.timings[0] );
			attackTimer.addEventListener( TimerEvent.TIMER, loadNextAction );
			super.attackTimer.start();
		}
	}
}
