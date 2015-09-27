package
{
	import flash.display.Sprite;
	import flash.events.*;  //we need the events package to hook into the enterFrame event
	
	
	[SWF(width="800",height="600", backgroundColor="#999999")]
	public class Flash_14 extends Sprite
	{
		public var isMouseDown:Boolean = false;
		
		public function Flash_14()
		{
			super();
			
			addEventListener(Event.ENTER_FRAME, draw);
			
			stage.addEventListener(MouseEvent.MOUSE_DOWN, mousePressed);
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseReleased);
		}
		
		public function mousePressed(event:MouseEvent):void
		{
			isMouseDown = true;
		}
		
		public function mouseReleased(event:MouseEvent):void
		{
			isMouseDown = false;	
		}
		
		public function draw(event:Event):void
		{
			graphics.clear();
			
			if(isMouseDown)
			{
				graphics.beginFill(0xff0000);	
			}else{
				graphics.beginFill(0x0000ff);				
			}
			
			graphics.drawRect(stage.mouseX - 10, stage.mouseY - 10, 20, 20);
		}
	}
}