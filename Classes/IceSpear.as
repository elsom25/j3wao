package  
{	
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class IceSpear extends Attack
	{
		public function IceSpear()
		{
			super()
			buildAttack();
			addChild(super.actions[0]);
			super.actions[0].beginDrawing()
		}
		
		private function buildAttack():void
		{
			var a1:Action = new TapAction(50, 50, 500);
			var a2:Action = new TapAction(100, 100, 500);
			var a3:Action = new TapAction(150, 150, 500);
			var a4:Action = new TapAction(200, 200, 500);
			var a5:Action = new TapAction(250, 250, 500);
			super.actions.push(a1);
			super.actions.push(a2);
			super.actions.push(a3);
			super.actions.push(a4);
			super.actions.push(a5);
			
			super.timings.push(700);
			super.timings.push(700);
			super.timings.push(700);
			super.timings.push(700);
			
			super.attackTimer = new Timer(super.timings[0]);
			attackTimer.addEventListener( TimerEvent.TIMER, loadNextAction );
			super.attackTimer.start();
		}
	}
}
