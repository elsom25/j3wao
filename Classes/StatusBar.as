package  {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import fl.motion.Color;
	
	/* Represents a single bar that updates to give a visual display of a value.
	Handles standard number bars (health and mana) in two sizes for both players and enemies. */
	public class StatusBar extends MovieClip {
		
		// 0 <= curVal <= maxVal
		public var maxVal:Number;
		public var curVal:Number;
		private var bar:Sprite;
		public var bgColor:Color;
		public var large:Boolean;

		public function StatusBar(posX:int, posY:int, val:Number, isLarge:Boolean) {
			maxVal = val;
			curVal = val;
			x = posX;
			y = posY;
			large = isLarge;
			
			updateBar(maxVal);
		}
		
		public function updateBar(newVal:Number) {
			curVal = newVal;
			var perc:Number = curVal/maxVal;
			bar = new Sprite();

			bar.graphics.beginFill(0xFF0000);
			bar.graphics.lineStyle(0);
			if (large) {
				bar.graphics.drawRect(x,y,450*perc,50);
			} else {
				bar.graphics.drawRect(x,y,225*perc,25);
			}
			bar.graphics.endFill();
			
			bar.graphics.beginFill(0x000000);
			if (large) {
				bar.graphics.drawRect(x+450*perc,y,450-450*perc,50);
			} else {
				bar.graphics.drawRect(x+225*perc,y,225-225*perc,25);
			}
			
			
			bar.graphics.endFill();
			bar.mouseEnabled = false;
			addChild(bar);
		}
		

	}
	
}
