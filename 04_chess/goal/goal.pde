//TODO: whoops! color is a Primitive. let's look at color reference and delete our Color class
//TODO: show refactored Rectangle class
//TODO: show refactored Button class that takes 3 Rects


//TODO: show refactored GameScreen and explain how it comes from MatchGame and MatchMenu
//TODO: explain what an ArrayList is. explain what a for-each loop is (cannot modify)
//TODO: add a currentScreen, menuScreen, and boardScreen
//TODO: explain what a Switch statment is. Break; Fall-through
//TODO: add a button to the main menu screen that changes state

//TODO: explain what a subclass is. create a BoardScreen and change data types
//TODO: in BoardScreen's constructor, add a back button. explain the difference between "generic" use of a class and subclass
//TODO: add a grid of Rectangles to the board



GameScreen currentScreen;
GameScreen menuScreen;
BoardScreen boardScreen;

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