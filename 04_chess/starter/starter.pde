//KEY CONCEPTS: ArrayList, for-each statement, Switch statement, subclass + super

//CHESS PIECES from http://opengameart.org/content/chess-pieces
//cleaned them up, added clear BGs, and sized them to 65x65

//INTRODUCTION (Starter Code)
//TODO: whoops! color is a Primitive. let's look at color reference and delete our Color class
//TODO: show refactored Rectangle class
//TODO: show refactored Button class that takes 3 Rects
//TODO: show refactored GameScreen and explain how it comes from MatchGame and MatchMenu
//TODO: explain what an ArrayList is. explain what a for-each loop is (cannot modify)
//TODO: explain how we switched from STATE as an int to STATE as a GameScreen
//TODO: explain what a Switch statment is. Break; Fall-through
//TODO: explain what a subclass is. show BoardScreen's constructor
//TODO: explain the difference between "generic" use of a class and subclass
//TODO: show grid of Rectangles on the board with mouse input

//LIVE DEMO


GameScreen currentScreen;
GameScreen menuScreen;
BoardScreen boardScreen;


PImage king;

void setup()
{
  size(800,600);
  //MenuScreen is a generic GameScreen, so we assign properties to it
  menuScreen = new GameScreen("chess_menu.png");
  
  Rectangle start_rect = new Rectangle(400,300,300,100, color(0,255,0));
  Button start_button = new Button("menu_start_game", 
    start_rect, 
    start_rect.copyWithColor(color(0,200,0)), 
    start_rect.copyWithColor(color(0,100,0))
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