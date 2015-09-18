//KEY CONCEPTS: this, frameRate, switch, break  -- starting "architecture"

//TODO: show off new Rectangle class and explain what it does.
//TODO: explain "this" in the Rectangle constructor
//TODO: show changes to Button class now that we have a Rectangle class.
//TODO: explain what a framework is.

//TODO: set up state variables and make a new class for PongGameScreen and PongMenuScreen
//TODO: explain what a switch statement does. explain "break" and fall-through
//TODO: wire up the PongMenuScreen's button, add mousePressed and mouseReleased switch statements
//TODO: use a boolean on PongMenuScreen to signal the "main" class that a button has been pressed
//TODO: set up a bounding rect and a "ball" rect in the pong game and add velocity
//TODO: explain what RUN LOOP means. explain what frameRate means and set frameRate to 60
//TODO: add left/right/top/bottom helper functions to Rect and make the ballRect bounce around
//TODO: QUESTION: how can we make the ball hit on the sides instead of the center? MAKE IT SO
//TODO: draw paddles for player1 and player 2
//TODO: add keyboard input for Player 1 and Player 2
//TODO: confine players to only move  within the boardRect (explain the MIN/MAX/CONSTRAIN functions)
//TODO: OH NO! "key" only keeps the last key (can't do that for 2 players) -- use keyPressed and keyReleased
//TODO: add score variables and draw them on screen

final int MENU_STATE = 1;
final int GAME_STATE = 2;
int currentState = MENU_STATE;

PongMenuScreen menuScreen;
PongGameScreen gameScreen;


void setup()
{
  size(800,600);
  frameRate(60);
  
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

void keyPressed()
{
  gameScreen.keyPressed();
}

void keyReleased()
{
  gameScreen.keyReleased();
}

void mousePressed()
{
  switch(currentState)
  {
    case MENU_STATE:
      menuScreen.mousePressed();
      break;
    case GAME_STATE:
      //no mouse input
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
        currentState = GAME_STATE;
      }
      
      break;
    case GAME_STATE:
      //no mouse input
      break;
    default:
      println("INVALID STATE: " + currentState);
      break;
  }
}