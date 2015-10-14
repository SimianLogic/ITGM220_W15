package
{
	import flash.display.Bitmap;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	public class MatchScreen extends Sprite
	{
		[Embed(source="web_images/background.png")] public var backgroundGraphic:Class;
		[Embed(source="web_images/score_window.png")] public var scoreWindowGraphic:Class;
		[Embed(source="my_images/close_button.png")] public var closeButtonGraphic:Class;
		
		[Embed(source="web_images/field_dark.png")] public var fieldDarkGraphic:Class;
		[Embed(source="web_images/field_bright.png")] public var fieldBrightGraphic:Class;
		
		[Embed(source="web_images/jewel1.png")] public var jewel1:Class;
		[Embed(source="web_images/jewel2.png")] public var jewel2:Class;
		[Embed(source="web_images/jewel3.png")] public var jewel3:Class;
		[Embed(source="web_images/jewel4.png")] public var jewel4:Class;
		[Embed(source="web_images/jewel5.png")] public var jewel5:Class;
		[Embed(source="web_images/jewel6.png")] public var jewel6:Class;
		[Embed(source="web_images/jewel7.png")] public var jewel7:Class;
		[Embed(source="web_images/jewel8.png")] public var jewel8:Class;
		[Embed(source="web_images/jewel9.png")] public var jewel9:Class;
		[Embed(source="web_images/jewel10.png")] public var jewel10:Class;
		[Embed(source="web_images/jewel11.png")] public var jewel11:Class;
		[Embed(source="web_images/jewel12.png")] public var jewel12:Class;
		
		public var jewelList:Array = [ jewel1, jewel2, jewel3, jewel4,
				jewel5, jewel6,jewel7, jewel8,
				jewel9, jewel10, jewel11, jewel12
			];
		
		public var closeButton:SimpleButton;
		public var scoreLabel:TextField;
		public function MatchScreen()
		{
			super();
			
			var bg:Bitmap = new backgroundGraphic();
			var score_box:Bitmap = new scoreWindowGraphic();
			
			addChild(bg);
			addChild(score_box);
			
			var close_up:Bitmap = new closeButtonGraphic();
			var close_over:Bitmap = new closeButtonGraphic();
			var close_down:Bitmap = new closeButtonGraphic();
			
			close_over.x -= 3;
			close_over.y -= 3;
			
			close_down.x += 3;
			close_down.y += 3;
			
			closeButton = new SimpleButton(close_up, close_over, close_down, close_up);
			addChild(closeButton);
			
			closeButton.x = bg.width - close_up.width - 10;
			closeButton.y = 10;
			
			score_box.x = 25;
			score_box.y = 20;
			
			
			var tf:TextFormat = new TextFormat(null, 64, 0x000000, false, false, false, "", "", TextFormatAlign.CENTER);
			scoreLabel = new TextField();
			scoreLabel.defaultTextFormat = tf;
			scoreLabel.height = 80;
			scoreLabel.width = 250;
			
			scoreLabel.x = 45;
			scoreLabel.y = 70;
			scoreLabel.text = "000";
			
			
			addChild(scoreLabel);
			
			
			
			//magic numbers -- just guess & checked these
			var tile_width:Number = 115;
			var tile_height:Number = 115;
			
			//use arithmetic to center all this
			var total_width:Number = 5*tile_width;
			var start_x:Number = (640 - total_width)/2;
			
			var start_y:Number = 160;
			
			for(var i:int = 0; i < 5; i++)
			{
				for(var j:int = 0; j < 6; j++)
				{
					//same logic as our checkerboard!
					if((i + j) %2 == 0)
					{
						var dark:Bitmap = new fieldDarkGraphic();
						
						dark.x = start_x + i*tile_width;
						dark.y = start_y + j*tile_height;
						dark.width = tile_width;
						dark.height= tile_height;
						
						addChild(dark);
					}else{
						var bright:Bitmap = new fieldBrightGraphic();
						
						bright.x = start_x + i*tile_width;
						bright.y = start_y + j*tile_height;
						bright.width = tile_width;
						bright.height= tile_height;
						
						addChild(bright);
					}
					
					//get a random int from 0 to 9 (first 10 items in our jewel list)
					var which_gem:int = Math.floor(Math.random()*10);
					
					//the contents of jewelList are classes... so here we're instantiating 
					// one of the objects (Classes) in the list. looks weird but it works!
					var up:Bitmap = new jewelList[which_gem]();
					var over:Bitmap = new jewelList[which_gem]();
					var down:Bitmap = new jewelList[which_gem]();
					
					over.width = 105;
					over.height = 105;
					
					down.width = 95;
					down.height = 95;
					
					var gem:SimpleButton = new SimpleButton(up, over, down, up);
					gem.x = start_x + i*tile_width + (tile_width-up.width)/2;
					gem.y = start_y + j*tile_height + (tile_width-up.height)/2;
					addChild(gem);
					
					gem.addEventListener(MouseEvent.CLICK, handleGemClick);
					gem.name = i + "_" + j;
					
				}
			}	
		}
		
		public function handleGemClick(event:MouseEvent):void
		{
			var gem:SimpleButton = event.target as SimpleButton;
			trace("CLICKED ON " + gem.name);
			
			removeChild(gem);
		}
	}
}