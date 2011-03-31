package  {
	
	import flash.display.Sprite;
	
	public class Enemy extends Entity {
		//The set of sprites for animation for this enemy
		//Note - the last sprite in the array should be the enemy-death sprite
		protected var spriteSet:Array;
		//Number to enumerate through the spriteSet
		protected var curSprite:int;

		public function Enemy(positionX:int, positionY:int, totalHP:int, totalMP:int) {
			super(positionX, positionY, totalHP, totalMP);
			//statusBar = new StatusBar(0, 0, totalHP, false);
			//addChild(statusBar);
		}
		
		public override function takeDamage(damage:int):int
		{
			super.takeDamage(damage);
			//If dead, set the sprite to be the entity-death sprite
			if (curHP <= 0) {
				curSprite = spriteSet.length - 1;
			}
			return curHP;
		}
		
		//Returns the current sprite to show onscreen
		//NOTE - This does NOT advance the sprite counter - that must be done with setNextSprite()
		public function getSprite():Sprite {
			return spriteSet.get(curSprite);
		}
		
		//Advance the sprite counter in the animation
		public function setNextSprite():void {
			//If right before the death sprite, return to beginning of animation loop
			if (curSprite == spriteSet.length - 2) {
				curSprite = 0;
			} else {
				curSprite = curSprite + 1;
			}
		}
		
		public function setSpriteArray(spriteArray:Array):void
		{
			spriteSet = spriteArray;
		}

	}
	
}
