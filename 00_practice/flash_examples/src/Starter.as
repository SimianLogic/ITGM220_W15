package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	[SWF(width="800",height="600", backgroundColor="#999999", frameRate="30")]
	public class Starter extends Sprite
	{
		
		public function Starter()
		{
			super();
			
			
			//if you need clicks, uncomment this line and create a handleClick function
			//stage.addEventListener(MouseEvent.CLICK, handleClick);
			
			//if you need mouseUp events, uncomment this line and create a handleMouseUp function
			//stage.addEventListener(MouseEvent.MOUSE_UP, handleMouseUp);
			
			//if you need clicks, uncomment this line and create a handleMouseDown function
			//stage.addEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
			
			//if you need a draw loop, uncomment this line and create a draw function
			//stage.addEventListener(Event.ENTER_FRAME, draw);
		}
		
		//an example of a draw handler (that takes a regular event)
		public function draw(event:Event):void
		{
		}
		
		//an example of a mouse handler (that takes a mouse event)
		public function handleMouseDown(event:MouseEvent):void
		{
			
		}
		
		
		
	}
}