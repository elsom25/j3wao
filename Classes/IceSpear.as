package  
{	
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class IceSpear extends Attack
	{
		public function IceSpear(bpm:Number)
		{
			super();
			buildAttack(bpm);
			super.startAttack();
		}
		
		private function buildAttack(bpm:Number):void
		{
			super.actions.push( new TapAction(100, 300, 800, 200) );
			super.timings.push(  beatsToMilliseconds(2, bpm) );			
			
			super.actions.push( new TapAction(180, 400, 800, 200) );
			super.timings.push(  beatsToMilliseconds(2, bpm) );			
			
			super.actions.push( new TapAction(260, 500, 800, 200) );
			super.timings.push(  beatsToMilliseconds(2, bpm) );			
			
			super.actions.push( new TapAction(340, 600, 800, 200) );
			super.timings.push(  beatsToMilliseconds(2, bpm) );			
			
			super.actions.push( new TapAction(440, 700, 800, 200) );
		}
	}
}
