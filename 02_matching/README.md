# Matching

Class 2 Cheat Sheet
------------------------------------------------------------------------
* a Class is a named collection of variables and functions
* by convention, you usually put 1 class in each file and name the file the same as the class
* to make a new thing, use the "new" keyword.  MyClass thing = new MyClass()
* to access a variable/function, use "dot syntax" -- thing.variable or thing.function()

* the final keyword is used to declare CONSTANTS (which are traditionally in all-caps)
* a constant is a variable whose value cannot change

* a two-dimensional array is an array of arrays (i.e. int[][])
* "mutable" means "the length of the container can change"
* "immutable" means "the length" of the container can not change
* in Java, an Array is immutable. an IntArray is a special container that is mutable.


Class 2 Homework
------------------------------------------------------------------------
* add an image (PImage class) for each tile instead of a color
* add a guess counter with a label for how many guesses have been made
* write the logic to detect game over. when in the game over state, show a button that returns you to the menu

* BONUS: add a diffiulcty modifier
  * add a button to the main menu that changes the difficulty from "easy" (4x4) to "hard" (6x4)
  * add dynamic text that shows the currently selected difficulty (default to easy)
  * add the game logic/images/colors so that the game is playable at the "hard" difficulty