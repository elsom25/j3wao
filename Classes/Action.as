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
	import flash.net.dns.ARecord;

	public class Action extends MovieClip
	{
		public const MILLISECONDS_IN_A_SECOND:Number = 1000;
		
		protected var actionTimer:Timer;
		protected var approachTime:Number;
		protected var bufferTime:Number;

		protected var bufferRegions:Array;
		protected var activeRegionIndex:Number;
		protected var bufferTimer:Timer;

		private var modifier:Number;

		public function Action(approachTime:Number, bufferTime:Number)
		{
			this.approachTime = approachTime / MILLISECONDS_IN_A_SECOND;
			this.bufferTime = bufferTime;

			initializeActionTimer();
			initializeBufferRegions();
			
			addEventListener(MouseEvent.CLICK, handleClick);
		}
		
		private function initializeActionTimer():void
		{
			var millisecondsUntilCompletion:Number = approachTime * MILLISECONDS_IN_A_SECOND + bufferTime;
			actionTimer = new Timer(millisecondsUntilCompletion, 1);
			actionTimer.addEventListener( TimerEvent.TIMER_COMPLETE, remove );
		}
		
		private function initializeBufferRegions():void
		{
			const startOfClickableRegion = (approachTime * MILLISECONDS_IN_A_SECOND) - bufferTime;
			
			bufferRegions = new Array();
			bufferRegions.push(new ActionRegion("Miss", startOfClickableRegion, 0));
			bufferRegions.push(new ActionRegion("Bad", bufferTime / 3, 0.3));
			bufferRegions.push(new ActionRegion("Good", bufferTime / 3, 0.6));
			bufferRegions.push(new ActionRegion("Excellent", bufferTime / 3, 1));
			bufferRegions.push(new ActionRegion("Excellent", bufferTime / 3, 1));
			bufferRegions.push(new ActionRegion("Good", bufferTime / 3, 0.6));
			bufferRegions.push(new ActionRegion("Bad", bufferTime / 3, 0.3));
			bufferRegions.push(new ActionRegion("Miss", 0, 0));
			
			activeRegionIndex = 0;
			bufferTimer = new Timer(bufferRegions[activeRegionIndex].getTimeBeforeNext(), 1);
			bufferTimer.addEventListener( TimerEvent.TIMER_COMPLETE, updateBufferRegion);
		}
		
		public function beginDrawing():void
		{
			drawApproachCircle();
			actionTimer.start();
			bufferTimer.start();
		}

		private function drawApproachCircle():void
		{
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
			super.visible = false;
			actionTimer.stop();
		}

		public function updateBufferRegion(timerEvent:TimerEvent):void
		{
			if (activeRegionIndex < bufferRegions.length - 1)
			{
				activeRegionIndex++;
				bufferTimer.stop();
				bufferTimer = new Timer(bufferRegions[activeRegionIndex].getTimeBeforeNext(), 1);
				bufferTimer.addEventListener( TimerEvent.TIMER_COMPLETE, updateBufferRegion);
				bufferTimer.start();
			}
		}

		public function handleClick(mouseEvent:MouseEvent):void
		{
			modifier = bufferRegions[activeRegionIndex].getModifier();
		}
	}
}