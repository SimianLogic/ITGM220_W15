#Towers of Hanoi

Class 1 Cheat Sheet
------------------------------------------------------------------------
* a variable is a thing
* a function is a verb
* semicolons go at the end of a statement (usually a line)

* if/else if/else are used to test logical conditions
* blocks are created with squiggly brackets {}
* for is used to loop over a fixed number of items
* while is used to loop over an unknown number of items

* in Java, a function is composed of
  * a set of inputs a
  * single output (or void)
  * a block of code that executes against the inputs

* fill(r,g,b) is used to change "paints"
* rect(x,y,w,h) is used to draw a rectangle

* setup() runs at the beginning
* draw() runs every frame
* mouseClicked() runs every time the mouse is clicked

Class 1 Demonstration (notes to self)
------------------------------------------------------------------------
* woodish color = rgb(140, 115, 85)
* whiteboard Towers of Hanoi
* start by drawing the board and pegs with magic numbers
* refactor with variables and then change some around
* draw the rings (use {0,0,0,0} for empty pegs)
* detect which peg was clicked...OOPS. let's refactor into functions
* now detect which peg was clicked, then add a variable for selectedRing
* write the removeLast function to remove the last item into selectedRing
* write the addRing function which puts a ring down
* wrap-up!

Class 1 Homework
------------------------------------------------------------------------
* download the Towers of Hanoi code from Github (https://github.com/SimianLogic/ITGM220_W15)
* add a variable to track how many moves have been taken (where a move is pickup + put down) and display it onscreen somewhere (see "text")
* add an additional ring to the puzzle (5 rings instead of 4)
* make it the game doesn't allow me to make an invalid move (I can only put a small ring on a larger ring)
* change the colors so that each ring is a distinct color