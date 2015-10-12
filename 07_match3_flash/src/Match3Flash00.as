package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(width="800",height="600", backgroundColor="#999999", frameRate="30")]
	public class Match3Flash00 extends Sprite
	{
		public function Match3Flash00()
		{
			addEventListener(Event.ENTER_FRAME, draw);
			
			
			//DO YOUR SETUP CODE HERE
		}
		
		
		public function draw(event:Event):void
		{
			//DO YOUR DRAWING CODE HERE		
		}
	}
}