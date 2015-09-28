package
{
	import flash.display.*;
	import flash.events.*;
	import flash.net.URLRequest;

  //we need the events package to hook into the enterFrame event
	
	
	[SWF(width="800",height="600", backgroundColor="#999999")]
	public class FlashChess extends Sprite
	{
		
		public var menuScreen:GameScreen;
		public var boardScreen:BoardScreen;
		
		//Flash doesn't run through a central run loop by default, so 
		//we don't need a current screen to pass events. each screen
		//can hook into the events it needs with EventListeners
//		public var currentScreen:GameScreen;
		
		
		public function FlashChess()
		{
			super();
			
			menuScreen = new GameScreen("ui/chess_menu.png");
			addChild(menuScreen);
			
			var start_up:Loader = new Loader();
			start_up.load(new URLRequest("ui/start_up.png"));
			
			var start_over:Loader = new Loader();
			start_over.load(new URLRequest("ui/start_over.png"));
			
			var start_down:Loader = new Loader();
			start_down.load(new URLRequest("ui/start_down.png"));
			
			var button:SimpleButton = new SimpleButton(start_up, start_over, start_down, start_up);
			menuScreen.addChild(button);
			button.x = 250;
			button.y = 250;
			
			button.addEventListener(MouseEvent.CLICK, handleStart);
			
			
			boardScreen = new BoardScreen();
			boardScreen.addEventListener("gameplay_exit", handleExit);
		}
		
		public function handleStart(event:MouseEvent):void
		{
			trace("START");
			addChild(boardScreen);
			removeChild(menuScreen);
		}
		
		public function handleExit(event:Event):void
		{
			trace("EXIT");
			addChild(menuScreen);
			removeChild(boardScreen);
		}
	}
}