package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	[SWF(width="800",height="600", backgroundColor="#999999")]
	public class Flash_18 extends Sprite
	{
		public var startDragX:Number = -1;
		public var startDragY:Number = -1;
		
		public var radius:Number = Number.NaN;
		public var isDragging:Boolean = false;
		
		public function Flash_18()
		{
			super();
			
			stage.addEventListener(Event.ENTER_FRAME, draw);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, mousePressed);
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseReleased);
		}
		
		public function draw(event:Event):void
		{
			graphics.clear();
			
			if(startDragX >= 0)
			{
				graphics.beginFill(0xffffff);
				graphics.drawCircle(startDragX, startDragY, radius);
			}
			
			if(isDragging)
			{
				var dx:Number = stage.mouseX - startDragX;
				var dy:Number = stage.mouseY - startDragY;
				
				radius = Math.sqrt(dx*dx + dy*dy);
			}
		}
		
		public function mousePressed(event:MouseEvent):void
		{
			startDragX = stage.mouseX;
			startDragY = stage.mouseY;
			isDragging = true;
			radius = 0;
		}
		
		public function mouseReleased(mouseReleased:MouseEvent):void
		{
			isDragging = false;
		}
	}
}