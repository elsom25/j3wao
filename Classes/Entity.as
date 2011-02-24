package {
	import flash.display.MovieClip;
	
	//An Entity is something that has a presence during battle, such as the player and enemy
	public class Entity extends MovieClip {
		
		//The set of sprites for animation for this entity
		protected var spriteSet:Array;
		//Number to enumerate through the spriteSet
		protected var curSprite:int;
		
		//HP values for the entity
		protected var maxHP:int;
		protected var curHP:int;
		
		public function Entity(positionX:int, positionY:int, totalHP:int) {
			x = positionX;
			y = positionY;
			maxHP = totalHP;
			curHP = totalHP;
		}
		
		//Function that does damage to the entity and returns the modified HP value
		public function takeDamage(damage:int):int {
			curHP = curHP - damage;
			return curHP;
		}
		
		//Function that heals the entity and returns the modified HP value
		public function heal(healValue:int):int {
			if (curHP > 0) {
				curHP = curHP + heal;
			}
			return curHP;
		}
		
		//Function to check if entity is dead
		public function isDead():Boolean {
			if (curHP < 0) {
				return true;
			}
			return false;
		}
		
		
	}
}