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
		}
		
		private function buildAttack(bpm:Number):void
		{
			super.actions.push( new TapAction(100, 300, 1000, 200) );
			super.timings.push(  beatsToMilliseconds(2, bpm) );			
			
			super.actions.push( new TapAction(180, 400, 1000, 200) );
			super.timings.push(  beatsToMilliseconds(2, bpm) );			
			
			super.actions.push( new TapAction(260, 500, 1000, 200) );
			super.timings.push(  beatsToMilliseconds(2, bpm) );			
			
			super.actions.push( new TapAction(340, 600, 1000, 200) );
			super.timings.push(  beatsToMilliseconds(2, bpm) );			
			
			super.actions.push( new TapAction(440, 700, 2000, 200) );
		}
	}
}
