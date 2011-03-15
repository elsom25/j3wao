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
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.events.IOErrorEvent;
	import flash.events.Event;

	/*An Action is an abstract class representing a single interactive part of an attack (like a tap).*/
	public class Action extends MovieClip
	{
		public static const MILLISECONDS_PER_SECOND:Number = 1000;
		
		public static const MISSED_ACTION:String = "missedaction";
		
		public static const HIT_ACTION:String = "hitaction";

		/*Used to determine long this action is on screen. When this time ticks, we undraw the action*/
		protected var actionTimer:Timer; 
		/*The approachTime is an option that indicates how long it takes the approach circle to hit the outer edge of the 
		actual tap circle.*/
		protected var approachTime:Number;
		/*The bufferTime is the amount of time that clicks are accepted outside of the ideal moment of hitting.
		The bufferTime is the time for only one end of the ideal moment(before or after the ideal hit time)*/
		protected var bufferTime:Number;

		/*Using the bufferTime, we break the Action into several ActionRegions. These regions are used to determine how 
		well the user interacted with this Action. Buffers closer to the ideal hit moment carry a higher damage modifer.*/
		protected var bufferRegions:Array;
		protected var activeRegionIndex:Number;
		/*We use bufferTimer to indicate when to transition into the next buffer.*/
		protected var bufferTimer:Timer;

		/*This bufferToProcess is set when the user interacts with the action. It is the active region when the click was processed.
		  It is set to "Miss" by default, so if no click occurs, this value will still hold "Miss"*/
		private var bufferToProcess:ActionRegion;
		
		/*This is to return the result of an action to the attack for damage calculation*/
		private var damageAccuracy:Number;
		private var damageAmount:Number;

		/*NOTE: The ideal hit time is at the exact moment when the approach circles close. This means that the ideal hit moment is
		equal to approachTime milliseconds after the start of the Action*/

		public function Action(approachTime:Number, bufferTime:Number, hitDamage:Number)
		{
			this.approachTime = approachTime / MILLISECONDS_PER_SECOND;
			this.bufferTime = bufferTime;

			initializeActionTimer();
			initializeBufferRegions();

			addEventListener(MouseEvent.CLICK, handleClick);
			damageAccuracy = -1;
			damageAmount = hitDamage;
		}

		private function initializeActionTimer():void
		{
			var millisecondsUntilCompletion:Number = approachTime * MILLISECONDS_PER_SECOND + bufferTime;
			actionTimer = new Timer(millisecondsUntilCompletion,1);
			actionTimer.addEventListener( TimerEvent.TIMER_COMPLETE, removeOnTimer );
		}

		private function initializeBufferRegions():void
		{
			const startOfClickableRegion = (approachTime * MILLISECONDS_PER_SECOND) - bufferTime;

			bufferRegions = new Array();
			bufferRegions.push(new ActionRegion("Miss", startOfClickableRegion, 0));
			bufferRegions.push(new ActionRegion("Bad", bufferTime / 3, 0.3));
			bufferRegions.push(new ActionRegion("Good", bufferTime / 3, 0.6));
			bufferRegions.push(new ActionRegion("Excellent", bufferTime / 3, 1));
			bufferRegions.push(new ActionRegion("Excellent", bufferTime / 3, 1));
			bufferRegions.push(new ActionRegion("Good", bufferTime / 3, 0.6));
			bufferRegions.push(new ActionRegion("Bad", bufferTime / 3, 0.3));

			activeRegionIndex = 0;
			bufferToProcess = bufferRegions[activeRegionIndex];
			
			bufferTimer = new Timer(bufferRegions[activeRegionIndex].getTimeBeforeNext(),1);
			bufferTimer.addEventListener( TimerEvent.TIMER_COMPLETE, updateBufferRegion);
		}

		public function getApproachTime():Number
		{
			return approachTime;
		}

		public function beginDrawing():void
		{
			drawApproachCircle();
			actionTimer.start();
			bufferTimer.start();
		}

		private function drawApproachCircle():void
		{
			var circle:Sprite = new Sprite();

			circle.graphics.beginFill(0xFFFFFF, 0);
			circle.graphics.lineStyle(5);
			circle.graphics.drawCircle(0,0,260);
			circle.graphics.endFill();
			
			circle.mouseEnabled = false;
			
			addChild(circle);

			var heightTween:Tween = new Tween(circle, "scaleX", None.easeIn, 1, 0.5, approachTime, true);
			var widthTween:Tween = new Tween(circle, "scaleY", None.easeIn, 1, 0.5, approachTime, true);
			heightTween.start();
			widthTween.start();
		}
		
		public function remove():void
		{
			undraw();
		}
		
		/*
		Removes this action as a result of its time running out.
		*/
		private function removeOnTimer(timerEvent:TimerEvent):void
		{
			processActiveBuffer();
		}

		private function undraw():void
		{
			super.visible = false;
			actionTimer.stop();
		}
		
		/*
		Called whenever the user clicks an action or misses their chance to do so, and fires an event to
		cancel the attack if necessary.
		*/
		private function processActiveBuffer():void
		{
			if (bufferToProcess.getModifier() == 0) {
				dispatchEvent(new Event(MISSED_ACTION));
			}
			else
			{
				damageAccuracy = bufferToProcess.getModifier();
				dispatchEvent(new Event(HIT_ACTION));
			}
			trace(bufferToProcess.getName() + " (modifier: " + bufferToProcess.getModifier() + ")");
			undraw();
		}
		
		public function returnHitDamage():Number
		{
			var answer:Number = -1;
			if (damageAccuracy != -1){
				answer = damageAccuracy * damageAmount;
			}
			trace ("Action damage is " + answer);
			return answer;
		}
		
		public function updateBufferRegion(timerEvent:TimerEvent):void
		{
			if (activeRegionIndex < bufferRegions.length - 1)
			{
				activeRegionIndex++;
				bufferTimer.stop();
				bufferTimer = new Timer(bufferRegions[activeRegionIndex].getTimeBeforeNext(),1);
				bufferTimer.addEventListener( TimerEvent.TIMER_COMPLETE, updateBufferRegion);
				bufferTimer.start();
			}
		}
		
		public function handleClick(mouseEvent:MouseEvent):void
		{
			[Embed(source="../normal-hitnormal.mp3")]
			var soundClass:Class;
			var sound:Sound = new soundClass() as Sound;
			sound.play();
			/*
			var mySound:Sound = new Sound();
			mySound.load(new URLRequest("normal-hitnormal.mp3"));
			mySound.play();
			*/
			bufferToProcess = bufferRegions[activeRegionIndex];
			processActiveBuffer();
		}
	}
}