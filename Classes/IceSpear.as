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
			super.actions.push( new TapAction(100, 100, 400, 500, 300) );
			super.timings.push( 500 );			
			super.actions.push( new TapAction(180, 200, 400, 500, 300) );
			super.timings.push( 500 );			
			super.actions.push( new TapAction(260, 300, 400, 500, 300) );
			super.timings.push( 500 );			
			super.actions.push( new TapAction(340, 400, 400, 500, 300) );
			super.timings.push( 500 );			
			super.actions.push( new TapAction(440, 500, 400, 500, 300) );
		}
	}
}
