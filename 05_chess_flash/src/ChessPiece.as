package
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class ChessPiece extends Sprite
	{
		public static const TEAM_WHITE:String = "white";
		public static const TEAM_BLACK:String = "black";
		
		public var position:Point;		
		public var loader:Loader;
		
		public static var staticMoveData:Object;
		public static var dataIsLoaded:Boolean = false;
		
		public var piece:String;
		public var color:String;
		
		public var moveCount:int = 0;
		
		//Flash doesn't have a concept of a 2D array, but an Array can hold anything
		//so there's nothing stopping us from putting an Array inside an Array
		public var moveList:Array;
		public var openingList:Array;
		public var attackList:Array;
		
		public function ChessPiece(piece_color:String, piece_name:String)
		{
			super();
			
			piece = piece_name;
			color = piece_color;
			
			loader = new Loader();
			loader.load(new URLRequest("pieces/" + piece_color + "_" + piece_name + ".png"));
			addChild(loader);
			
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaded);
			
			//weird flash quirk -- our child will get a mouse event instead of us and we want to
			//listen to the ChessPiece and not the loader
			mouseChildren = false;
			
			loadMyMoveData();
		}
		
		public function loadMyMoveData():void
		{
			var my_data:Object = staticMoveData[piece];
			trace(my_data);
			
			for(var key:String in my_data)
			{
				trace("PROCESSING " + key);
				switch(key)
				{
					case "move":
						var moves:Array = my_data[key] as Array;
						moveList = convertJSONToMoves(moves);
						break;
					case "opening":
						var opening:Array = my_data[key] as Array;
						openingList = convertJSONToMoves(opening);
						break;
					case "attack":
						var attack:Array = my_data[key] as Array;
						attackList = convertJSONToMoves(attack);
						break;
					default:
						trace("UNRECOGNIZED MOVE TYPE " + key);
				}
			}
		}
		
		public function convertJSONToMoves(move_list:Array):Array
		{
			var moves:Array = [];
			
			for(var i:int = 0;i < move_list.length; i++)
			{
				var big_move:Array = move_list[i] as Array;
				var single_move:Array = [];
				
				for(var j:int = 0; j < big_move.length; j++)
				{
					var move:Array = big_move[j] as Array;
					var x:int = move[0];
					var y:int = move[1];
					
					var point:Point = new Point(x,y);
					trace("POINT: " + point);
					
					single_move.push(point);
				}
				
				moves.push(single_move);
			}
			
			return moves;	
		}
		
		public function getMoves():Array
		{
			if(moveCount == 0 && openingList != null)
			{
				return localMove(openingList);
			}
			
			return localMove(moveList);
		}
		
		public function getAttacks():Array
		{
			if(attackList != null)
			{
				return localMove(attackList);
			}
			
			return localMove(moveList);
		}
		
		public function localMove(canonical_moves:Array):Array
		{
			var local:Array = [];
			
			for(var i:int = 0; i < canonical_moves.length; i++)
			{
				var single_move:Array = canonical_moves[i];
				var local_move:Array = [];
				
				for(var j:int = 0; j < single_move.length; j++)
				{
					var y_offset:int = single_move[j].y;
					if(color == TEAM_WHITE)
					{
						y_offset = -y_offset;
					}
					
					local_move.push( new Point(single_move[j].x + position.x, y_offset + position.y) );
				}
				
				local.push(local_move);
			}
			
			return local;
		}
		
		public function onLoaded(event:Event):void
		{
			
			//center our sprite!
			loader.x = -loader.width/2;
			loader.y = -loader.height/2;
		}
		
		public static function loadMoveData():void
		{
			var json_path:URLRequest = new URLRequest("content/moves.txt");
			var json_loader:URLLoader = new URLLoader(json_path);
			json_loader.addEventListener(Event.COMPLETE, processMoveData);
		}
		
		public static function processMoveData(event:Event):void
		{
			var json:String = event.target.data;
			trace(json);
			
			var data:Object = JSON.parse(json);
			trace(data);
			staticMoveData = data;
			
			trace("DATA IS LOADED");
			
			dataIsLoaded = true;
		}
	}
}