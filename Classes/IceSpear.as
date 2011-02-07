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
			super.actions.push( new TapAction(100, 100, 1000) );
			super.timings.push( 900 );			
			super.actions.push( new TapAction(180, 200, 1000) );
			super.timings.push( 900 );			
			super.actions.push( new TapAction(260, 300, 1000) );
			super.timings.push( 900 );			
			super.actions.push( new TapAction(340, 400, 1000) );
			super.timings.push( 900 );			
			super.actions.push( new TapAction(440, 500, 1000) );
		}
	}
}
