//DONE: whiteboard a button on the board
//DONE: explain what a class means
//DONE: make a button class (and a color class)
//DONE: explain how game programming is mostly UI programming
//DONE: show how to load an image
//DONE: finish off splash screen with an image and a button 
//DONE: explain what state means, create variables for states MENU and GAME
//DONE: explain the final keyword
//DONE: modify mouse/drawing code apply to only one state
//DONE: make it so pressing the start button transitions us to the gameplay state

//DONE: whiteboard simple 4x4 matching game
//DONE: create a 2D array (4x4) to hold the state of our board
//DONE: populate the array with random "match game" data
//DONE: create an array of Colors and draw the board so we can see the "goal"
//DONE: refactor int[][] into Tile(value) with new Tile -> value, isFaceUp, isFinal
//DONE: draw face down tiles and add logic for detecting which tile has been clicked
//DONE: add isFinal state to Tile

//HW BONUS: add a 2nd button to the menu that toggles the difficulty from easy to hard
//HW BONUS: add dynamic text ot the home screen that shows the current difficulty

PImage splashScreen;

void setup()
{
  size(800,600);
  splashScreen = loadImage("title_screen.png");
  
}

void draw()
{
  image(splashScreen, 0, 0);
}