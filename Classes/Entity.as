package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	//An Entity is something that has a presence during battle, such as the player and enemy
	public class Entity extends MovieClip {
		
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
		
		
		
		
	}
}