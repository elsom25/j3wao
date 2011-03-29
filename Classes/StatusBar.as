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

		public function StatusBar(posX:int, posY:int, val:Number, isLarge:Boolean) {
			maxVal = val;
			curVal = val;
			x = posX;
			y = posY;
			
			bar = new Sprite();

			bar.graphics.beginFill(0xFF0000);
			bar.graphics.lineStyle(2);
			if (isLarge) {
				bar.graphics.drawRect(x,y,450*curVal/maxVal,50);
			} else {
				bar.graphics.drawRect(x,y,225*curVal/maxVal,25);
			}
			bar.graphics.endFill();
			bar.mouseEnabled = false;
			addChild(bar);
		}
		

	}
	
}
