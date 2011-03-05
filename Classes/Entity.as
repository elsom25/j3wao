package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	//An Entity is something that has a presence during battle, such as the player and enemy
	public class Entity extends MovieClip {
		
		//The set of sprites for animation for this entity
		//Note - the last sprite in the array should be the entity-death sprite
		protected var spriteSet:Array;
		//Number to enumerate through the spriteSet
		protected var curSprite:int;
		
		//HP values for the entity
		protected var maxHP:int;
		protected var curHP:int;
		
		//MP values for the entity
		protected var maxMP:int;
		protected var curMP:int;
		
		public function Entity(positionX:int, positionY:int, totalHP:int, totalMP:int) {
			x = positionX;
			y = positionY;
			maxHP = totalHP;
			curHP = totalHP;
			maxMP = totalMP;
			curMP = totalMP;
		}
		
		//Function that does damage to the entity and returns the modified HP value
		public function takeDamage(damage:int):int {
			curHP = curHP - damage;
			
			//If dead, set the sprite to be the entity-death sprite
			if (curHP <= 0) {
				curSprite = spriteSet.length - 1;
			}
			return curHP;
		}
		
		//Function that decreases entity MP and returns the modified MP value
		public function spendMP(drain:int):int {
			curMP = curMP - drain;
			
			if (curMP <= 0) {
				
			}
			return curMP;
		}
		
		//Function that heals the entity and returns the modified HP value
		public function heal(healValue:int):int {
			if (curHP > 0) {
				curHP = curHP + heal;
			}
			return curHP;
		}
		
		//Function that heals the entity's MP and returns the modified MP value
		public function improveMP(healValue:int):int {
			if (curMP > 0) {
				curMP = curMP + heal;
			}
			return curMP;
		}
		
		public function getMP():int {
			return curMP;			
		}
		
		//Function to check if entity is dead
		public function isDead():Boolean {
			if (curHP < 0) {
				return true;
			}
			return false;
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
	}
}