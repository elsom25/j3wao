package 
{
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.MouseEvent;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import fl.transitions.TweenEvent;
	import flash.display.Sprite;
	import flash.display.Shape;

	public class Action extends MovieClip
	{
		public var actionTimer:Timer;

		public function Action(millisecondsUntilCompletion:Number)
		{
			actionTimer = new Timer(millisecondsUntilCompletion);
			actionTimer.addEventListener( TimerEvent.TIMER, remove );
			addEventListener(MouseEvent.CLICK, handleClick);
			super.addEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}

		public function beginDrawing():void
		{
			actionTimer.start();
			drawApproachCircle();
		}

		private function drawApproachCircle():void
		{
			var circle:Shape = new Shape( );
			
			circle.graphics.beginFill(0xFFFFFF, 0);
			circle.graphics.lineStyle(2);
			circle.graphics.drawCircle(0,0,100);
			circle.graphics.endFill();
			addChild(circle);
			
			
			var heightTween:Tween = new Tween(circle,"scaleX", None.easeIn, 1, 0.5, 1, true);
			var widthTween:Tween = new Tween(circle,"scaleY", None.easeIn, 1, 0.5, 1, true);
			heightTween.start();
			widthTween.start();
		}

		public function remove(timerEvent:TimerEvent):void
		{
			trace("Removing action");
			super.visible = false;
			actionTimer.stop();
		}

		public function handleClick(mouseEvent:MouseEvent):void
		{
			trace("Click detected!");
		}
	}
}