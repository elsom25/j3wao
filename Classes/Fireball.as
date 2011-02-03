package  
{	
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class Fireball extends Attack
	{
		public function Fireball()
		{
			super()
			buildAttack();
			addChild(super.actions[0]);
			super.actions[0].beginDrawing()
		}
		
		private function buildAttack():void
		{
			var a1:Action = new TapAction(100, 100, 800);
			var a2:Action = new TapAction(300, 300, 300);
			super.actions.push(a1);
			super.actions.push(a2);
			
			super.timings.push(1000);
			
			super.attackTimer = new Timer(super.timings[0]);
			attackTimer.addEventListener( TimerEvent.TIMER, loadNextAction );
			super.attackTimer.start();
		}
	}
}
