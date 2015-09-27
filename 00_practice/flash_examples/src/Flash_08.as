package
{
	import flash.display.Sprite;
	
	public class Flash_08 extends Sprite
	{
		public function Flash_08()
		{
			super();
			
			var int_array:Array = new Array(10);
			for(var i:int = 0; i < 10; i++)
			{
				int_array[i] = i;
			}
			trace(int_array);
			
			//in Flash you can also just push onto the back
			var int_array2:Array = new Array();
			for(var j:int = 0; j < 10; j++)
			{
				int_array2.push(j);
			}
			trace(int_array2);
		}
	}
}