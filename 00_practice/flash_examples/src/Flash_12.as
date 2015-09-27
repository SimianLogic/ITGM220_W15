package
{
	import flash.display.Sprite;
	import flash.events.*;  //we need the events package to hook into the enterFrame event
	
	
	[SWF(width="800",height="600", backgroundColor="#999999")]
	public class Flash_12 extends Sprite
	{
		public function Flash_12()
		{
			super();
			
			addEventListener(Event.ENTER_FRAME, draw);
		}
		
		public function draw(event:Event):void
		{
			graphics.beginFill(0x0000ff);	
			graphics.drawRect(stage.mouseX - 10, stage.mouseY - 10, 20, 20);
		}
	}
}