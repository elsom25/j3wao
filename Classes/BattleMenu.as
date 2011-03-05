package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	
	public class BattleMenu extends MovieClip {
		public static const SHOW_EVENT:String = "finish";
		public static const HIDE_EVENT:String = "hide";
		
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
					attack.addEventListener(SHOW_EVENT,showMenu);
					dispatchEvent(new Event(HIDE_EVENT));
				}
			}

			function A2Click(event:MouseEvent):void{
				if(battleController.actionPoints >= 30)
				{
					battleController.actionPoints = battleController.actionPoints - 30;
					var attack:Attack = new IceSpear(90);
					battleController.addChild( attack );
					attack.addEventListener(SHOW_EVENT,showMenu);
					dispatchEvent(new Event(HIDE_EVENT));
				}
			}
			
			function showMenu(event:Event):void
			{
				dispatchEvent(new Event("finish"));
			}

		}
	}
	
}
