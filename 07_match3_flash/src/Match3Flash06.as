package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	[SWF(width="640",height="960", backgroundColor="#999999", frameRate="30")]
	public class Match3Flash06 extends Sprite
	{
		
		public var startScreen:StartScreen;
		public var matchScreen:MatchScreen06;
		
		
		public var highScore:int = 0;
		
		public function Match3Flash06()
		{
			addEventListener(Event.ENTER_FRAME, draw);
			
			
			//DO YOUR SETUP CODE HERE
			
			startScreen = new StartScreen();
			matchScreen = new MatchScreen06();
			
			addChild(startScreen);
			startScreen.startButton.addEventListener(MouseEvent.CLICK, handleStartButton)
			
			
			matchScreen.closeButton.addEventListener(MouseEvent.CLICK, handleExitButton);
		}
		
		public function handleStartButton(event:MouseEvent):void
		{
			removeChild(startScreen);
			
			matchScreen = new MatchScreen06();
			matchScreen.closeButton.addEventListener(MouseEvent.CLICK, handleExitButton);
			
			addChild(matchScreen);
		}
		
		public function handleExitButton(event:MouseEvent):void
		{
			removeChild(matchScreen);
			addChild(startScreen);
		}
		
		public function draw(event:Event):void
		{
			//DO YOUR DRAWING CODE HERE
			
			highScore = Math.max(matchScreen.gameScore, highScore);
			startScreen.highScoreLabel.text = "" + highScore;
		}
	}
}