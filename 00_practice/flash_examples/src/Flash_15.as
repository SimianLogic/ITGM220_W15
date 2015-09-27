package
{
	import flash.display.Sprite;
	import flash.events.*;  //we need the events package to hook into the enterFrame event
	
	
	[SWF(width="800",height="600", backgroundColor="#999999")]
	public class Flash_15 extends Sprite
	{
		public function Flash_15()
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
			graphics.beginFill(0x0000ff);	
			graphics.drawRect(stage.mouseX - 10, 0, 20, 600);
		}
	}
}