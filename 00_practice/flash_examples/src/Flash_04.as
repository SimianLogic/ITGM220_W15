package
{
	import flash.display.Sprite;
	
	public class Flash_04 extends Sprite
	{
		public function Flash_04()
		{
			super();
			
			var my_bool:Boolean = true;
			var string1:String = "test1";
			var string2:String = "test2";
			
			if(my_bool)
			{
				trace(string1);
			}else{
				trace(string2);
			}
		}
	}
}