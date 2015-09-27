//A chess piece is a sprite that:
//  knows what kind of piece it is
//  knows how it's allowed to move
class ChessPiece extends Sprite
{
  //our position in board coordinates (0,0) to (7,7)
  BoardPoint position;
  
  //if it wasn't so standard that chess boards are 8x8, we might make a 
  //Constants file just to hold constants that are used across multiple
  //files
  final int COLUMNS = 8;
  final int ROWS = 8;
  
  final String TEAM_WHITE = "white";
  final String TEAM_BLACK = "black";
  String team;
  
  final String PIECE_PAWN = "pawn";
  final String PIECE_ROOK = "rook";
  final String PIECE_KNIGHT = "knight";
  final String PIECE_BISHOP = "bishop";
  final String PIECE_QUEEN = "queen";
  final String PIECE_KING = "king";
  String piece;
  
  int moveCount = 0;
  
  BoardPoint[] moveList; //where can we move
  BoardPoint[] openingList; //where can we move on our first turn?
  BoardPoint[] attackList; //where can we attack?
  
  ChessPiece(String piece_color, String piece_name, float center_x, float center_y, float width, float height)
  {
    super("pieces/" + piece_color + "_" + piece_name + ".png", center_x, center_y, width, height);
    
    team = piece_color;
    piece = piece_name;
    
    loadMoves();
  }
  
  void loadMoves()
  {
    JSONObject all_piece_data = loadJSONObject("content/moves.txt");
    JSONObject piece_data = all_piece_data.getJSONObject(piece);
    
    //keys returns a Set... of Objects. so we have to convert to String
    for(Object key : piece_data.keys())
    {
      String string_key = key.toString();
      
      switch(string_key)
      {
        case "move":
          JSONArray moves = piece_data.getJSONArray("move");
          moveList = convertJSONToMoves(moves);
          break;
        case "opening":
          JSONArray opening = piece_data.getJSONArray("opening");
          openingList = convertJSONToMoves(opening);
          break;
        case "attack":
          JSONArray attack = piece_data.getJSONArray("attack");
          attackList = convertJSONToMoves(attack);
          break;
        default:
          println("UNRECOGNIZED MOVE TYPE " + string_key);
          break;
      }
    }
  }
  
  BoardPoint[] convertJSONToMoves(JSONArray move_list)
  {
    BoardPoint[] moves = new BoardPoint[move_list.size()];
    for(int i = 0; i < move_list.size(); i++)
    {
      JSONArray move = move_list.getJSONArray(i);
      int x = move.getInt(0);
      int y = move.getInt(1);
      
      moves[i] = new BoardPoint(x,y);
    }
    
    return moves;
  }
  
  //returns an array of valid moves without taking into account other pieces
  //or the board edge
  BoardPoint[] getMoves()
  {
    if(moveCount == 0 && openingList != null)
    {
      return localMove(openingList);
    }
    
    return localMove(moveList);
  }
  
  BoardPoint[] getAttacks()
  {
    if(attackList != null)
    {
      println("HAVE ATTACKS");
      return localMove(attackList);
    }
    
    //if we don't have a specific attack list, just use our move list
    return localMove(moveList);
  }
  
  BoardPoint[] localMove(BoardPoint[] canonical_moves)
  {
    BoardPoint[] local = new BoardPoint[canonical_moves.length];
    
    for(int i = 0; i < canonical_moves.length; i++)
    {
      int y_offset = canonical_moves[i].y;
      if(team.equals(TEAM_WHITE))
      {
        y_offset = -y_offset;
      }
      local[i] = position.offset(canonical_moves[i].x,y_offset);
    }
    
    return local;
  }
  
}