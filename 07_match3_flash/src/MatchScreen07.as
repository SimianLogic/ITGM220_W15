package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	
	public class MatchScreen07 extends MatchScreen
	{
		public var COLUMNS:int = 5;
		public var ROWS:int = 6;
		
		public var boardWidth:Number;
		public var boardHeight:Number;
		
		public var tileWidth:Number;
		public var tileHeight:Number;
		
		public var padding:Number = 10;
		
		public var gemList:Array;
		public var gemAssets:Array;
		
		public var gameScore:int;
		public var clearedThisTurn:int = 0;
		
		public function MatchScreen07()
		{
			super();
			
			gemList = [];
			gemAssets = [new jewel1(), new jewel2(), new jewel3(), new jewel4(),
				new jewel5(), new jewel6(), new jewel7(), new jewel8(),
				new jewel9(), new jewel10()
			];
			
			//backgroundGrid is defined in our UI file for this screen
			boardWidth = backgroundGrid.width;
			boardHeight = backgroundGrid.height;
			
			tileWidth = boardWidth / COLUMNS;
			tileHeight = boardHeight / ROWS;
			
			for(var i:int = 0; i < COLUMNS; i++)
			{
				for(var j:int = 0; j < ROWS; j++)
				{
					addRandomGem(i, j); 
				}
			}
			
		}
		
		
		public function addRandomGem(tile_x:int, tile_y:int):void
		{
			var which:Number = Math.floor(Math.random()*10);
			var gem_art:BitmapData = gemAssets[which];
			
			var gem:GemButton = new GemButton(gem_art, tile_x, tile_y, which);
			gem.addEventListener(MouseEvent.CLICK, handleGemClick);
			
			gem.name = tile_x + "_" + tile_y;
			
			addChild(gem);
			gemList.push(gem);
			
			var start_x:Number = backgroundGrid.x + tileWidth/2;
			var start_y:Number = backgroundGrid.y + tileHeight/2;
			
			gem.x = start_x + tileWidth*tile_x;
			gem.y = start_y + tileHeight*tile_y;
			
		}
		
		public function handleGemClick(event:MouseEvent):void
		{
			
			//event.target is a DisplayObject, so you have to CAST it up to a GemButton
			//to get access to your custom GemButton properties
			var gem:GemButton = event.target as GemButton;
			
			clearNeighboringGemsThatMatch(gem);
			
			gameScore += clearedThisTurn*clearedThisTurn;
			
			//scoreText is defined in our UI file for this screen
			scoreText.text = "" + gameScore;
			
			if(clearedThisTurn > 0)
			{
				setTimeout(refillGems, 1000);
			}
			clearedThisTurn = 0;
		}
		
		public function refillGems():void
		{
			trace("REFILL GEMS");
			for(var i:int = 0; i < 5; i++)
			{
				for(var j:int = 0; j < 6; j++)
				{
					var got_one:Boolean = false;
					for each(var gem:GemButton in gemList)
					{
						if(gem.gridX == i && gem.gridY == j)
						{
							got_one = true;
						}
					}
					
					if(!got_one)
					{
						trace("ADD A NEW GEM AT " + i + "," + j);
						addRandomGem(i,j);
					}
					
				}
			}
		}
		
		public function clearNeighboringGemsThatMatch(gem:GemButton):void
		{
			//clear this gem off the list
			removeChild(gem);
			var index:int = gemList.indexOf(gem);
			gemList.splice(index,1);
			clearedThisTurn += 1;
			
			
			//we don't want to modify the gemList while we're going through it... so keep
			//a tally of any that should be purged
			var dead_gems:Array = [];
			
			for each(var board_gem:GemButton in gemList)
			{
				if(board_gem.value == gem.value)
				{
					//same row
					if(gem.gridX == board_gem.gridX)
					{
						//check left & right
						if(gem.gridY == board_gem.gridY + 1 || gem.gridY == board_gem.gridY - 1)
						{
							dead_gems.push(board_gem);
						}
					}else if(gem.gridY == board_gem.gridY){
						//check above & below
						if(gem.gridX == board_gem.gridX + 1 || gem.gridX == board_gem.gridX - 1)
						{
							dead_gems.push(board_gem);
						}
					}
				}
			}
			
			//we now need to make TWO passes through dead gems
			// 1) remove all of the dead gems from our active gemList
			// 2) check all of the dead gem neighbors to see if the chain continues
			
			for each(var cascade:GemButton in dead_gems)
			{
				clearNeighboringGemsThatMatch(cascade);
			}
		}
	}
}