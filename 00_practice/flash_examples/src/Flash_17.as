package
{
	import flash.display.Sprite;
	import flash.events.Event;  //we need the events package to hook into the enterFrame event
	
	
	[SWF(width="800",height="600", backgroundColor="#999999")]
	public class Flash_17 extends Sprite
	{
		public var minX:Number = 300;
		public var maxX:Number = 500;
		
		public var columnWidth:Number = 50;
		
		public function Flash_17()
		{
			super();
			
			addEventListener(Event.ENTER_FRAME, draw);
		}
		
		public function draw(event:Event):void
		{
			drawColumn();
		}
		
		public function drawColumn():void
		{
			graphics.clear();
			if(stage.mouseX > minX && stage.mouseX < maxX)
			{
				graphics.beginFill(0xff0000);
			}else{
				graphics.beginFill(0x0000ff);
			}
			
			var which_column:int = Math.floor(stage.mouseX / columnWidth);
			
			graphics.drawRect(which_column*columnWidth, 0, columnWidth, 600);
		}
	}
}
import flash.events.Event;

