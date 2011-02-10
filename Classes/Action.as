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
	import flashx.textLayout.formats.Float;

	public class Action extends MovieClip
	{
		protected var actionTimer:Timer;
		protected var approachTime:Number;
		protected var hitTime:Number;
		protected var bufferTime:Number;


		/*hitTime represents the perfect moment to touch. bufferTime allows a small grace window before and after the hitTime*/
		public function Action(approachTime:Number, hitTime:Number, bufferTime:Number)
		{
			const MILLISECONDS_IN_A_SECOND:Number = 1000;
			this.approachTime = approachTime / MILLISECONDS_IN_A_SECOND;
			this.hitTime = hitTime;
			this.bufferTime = bufferTime;
			
			var millisecondsUntilCompletion:Number = approachTime + bufferTime;
			actionTimer = new Timer(millisecondsUntilCompletion, 1);
			actionTimer.addEventListener( TimerEvent.TIMER_COMPLETE, remove );
			
			addEventListener(MouseEvent.CLICK, handleClick);
		}
		public function beginDrawing():void
		{
			drawApproachCircle();
			actionTimer.start();
		}

		private function drawApproachCircle():void
		{
			trace("Entering Action.drawApproachCircle");

			var circle:Shape = new Shape();

			circle.graphics.beginFill(0xFFFFFF, 0);
			circle.graphics.lineStyle(2);
			circle.graphics.drawCircle(0,0,100);
			circle.graphics.endFill();
			addChild(circle);

			var heightTween:Tween = new Tween(circle,"scaleX",None.easeIn,1,0.5,approachTime,true);
			var widthTween:Tween = new Tween(circle,"scaleY",None.easeIn,1,0.5,approachTime,true);
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
			
			trace("Click detected at t=" + actionTimer.currentCount + "!");
		}
	}
}