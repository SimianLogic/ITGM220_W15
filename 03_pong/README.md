# Pong

Class 3 Cheat Sheet
------------------------------------------------------------------------
* it's a good practice to make every screen its own class
* in Java, "this" is a way for an object to refer to itself. this is handy for variables that have been "covered up" by local variables
* a "run loop" is a centeral loop from which all animation/activity in a game come from
* frameRate allows you to set the FASTEST speed that your program will run


Class 3 Homework
------------------------------------------------------------------------
* currently we're doing hit detection on the paddle's center (x/y) -- make it so the paddles cannot leave the boardRect
* make it so the winner of each point gets a bigger paddle and the loser gets a smaller paddle
* add a victory condition, including:
  * a new screen that shows which player won
  * a button that returns you to the main menu
* add a newGame function to the PongGameScreen so that players can start a new game (need to reset all variables to their initial state)


* BONUS
  * add "light tails to the ball"
  * make it so the ball speeds up with every hit (and resets when a point is scored)
  
