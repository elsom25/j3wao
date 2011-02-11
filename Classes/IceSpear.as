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
			super.startAttack();
		}
		
		private function buildAttack():void
		{
			super.actions.push( new TapAction(100, 300, 400, 100) );
			super.timings.push( 500 );			
			super.actions.push( new TapAction(180, 400, 400, 100) );
			super.timings.push( 500 );			
			super.actions.push( new TapAction(260, 500, 400, 100) );
			super.timings.push( 500 );			
			super.actions.push( new TapAction(340, 600, 400, 100) );
			super.timings.push( 500 );			
			super.actions.push( new TapAction(440, 700, 400, 100) );
		}
	}
}
