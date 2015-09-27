class BoardScreen extends GameScreen
{
  Rectangle[][] board;
  ArrayList<ChessPiece> pieces;
  
  //a standard chess board is 8x8
  final int ROWS = 8;
  final int COLUMNS = 8;
    
  //will be assigned in the constructor
  float tileWidth; //how wide should our tiles be? just sizing
  float tileHeight;//ditto for height
  
  float startX; //start x-value for figuring out grid locations
  float startY; //ditto for y
  
  //a rectangle we can move around to show which piece is currently selected
  Rectangle selectedRect;
  //a list of rectangles we can draw to show valid moves
  ArrayList<Rectangle> validMoves;
  
  //a holder variable for our currently selected chess piece
  ChessPiece selectedPiece = null;
  
  BoardScreen()
  {
    //this super call is like calling new GameScreen("ui/chess_game.png")
    super("ui/chess_game.png");
    
    validMoves = new ArrayList<Rectangle>();
    
    Rectangle back_rect = new Rectangle(780,20,40,40, color(255,0,0));
    
    //make a small red box to act as an exit button
    Button back_button = new Button("board_exit_game",
      back_rect,
      back_rect.copyWithColor(color(200,0,0)),
      back_rect.copyWithColor(color(200,0,0))
    );
    
    //this is an inherited property. it is declared in our superclass, but 
    //this subclass still has it!
    buttonList.add(back_button);
    
    float board_width = 500;
    float board_height = 500;
    
    //how wide should our individual pieces/tiles be?
    tileWidth = board_width / ROWS;
    tileHeight = board_height / ROWS;
    
    //make the selectedRect
    selectedRect = new Rectangle(0,0,tileWidth,tileHeight,color(0,228,255));
    
    startX = 400 - board_width/2 + tileWidth/2;
    startY = 300 - board_height/2 + tileHeight/2;
    
    //create a grid of alternating black & white tiles to be our chess board
    board = new Rectangle[COLUMNS][ROWS];
    for(int i = 0; i < COLUMNS; i++)
    {
      for(int j = 0; j < ROWS; j++)
      {
        Rectangle tile;
        if(i%2 == j%2)
        {
          board[i][j] = new Rectangle(startX + i*tileWidth,startY + j*tileHeight,tileWidth, tileHeight, color(255,255,255));
        }else{
          board[i][j] = new Rectangle(startX + i*tileWidth,startY + j*tileHeight,tileWidth, tileHeight, color(0,0,0));
        }
        
      }
    }
    
    //create an arraylist of our chess pieces
    pieces = new ArrayList<ChessPiece>();
    //load our initial layout from a JSON txt file. the code below
    //requires that you know the structure of your JSON file
    JSONArray layout_data = loadJSONArray("initial_layout.txt");
    for (int i = 0; i < layout_data.size(); i++) 
    {
      //we know this is an array
      JSONArray row = layout_data.getJSONArray(i);
      for(int j = 0; j < row.size(); j++)
      {
        String piece = row.getString(j);
        println(piece);
        if(piece.equals("empty"))
        {
          //nothing to see here
        }else{
          
          //break the string apart every time you find a "_" and make an array of the results
          //given black_pawn we'll end up with an array of ["black","pawn"]
          String[] color_and_piece = piece.split("_");
          String piece_color = color_and_piece[0];
          String piece_name = color_and_piece[1];
          
          ChessPiece sprite = new ChessPiece(piece_color, piece_name, startX + j*tileWidth, startY+i*tileHeight, tileWidth, tileHeight);
          
          sprite.position = new BoardPoint(j,i);
          
          pieces.add(sprite);
        }
        
      }
    }
    
    
  }
  
  
  void draw()
  {
    super.draw();
    
    //draw the board first
    for(int i = 0; i < COLUMNS; i++)
    {
      for(int j = 0; j < ROWS; j++)
      {
        board[i][j].draw();
      }
    }
    
    //draw the selected piece and any valid moves
    if(selectedPiece != null)
    {
      selectedRect.draw();
      
      //draw our valid moves
      for(Rectangle move : validMoves)
      {
        move.draw();
      }
    }
    
    
    //now draw the pieces
    for(ChessPiece piece : pieces) 
    {
      piece.draw();
    }
    
  }
  
  void updateValidMoves()
  {
    println("UPDATE VALID MOVES");
    validMoves.clear();
    
    if(selectedPiece == null)
    {
      return;
    }
    
    BoardPoint[] possible_moves = selectedPiece.getMoves();
    for(int i = 0; i < possible_moves.length; i++)
    {
      //if the possible_move is out of bounds, it's a bad move!
      if(possible_moves[i].x < 0) continue;
      if(possible_moves[i].y < 0) continue;
      if(possible_moves[i].x >= COLUMNS) continue;
      if(possible_moves[i].y >= ROWS) continue;
      
      //see if there's anyone in the spot already
      ChessPiece current_piece = pieceForBoardPoint(possible_moves[i]);
      
      //2 valid move types:
      //there is NOTHING in the spot we want to move to
      //there is an ENEMY piece in the spot we want to move to
      if(current_piece == null || !current_piece.team.equals(selectedPiece.team))
      {
        println("VALID MOVE: " + possible_moves[i].x + "," + possible_moves[i].y);
        if(current_piece != null)
        {
          println("TEAMS: " + current_piece.team + " vs " + selectedPiece.team);
        }
        //add it to our valid moves!
        Rectangle valid_move = selectedRect.copyWithColor(color(255,0,0));
        valid_move.x = startX + possible_moves[i].x*tileWidth;
        valid_move.y = startY + possible_moves[i].y*tileHeight;
        
        validMoves.add(valid_move);
      }
    }
  }
  
  BoardPoint pointFor(float x, float y)
  {
    int bx = round((x-startX)/tileWidth);
    int by = round((y-startY)/tileHeight);
    return new BoardPoint(bx,by);
  }
  ChessPiece pieceForBoardPoint(BoardPoint position)
  {
    for(ChessPiece piece : pieces) 
    {
      if(piece.position.x == position.x && piece.position.y == position.y)
      {
        return piece;
      }
    }
    return null;
  }
  
  void mouseClicked()
  {
    BoardPoint hit_point = pointFor(mouseX,mouseY);
    println("HIT " + hit_point.x + "," + hit_point.y);
    
    //first see if we clicked on a valid move
    for(Rectangle move : validMoves)
    {
      if(move.containsPoint(mouseX,mouseY))
      {
        //if there was a piece there
        ChessPiece current_piece = pieceForBoardPoint(hit_point);
        if(current_piece != null)
        {
          //KILL IT  (by removing it from our array)
          pieces.remove(current_piece);
        }

        selectedPiece.x = move.x;
        selectedPiece.y = move.y;
        selectedPiece.position = hit_point;
        selectedPiece = null;
        updateValidMoves();
        
        //we don't want to do any other clicky stuff down below
        println("MADE A MOVE");
        return;
      }
    }
          
    for(ChessPiece piece : pieces) 
    {
      if(piece.position.x == hit_point.x && piece.position.y == hit_point.y)
      {
        //if you clicked on the same piece again, UNSELECT it (set selectedPiece to null)
        if(selectedPiece == piece)
        {
          selectedPiece = null;
        }else{
          selectedPiece = piece;
          selectedRect.x = piece.x;
          selectedRect.y = piece.y;
        }
      }
    }
    
    //whether we clicked or not, update our valid moves
    updateValidMoves();
  }
  
  
}