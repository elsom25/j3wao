package  {
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class SoundController extends MovieClip {
		public var beatTimer:Timer;
		public var BPM:Number;
		
		public static const BPM_BEAT:String = "BPMBeat";
		

		public function SoundController(beatsPerMinute:Number) {
			BPM = beatsPerMinute;
			
			const SECONDS_PER_MINUTE:Number = 60;
			const MILLISECONDS_PER_SECOND = 1000;
			
			var minutes = 1 / beatsPerMinute;
			var seconds = minutes * SECONDS_PER_MINUTE;
			var milliseconds = seconds * MILLISECONDS_PER_SECOND;
			
			beatTimer = new Timer(milliseconds);
			beatTimer.addEventListener( TimerEvent.TIMER, timerBeat );
			beatTimer.start();
		}
		
		public function timerBeat(no:TimerEvent) {
			[Embed(source="../tick3.mp3")]
			var soundClass:Class;
			var sound:Sound = new soundClass() as Sound;
			sound.play();
			dispatchEvent(new Event(BPM_BEAT));
		}
		
		

	}
	
}
