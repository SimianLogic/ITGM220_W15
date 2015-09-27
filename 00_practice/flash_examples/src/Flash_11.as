package
{
	import flash.display.Sprite;
	import flash.events.*;  //we need the events package to hook into the enterFrame event
	
	[SWF(width="800",height="600", backgroundColor="#0000ff")]
	public class Flash_11 extends Sprite
	{
		public function Flash_11()
		{
			super();
			
			trace("our main class constructor is the equivalent of Processing's setup");
			
			addEventListener(Event.ENTER_FRAME, draw);
		}
		
		public function draw(event:Event):void
		{
			trace("we hook on to the enterFrame event to get a method every frame");
		}
	}
}