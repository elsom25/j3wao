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
			super.actions.push( new TapAction(300, 300, beatsToMilliseconds(1, bpm), 200, 10) );
			super.timings.push(  beatsToMilliseconds(2, bpm) );			
			
			super.actions.push( new TapAction(1300, 300, beatsToMilliseconds(1, bpm), 200, 10) );
			super.timings.push(  beatsToMilliseconds(2, bpm) );			
			
			super.actions.push( new TapAction(300, 450, beatsToMilliseconds(1, bpm), 200, 10) );
			super.timings.push(  beatsToMilliseconds(2, bpm) );			
			
			super.actions.push( new TapAction(1300, 450, beatsToMilliseconds(1, bpm), 200, 20) );
			super.timings.push(  beatsToMilliseconds(2, bpm) );			
			
			super.actions.push( new TapAction(800, 500, beatsToMilliseconds(2, bpm), 200, 30) );
		}
	}
}
