package
{
	import flash.display.Bitmap;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	public class StartScreen extends Sprite
	{
		[Embed(source="web_images/background.png")] public var backgroundGraphic:Class;
		[Embed(source="my_images/logo.png")] public var logoGraphic:Class;
		
		[Embed(source="my_images/start_up.png")] public var startUpGraphic:Class;
		[Embed(source="my_images/start_over.png")] public var startOverGraphic:Class;
		[Embed(source="my_images/start_down.png")] public var startDownGraphic:Class;
		
		
		public var startButton:SimpleButton;
		
		public var highScore:int = 0;
		public var highScoreLabel:TextField;
		
		public function StartScreen()
		{
			super();
			
			var bg:Bitmap = new backgroundGraphic();
			var logo:Bitmap = new logoGraphic();
			
			addChild(bg);
			addChild(logo);
			
			var up:Bitmap = new startUpGraphic();
			var over:Bitmap = new startOverGraphic();
			var down:Bitmap = new startDownGraphic();
			
			startButton = new SimpleButton(up, over, down, up);
			addChild(startButton);
			
			logo.x = (bg.width - logo.width)/2;
			logo.y = 200;
			
			startButton.x = (bg.width - startButton.width)/2;
			startButton.y = (bg.height - startButton.height)/2;
			
			var tf:TextFormat = new TextFormat(null, 64, 0xffffff, false, false, false, "", "", TextFormatAlign.CENTER);
			highScoreLabel = new TextField();
			highScoreLabel.defaultTextFormat = tf;
			highScoreLabel.height = 80;
			highScoreLabel.width = 640;
			
			highScoreLabel.x = 0;
			highScoreLabel.y = 550;
			highScoreLabel.text = "000";
			
			addChild(highScoreLabel);
			
		}
	}
}