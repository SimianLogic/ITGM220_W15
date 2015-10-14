package
{
	import flash.display.Bitmap;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.utils.setTimeout;
	
	public class MatchScreen extends Sprite
	{
		[Embed(source="web_images/background.png")] public var backgroundGraphic:Class;
		[Embed(source="web_images/score_window.png")] public var scoreWindowGraphic:Class;
		[Embed(source="my_images/close_button.png")] public var closeButtonGraphic:Class;
		
		[Embed(source="web_images/field_dark.png")] public var fieldDarkGraphic:Class;
		[Embed(source="web_images/field_bright.png")] public var fieldBrightGraphic:Class;
		
		public var closeButton:SimpleButton;
		public var scoreLabel:TextField;
		
		public var gems:Array = [];
		public var score:int = 0;
		
		public var clearedThisTurn:int = 0;
		
		
		
		//magic numbers -- just guess & checked these
		var tileWidth:Number = 115;
		var tileHeight:Number = 115;
		
		//use arithmetic to center all this
		var totalWidth:Number = 5*tileWidth;
		var startX:Number = (640 - totalWidth)/2;
		
		var startY:Number = 160;
		
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
			
			
			for(var i:int = 0; i < 5; i++)
			{
				for(var j:int = 0; j < 6; j++)
				{
					//same logic as our checkerboard!
					if((i + j) %2 == 0)
					{
						var dark:Bitmap = new fieldDarkGraphic();
						
						dark.x = startX + i*tileWidth;
						dark.y = startY + j*tileHeight;
						dark.width = tileWidth;
						dark.height= tileHeight;
						
						addChild(dark);
					}else{
						var bright:Bitmap = new fieldBrightGraphic();
						
						bright.x = startX + i*tileWidth;
						bright.y = startY + j*tileHeight;
						bright.width = tileWidth;
						bright.height= tileHeight;
						
						addChild(bright);
					}
					
					//get a random int from 0 to 9 (first 10 items in our jewel list)
					var which_gem:int = Math.floor(Math.random()*10);
					
					var gem:GemButton = new GemButton(which_gem, i, j);
					gem.x = startX + i*tileWidth + (tileWidth-gem.width)/2;
					gem.y = startY + j*tileHeight + (tileWidth-gem.height)/2;
					addChild(gem);
					
					gem.addEventListener(MouseEvent.CLICK, handleGemClick);
					gem.name = i + "_" + j;
					
					gems.push(gem);
				}
			}	
		}
		
		public function handleGemClick(event:MouseEvent):void
		{
			var gem:GemButton = event.target as GemButton;
			trace("CLICKED ON " + gem.name);
			
			clearedThisTurn = 0;
			clearGemAndNeighbors(gem);
			
			score += clearedThisTurn*clearedThisTurn;
			scoreLabel.text = "" + score;
			
			//run refillGems after 1000 milliseconds
			setTimeout(refillGems, 1000);
		}
		
		public function clearGemAndNeighbors(gem:GemButton):void
		{
			var gem_index:int = gems.indexOf(gem);
			if(gem_index >= 0)
			{
				gems.splice(gem_index,1);
				removeChild(gem);
			}
			
			clearedThisTurn += 1;
			
			
			//you shouldn't modify the contents of an array while you're 
			//going through it, so we need to save the "dead" gems for after
			var dead_gems:Array = [];
			
			for each(var board_gem:GemButton in gems)
			{
				if(board_gem.value == gem.value)
				{
					//same row
					if(gem.gridX == board_gem.gridX)
					{
						//check above & below
						if(gem.gridY == board_gem.gridY + 1 || gem.gridY == board_gem.gridY - 1)
						{
							dead_gems.push(board_gem);
						}
					}else if(gem.gridY == board_gem.gridY){
						//check left & right
						if(gem.gridX == board_gem.gridX + 1 || gem.gridX == board_gem.gridX - 1)
						{
							dead_gems.push(board_gem);
						}
					}
				}
			}
			
			//if we didn't pick up any new dead gems, this will be empty and nothing will happen!
			for each(var deader:GemButton in dead_gems)
			{
				clearGemAndNeighbors(deader);
			}
			
		}
		
		public function refillGems():void
		{
			for(var i:int = 0; i < 5; i++)
			{
				for(var j:int = 0; j < 6; j++)
				{
					var got_one:Boolean = false;
					for each(var gem:GemButton in gems)
					{
						if(gem.gridX == i && gem.gridY == j)
						{
							got_one = true;
						}
					}
					
					if(!got_one)
					{
						trace("ADD A NEW GEM AT " + i + "," + j);
						var which_gem:int = Math.floor(Math.random()*10);
						
						var new_gem:GemButton = new GemButton(which_gem, i, j);
						new_gem.x = startX + i*tileWidth + (tileWidth-new_gem.width)/2;
						new_gem.y = startY + j*tileHeight + (tileWidth-new_gem.height)/2;
						addChild(new_gem);
						
						new_gem.addEventListener(MouseEvent.CLICK, handleGemClick);
						new_gem.name = i + "_" + j;
						
						gems.push(new_gem);
					}
					
				}
			}
		}
		
		
	}
}