//KEY CONCEPTS: this, frameRate  -- starting "architecture"

//TODO: show off new Rectangle class and explain what it does.
//TODO: explain "this" in the Rectangle constructor
//TODO: show changes to Button class now that we have a Rectangle class.
//TODO: explain what a framework is.

//TODO: set up state variables and make a new class for PongGameScreen and PongMenuScreen
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


void setup()
{
  size(800,600);
}

void draw()
{
}