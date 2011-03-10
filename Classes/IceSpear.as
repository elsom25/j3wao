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
			super.actions.push( new TapAction(300, 300, 1000, 200) );
			super.timings.push(  beatsToMilliseconds(2, bpm) );			
			
			super.actions.push( new TapAction(1300, 300, 1000, 200) );
			super.timings.push(  beatsToMilliseconds(2, bpm) );			
			
			super.actions.push( new TapAction(300, 450, 1000, 200) );
			super.timings.push(  beatsToMilliseconds(2, bpm) );			
			
			super.actions.push( new TapAction(1300, 450, 1000, 200) );
			super.timings.push(  beatsToMilliseconds(2, bpm) );			
			
			super.actions.push( new TapAction(800, 500, 2000, 200) );
		}
	}
}
