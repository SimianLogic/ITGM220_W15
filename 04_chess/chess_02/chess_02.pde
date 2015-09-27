//KEY CONCEPTS: ArrayList, for-each statement, Switch statement, subclass + super

//CHESS PIECES from http://opengameart.org/content/chess-pieces
//cleaned them up, added clear BGs, and sized them to 65x65

//CHESS 02
//Show the Sprite class -- it's just a Rectangle with a PImage!
//Show how our new Button class is built on Rectangles -- but doesn't care what kind (as long as it can draw)
//Show the Game Piece class
//explain what JSON is -- Arrays, Ints, Floats, Strings, OBJECTS/MAPS/HASHES
//show how we can load JSON from the file system and operate on the values
//explain the SPLIT method
//explain BoardPoint and show that a piece returns valid moves
//walk through the BoardScreen mouseClicked logic


GameScreen currentScreen;
GameScreen menuScreen;
BoardScreen boardScreen;


PImage king;

void setup()
{
  size(800,600);
  //MenuScreen is a generic GameScreen, so we assign properties to it
  menuScreen = new GameScreen("ui/chess_menu.png");
  
  
  Sprite start_up = new Sprite("ui/start_up.png",400,300,300,100);
  Sprite start_over = new Sprite("ui/start_over.png",400,300,300,100);
  Sprite start_down = new Sprite("ui/start_down.png",400,300,300,100);
  
  Button start_button = new Button("menu_start_game", 
    start_up, 
    start_over, 
    start_down
  );
  menuScreen.buttonList.add(start_button);
  
  //boardScreen is a subclassed GameScreen, so it sets up its state
  //with its own constructor
  boardScreen = new BoardScreen();
  
  //finally set our start
  currentScreen = menuScreen;
}


void draw()
{
  currentScreen.draw();
}

void keyPressed()
{
  currentScreen.keyPressed();
}

void keyReleased()
{
  currentScreen.keyReleased();
}

void mouseClicked()
{
  currentScreen.mouseClicked();
}

void mousePressed()
{
  currentScreen.mousePressed();
}

void mouseReleased()
{
  String button_name = currentScreen.mouseReleased();
  if(button_name != null)
  {
    switch(button_name)
    {
      case "menu_start_game":
        currentScreen = boardScreen;
        break;
      case "board_exit_game":
        currentScreen = menuScreen;
        break;
      default:
        println("TODO: WIRE UP BUTTON " + button_name);
    }
  }
}