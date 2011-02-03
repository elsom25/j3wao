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
			addChild(super.actions[0]);
			super.actions[0].beginDrawing();
		}
		
		private function buildAttack():void
		{			
			super.actions.push( new TapAction(50, 50, 500) );
			
			super.timings.push( 700 );			
			super.actions.push( new TapAction(100, 100, 500) );
			
			super.timings.push( 700 );			
			super.actions.push( new TapAction(150, 150, 500) );
			
			super.timings.push( 700 );			
			super.actions.push( new TapAction(200, 200, 500) );
			
			super.timings.push( 700 );			
			super.actions.push( new TapAction(250, 250, 500) );
			
			super.attackTimer = new Timer( super.timings[0] );
			attackTimer.addEventListener( TimerEvent.TIMER, loadNextAction );
			super.attackTimer.start();
		}
	}
}
