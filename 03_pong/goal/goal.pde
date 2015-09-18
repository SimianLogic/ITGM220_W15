//KEY CONCEPTS: this, switch, break

//TODO: bring over Button and Color classes from the Matching game
//TODO: write a Rectangle class and refactor Button to use Rectangle
//TODO: explain "this" in the Rectangle constructor
//TODO: set up state variables and make a new class for PongGameScreen and PongMenuScreen
//TODO: explain what a switch statement does. explain "break" and fall-through
//TODO: wire up the PongMenuScreen's button, add mousePressed and mouseReleased switch statements
//TODO: use a boolean on PongMenuScreen to signal the "main" class that a button has been pressed
//TODO: set up a bounding rect and a "ball" rect in the pong game and add velocity
//TODO: add left/right/top/bottom helper functions to Rect and make the ballRect bounce around
//TODO: QUESTION: how can we make the ball hit on the sides instead of the center? MAKE IT SO

final int MENU_STATE = 1;
final int GAME_STATE = 2;
int currentState = MENU_STATE;

PongMenuScreen menuScreen;
PongGameScreen gameScreen;


void setup()
{
  size(800,600);
  
  menuScreen = new PongMenuScreen();
  gameScreen = new PongGameScreen();
}


void draw()
{
  switch(currentState)
  {
    case MENU_STATE:
      menuScreen.draw();
      break;
    case GAME_STATE:
      gameScreen.draw();
      break;
    default:
      println("INVALID STATE: " + currentState);
      break;
  }
}

void mousePressed()
{
  switch(currentState)
  {
    case MENU_STATE:
      menuScreen.mousePressed();
      break;
    case GAME_STATE:
      gameScreen.mousePressed();
      break;
    default:
      println("INVALID STATE: " + currentState);
      break;
  }
}

void mouseReleased()
{
  switch(currentState)
  {
    case MENU_STATE:
      menuScreen.mouseReleased();
      
      if(menuScreen.buttonPressed)
      {
        menuScreen.buttonPressed = false;
      }
      currentState = GAME_STATE;
      
      break;
    case GAME_STATE:
      gameScreen.mouseReleased();
      break;
    default:
      println("INVALID STATE: " + currentState);
      break;
  }
}