# PRACTICE

###01
* print the string "Hello World" to the console

###02
* declare an int primitive and assign it a value on the same line.
* print the value to the console

###03
* declare a float primitive and assign it a value on the same line;
* print the value to the console

###04
* declare a boolean primitive with value = true
* declare a string object with a value of "test1"
* declare a string object with a value of "test2"
* write a conditional (if) statement that prints the variable with "test1" if the boolean is true and vice versa
* run the sketch and make sure it prints the right value. change the default value and run again.

###05
* write a for-loop which prints all the numbers from 0 to 9

###06
* write a for-loop which prints all the numbers from 1 to 10

###07
* declare an array of ints with the values 0-9 on one line
* print the array to the console

###08
* declare an array of 10 ints with no assigned value
* use a for loop to assign the values from 0-9
* print the array to the console

###09
* change the size of the sketch to 800x600

###10
* change the size of the sketch to 800x600 
* change the color of the background to blue

###11
* implement the setup and draw functions with a message to the console in each

###12
* create an 800x600 program 
* draw a BLUE rectangle centered at the mouse's location every frame

###13
* create an 800x600 program 
* draw a BLUE rectangle centered at the mouse's location every frame when the mouse is NOT PRESSED
* draw a RED rectangle when the mouse IS PRESSED

###14
* create an 800x600 program that clears the screen each draw call
* draw a BLUE rectangle centered at the mouse's location every frame when the mouse is NOT PRESSED
* draw a RED rectangle when the mouse IS PRESSED

###15
* create an 800x600 program that clears the screen each draw call
* create a helper function to draw a BLUE column at the mouse's position.

###16
* create an 800x600 program that clears the screen each draw call
* use file-level variables to declare a min and max x value
* when within the minX and maxX, draw a red column. 
* otherwise draw a blue column.

###17
* create an 800x600 program that clears the screen each draw call
* use file-level variables to declare a min and max x value
* when within the minX and maxX, draw a red column. 
* otherwise draw a blue column.
* declare a variable for columnWidth and only draw the column at stepped x-values (i.e. 50,100,150)

###18
* create an 800x600 program that clears the screen each draw call
* use file-level variables to store the mouseX/mouseY when the mouse is pressed
* use a file-level boolean variable to store whether currently dragging or not
* set isDragging = true on mousePressed and isDragging = false on mouseReleased
* draw a circle from the mousePressed point to the current point while dragging and after release
* clear the circle for a new circle each time we press the mouse

###19
* create an 800x600 program that clears the screen each draw call
* create a 2D array of booleans, 4x4
* write a helper function to return a random true or false
* in your setup function, assign each value in the 4x4 grid to a random boolean value
* draw a 4x4 grid with white squares for true and black squares for false

###20
* create an 800x600 program that clears the screen each draw call
* create a 2D array of booleans, 4x4
* write a helper function to return a random true or false
* in your setup function, assign each value in the 4x4 grid to a random boolean value
* draw a 4x4 grid with white squares for true and black squares for false
* in each draw function, randomly flip the values of each tile to a new value
* set the framerate low enough that it doesn't induce seizures

###21
* declare a constant int with a value of 10
* declare an IntList
* write a for-loop that iterates from 0 to your constant and populates your IntList
* print the IntList to the console
* change the 5th item in the array to a value of 25
* print IntAarray to the console


###22
* create an 800x600 program with setup/draw functions
* write a simple Rectangle class with the following variables/methods:
  * x (the center x-value of the rect)
  * y (the center y-value of the rect)
  * width
  * height
  * fill (a color value)
  * draw() -- a method that draws the rect centered at it's x/y coordinates
* in your main sketch:
  * add a Rectangle member/class variable
  * instantiate the Rectangle in your setup function
  * draw the Rectangle in your draw function

###23
* use exercise 22 as a starting point (save as a new sketch if you're saving them as we go)
* add a containsPoint function to your Rectangle class that takes an x and a y value and returns true or false depending on if the rect contains that point
* in your main sketch, use your new containsPoint function to tint your rect Red when the mouse is over the rectangle and blue when the mouse is outside the rectangle

###24
* use exercise 23 as a starting point (save a new sketch if you're saving them as we go)
* add an intersects function to your Rectangle class that takes a rect and returns true/false depending of if the 2 rectangles overlap
* make sure your Rectangle class has an empty constructor AND a constructor that takes one argument for each of its 5 params
* clear the background each frame
* create a second rectangle that follows the mouseX and mouseY each frame. rectangle 1 should be declared with new Rectangle() and rectangle 2 should be declared by passing in all the parameters to the constructor
* tint both rectangles blue when they don't intersect and red when they intersect (using your new function)

###25
* use exercise 24 as a starting point (save a new sketch if you're saving them as we go)
* setup: in your constructor, make it so the 2 rectangles don't overlap at the start of the sketch. make it so rect2 no longer "follows the mouse"
* you should now have a sketch which simply draws 2 rectangles and checks to see if they overlap (they won't, since they don't move)
* add a new Rectangle variable called selectedRect (it will be null to start)
* implement the mouseClicked() function with the following logic:
  * if selectedRect is null (nothing selected), check to see if either of the two rectangles were hit by the mouse click (using containsPoint)
  * if rect1 or rect2 were clicked, set selectedRect equal to the rect that was clicked
  * if selectedRect is NOT NULL (something selected), check to see if rect1 & rect2 overlap.
  * if there is no overlap, "put down" the selectedRect by setting selectedRect = null
* in your draw function, check to see if selectedRect is null; if not, have it follow mouseX and mouseY

###26
* use exercise 25 as a starting point (save a new sketch if you're saving them as we go)
* delete your rect1 and rect 2 variables and instead create an ArrayList of Rectangles   (type: ArrayList<Rectangle>) 
* in your setup function, use a for-loop to create 7 rectangles spaced evenly at x=100, x=200, x=300, etc...
* give each rectangle a random width and height (minimum: 25, maximum:75)
* in your draw function, use a for-each loop to draw all of your rectangles
* in your mouseClicked function, use a for-each loop to test click/collision on all rectangles instead of hard-coding rect1 & rect2
* at the end, you should have 7 rectangles that can be "picked up" and "put down" so long as they don't overlap

###27
* use exercise 26 as a starting point (save a new sketch if you're saving them as we go)
* create a sublcass of Rectangle called RoundedRectangle that has one new property (cornerRadius)
* override your draw function to use the optional corner-radius attributes in the rect function
* in your main sketch for-loop, use the RoundedRectangle class on even values of your iterator (i%2==0) and the regular Rectangle for odd values (i%2==1)

###28
* download an image off the internet (try https://commons.wikimedia.org/wiki/Main_Page) and put it in your sketch folder
* resize your sketch to be the size of the image
* load and draw an image on screen (using PImage)

###29
* write a JSON file describing a fictional course that validates on jsonlint.com. it should countain at least 1 of the following:
  * an object (preferably the whole file should be an object)
  * the name of the course
  * an array of at least 1 student (whose names are strings)  
  * the year of the course as an int
  * the length of a sigle class as a float/number
  * a class status variable which is null (no status)


###30
* parse the JSON example from exercise 29 and print out the values for each key in the object