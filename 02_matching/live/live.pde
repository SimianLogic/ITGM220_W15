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

//TODO: explain color primitive and why we killed the Color class
//TODO: refactor int[][] into Tile(value) with new Tile -> value, isFaceUp, isFinal
//TODO: draw face down tiles and add logic for detecting which tile has been clicked
//TODO: add isFinal state to Tile

//HW BONUS: add a 2nd button to the menu that toggles the difficulty from easy to hard
//HW BONUS: add dynamic text ot the home screen that shows the current difficulty

PImage splashScreen;

Button startButton;

final int MENU = 1;
final int GAMEPLAY = 2;

int currentState = MENU;

final int BAD_MATCH_COOLDOWN = 100;
int cooldownTime = 0;

int gridWidth = 4;
int gridHeight = 4;
Tile[][] grid = new Tile[gridWidth][gridHeight];

int tileWidth = 100;
int tileHeight = 100;
int tileStartX = 400 - gridWidth*tileWidth/2;
int tileStartY = 300 - gridHeight*tileHeight/2;

color tileBack = color(200,200,200);
color[] tileColors = {
  color(255, 0, 0),
  color(0, 255, 0),
  color(0, 0, 255),
  color(255, 255, 0),
  color(255, 0, 255),
  color(0, 255, 255),
  color(128, 0, 0),
  color(0, 128, 0),
  color(0, 0, 128)
};

void setup()
{
  size(800,600);
  splashScreen = loadImage("title_screen.png");
  
  startButton = new Button(250, 250, 300, 100, 
        color(0,255,0), 
        color(0,180,0), 
        color(0,100,0));
  
  //startButton = new Button();
  //startButton.x = 250;
  //startButton.y = 250;
  //startButton.width = 300;
  //startButton.height= 100;
  
  //startButton.upColor = new color(0, 255, 0);
  //startButton.overColor = new color(0, 180, 0);
  //startButton.downColor = new color(0, 100, 0);
  
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
  if(cooldownTime > 0)
  {
    cooldownTime -= 1;
    
    if(cooldownTime == 0)
    {
      for(int i = 0; i < gridWidth; i++)
      {
        for(int j = 0; j < gridHeight; j++)
        {
          if(!grid[i][j].isFinal)
          {
            grid[i][j].isFaceUp = false;
          }
        }
      }
    }
  }
  
  
  
  //draw game stuff
  fill(255,255,255);
  rect(0,0,800,600);
  
  for(int i = 0; i < 4; i++)
  {
    for(int j = 0; j < 4; j++)
    {
      Tile tile = grid[i][j];
      
      if(tile.isFaceUp)
      {
        fill(tileColors[tile.value]);
      }else{
        fill(tileBack);
      }
      
      rect(tileStartX + i*tileWidth,  //tile x value
          tileStartY + j*tileHeight,  //tile y value
          tileWidth,
          tileHeight);
      
    }
  }
}

void mouseClicked()
{
  if(cooldownTime > 0)
  {
    return;
  }
  int tile_column = floor((mouseX - tileStartX) / tileWidth);
  int tile_row = floor((mouseY - tileStartY) / tileHeight);
  
  if(tile_column < 0 || tile_row < 0 || tile_column >= gridWidth || tile_row >= gridHeight)
  {
    return;
  }
  
  Tile tile = grid[tile_column][tile_row];
  tile.flip();
  
  checkForMatches();
  
  println(tile_column + "," + tile_row);
  println(grid[tile_column][tile_row].value);
}

void checkForMatches()
{
  Tile first_thing = null;
  Tile second_thing = null;
  for(int i = 0; i < gridWidth; i++)
  {
    for(int j = 0; j < gridHeight; j++)
    {
      if(grid[i][j].isFaceUp && !grid[i][j].isFinal)
      { 
        if(first_thing == null)
        {
          first_thing = grid[i][j];
        }else if(second_thing == null){
          second_thing = grid[i][j];
        }else{
          println("[ERROR ERROR ERROR] 3 Things Are FACE UP");
        }
      }
    }
  }
  
  if(first_thing == null || second_thing == null)
  {
    //do nothing
    return;
  }
  
  if(first_thing.value == second_thing.value)
  {
    first_thing.isFinal = true;
    second_thing.isFinal = true;
  }else{
     cooldownTime = BAD_MATCH_COOLDOWN;
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
    
    cooldownTime = BAD_MATCH_COOLDOWN;
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
  for(int i = 0; i < gridWidth*gridHeight/2; i++)
  {
    possible_tiles.append(i);
    possible_tiles.append(i);
  }
  
  
  for(int i = 0; i < 4; i++)
  {
    for(int j = 0; j < 4; j++)
    { 
      int random_thing_in_list = floor(random(possible_tiles.size()));
      int thing_we_picked = possible_tiles.remove(random_thing_in_list);
      grid[i][j] = new Tile(thing_we_picked);
    }
  }
}