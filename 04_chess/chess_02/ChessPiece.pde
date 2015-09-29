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
  
  ChessPiece(String piece_color, String piece_name, float center_x, float center_y, float width, float height)
  {
    //equivalent to calling new Sprite("pieces/white_rook.png",x,y,w,h);
    super("pieces/" + piece_color + "_" + piece_name + ".png", center_x, center_y, width, height);
    
    team = piece_color;
    piece = piece_name;
  }
  
  //returns an array of valid moves without taking into account other pieces
  //or the board edge
  BoardPoint[] getMoves()
  {
    BoardPoint[] moves = new BoardPoint[4];
    
    moves[0] = position.offset(1,0);
    moves[1] = position.offset(-1,0);
    moves[2] = position.offset(0,-1);
    moves[3] = position.offset(0,1);
    
    return moves;
  }
  
}