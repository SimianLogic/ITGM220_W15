package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(width="800",height="600", backgroundColor="#999999", frameRate="12")]
	public class Flash_20 extends Sprite
	{
		
		public var tiles:Array = [];
		
		public function Flash_20()
		{
			super();
			
			
			for(var i:int = 0; i < 4; i++)
			{
				tiles[i] = [];
				for(var j:int = 0; j < 4; j++)
				{
					tiles[i].push(getRandomBoolean());
				}
			}
			
			stage.addEventListener(Event.ENTER_FRAME, draw);
		}
		
		public function draw(event:Event):void
		{
			graphics.clear();
			
			for(var i:int = 0; i < 4; i++)
			{
				for(var j:int = 0; j < 4; j++)
				{
					tiles[i][j] = getRandomBoolean();
					
					if(tiles[i][j])
					{
						graphics.beginFill(0xffffff);
					}else{
						graphics.beginFill(0x000000);
					}
					graphics.drawRect(200*i, 150*j, 200, 150);
				}
			}
		}
		
		public function getRandomBoolean():Boolean
		{
			if(Math.random() > 0.5)
			{
				return true;
			}
			
			return false;
		}
	}
}