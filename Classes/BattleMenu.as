package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	
	public class BattleMenu extends MovieClip {
		public static const SHOW_EVENT:String = "finish";
		public static const HIDE_EVENT:String = "hide";
		
		public var battleController:BattleController
		
		public function BattleMenu() {
			
			Attack1.addEventListener(MouseEvent.CLICK, A1Click);
			Attack2.addEventListener(MouseEvent.CLICK, A2Click);
			
			function A1Click(event:MouseEvent):void{
				(battleController.launchFireball()).addEventListener(SHOW_EVENT,showMenu);
				dispatchEvent(new Event(HIDE_EVENT));
			}

			function A2Click(event:MouseEvent):void{
				(battleController.launchIceSpear()).addEventListener(SHOW_EVENT,showMenu);
				dispatchEvent(new Event(HIDE_EVENT));
			}
			
			function showMenu(event:Event):void
			{
				dispatchEvent(new Event("finish"));
			}

		}
	}
	
}
