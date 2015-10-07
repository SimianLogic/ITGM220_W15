# Match3

Successive steps illustrate the components of a Match-3 Game.


# Framework 01: Understanding Rectangles
* declaring a Rectangle
* instantiating a Rectangle
* drawing a Rectangle
* using a for loop to draw a Rectangle
* changing the properties of a Rectangle
* testing for collision between Rectangles

# Framework 02: Understanding Sprites
* remember: a Sprite is just a Rectangle with a PImage!
* declaring a Sprite
* instantiating a Sprite
* using a for loop to draw a Sprite
* changing the properties of a Sprite
* testing for collision between Sprites

# Framework 03: Understanding Buttons
* remember: a Button is just a set of Rectangles with a name
* declaring a Button
* instantiating a Button
* using a for loop to draw Buttons

# Framework 04: Understanding GameScreen
* make a menu with a start button and a logo
* make a game screen with a back button that shows a tiled grid (like in the reference image)

# Matching 01
* set up 2 game screens that match the art sample (640x960)
* add a start button to the main menu
* add a close button to the match screen
* add the score banner & a text field to the match screen
* wire up the button handlers to go from menu to game & vice versa

# Matching 02
* on the matching screen, add a grid of sprites for the checkered background

# Matching 03
* on the matching screen add a grid of randomly colored button gems that you can click on
* when a gem is clicked on, get rid of it! and print out its coordinates

# Matching 04
* let's make a special Gem class so we can keep track of its color value
* update gemList to hold GemButtons instead of Buttons
* add the world's worst scoring mechanic

# Matching 05
* let's reset the board when we stat a new game
* let's add a variable to the main sketch for high score and draw it on screen

# Matching 06
* don't just clear the clicked gem. get all of the connected gems that have the same value
* give points based on how many gems were cleared SQUARED (1,2,3 etc)


#Matching 07
* when a gem is cleared, create a new one and put it in its place (so the board stays full) -- do this after a couple of seconds so it's noticeable




Match 3 Homework
------------------------------------------------------------------------
* Add a game over screen (just needs text that says game over and the final score) with a button that goes back to the main menu.
* Add a turn counter to MatchScreen and draw it at the bottom of the screen (i.e. 10 moves).
* After each move, decrement the match counter by 1 (the text should update).
* When the player reaches 0 turns left, transition to the game over screen.

* BONUS:
	* the width/height of the grid (5x6) is hard-coded in a few places. pull those into variables on MatchScreen and change the dimensions of the board to 6x7. Modify the setup logic so it still looks "right" (centered, not overlapping, etc).
	* instead of using 10 possible tiles, limit the pool of tiles to only 4 specific shapes of your choice (i recommend one of each shape, whichever is your favorite color)
	* when you get to the game over screen, if you beat your old high score show text that says "NEW HIGH SCORE" below the score

