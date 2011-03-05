package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	
	public class BattleMenu extends MovieClip {
		protected var actionPoints:Number
		public var battleController:BattleController
		
		public function BattleMenu() {
			
			Attack1.addEventListener(MouseEvent.CLICK, A1Click);
			Attack2.addEventListener(MouseEvent.CLICK, A2Click);
			
			function A1Click(event:MouseEvent):void{
				if ( battleController.actionPoints >= 2 )
				{
					battleController.actionPoints = battleController.actionPoints - 2;
					var attack:Attack = new Fireball(90);
					battleController.addChild( attack );
					attack.addEventListener("finish",showMenu);
					dispatchEvent(new Event("hide"));
				}
			}

			function A2Click(event:MouseEvent):void{
				if(battleController.actionPoints >= 30)
				{
					battleController.actionPoints = battleController.actionPoints - 30;
					var attack:Attack = new IceSpear(90);
					battleController.addChild( attack );
					attack.addEventListener("finish",showMenu);
					dispatchEvent(new Event("hide"));
				}
			}
			
			function showMenu(event:Event):void
			{
				dispatchEvent(new Event("finish"));
			}

		}
	}
	
}
