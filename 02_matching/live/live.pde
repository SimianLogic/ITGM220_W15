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

Button startButton;

final int MENU = 1;
final int GAMEPLAY = 2;

int currentState = MENU;

int gridWidth = 4;
int gridHeight = 4;
int[][] grid = new int[gridWidth][gridHeight];

int tileWidth = 100;
int tileHeight = 100;
int tileStartX = 400 - gridWidth*tileWidth/2;
int tileStartY = 300 - gridHeight*tileHeight/2;

void setup()
{
  size(800,600);
  splashScreen = loadImage("title_screen.png");
  
  startButton = new Button(250, 250, 300, 100, 
        new Color(0,255,0), 
        new Color(0,180,0), 
        new Color(0,100,0));
  
  //startButton = new Button();
  //startButton.x = 250;
  //startButton.y = 250;
  //startButton.width = 300;
  //startButton.height= 100;
  
  //startButton.upColor = new Color(0, 255, 0);
  //startButton.overColor = new Color(0, 180, 0);
  //startButton.downColor = new Color(0, 100, 0);
  
  println("startButton.x = " + startButton.x);
}

void draw()
{
  if(currentState == MENU)
  {
    image(splashScreen, 0, 0);
    startButton.draw();
  }else{
    drawGameStuff();
  }
}

void drawGameStuff()
{
  //draw game stuff
  fill(255,255,255);
  rect(0,0,800,600);
  
  for(int i = 0; i < 4; i++)
  {
    for(int j = 0; j < 4; j++)
    {
    }
  }
}

void mousePressed()
{
  if(currentState == MENU)
  {
    startButton.mousePressed();
  }else{
    //do gameplay mouse stuff
  }
}

void mouseReleased()
{
  if(currentState == MENU)
  {
    Boolean did_click_button = startButton.mouseReleased();
    
    currentState = GAMEPLAY;
    setupGame();
  }else{
    //do gameplay mouse stuff
  }
}

void setupGame()
{
  //goal here is to have a list of tiles that we can place in the grid
  //that are randomized
  IntList possible_tiles = new IntList();
  for(int i = 1; i <= gridWidth*gridHeight/2; i++)
  {
    possible_tiles.append(i);
    possible_tiles.append(i);
  }
  
  
  for(int i = 0; i < 4; i++)
  {
    for(int j = 0; j < 4; j++)
    {
      grid[i][j] = i + j;
      
      int random_thing_in_list = floor(random(possible_tiles.size()));
      int thing_we_picked = possible_tiles.remove(random_thing_in_list);
      grid[i][j] = thing_we_picked;
    }
  }
}