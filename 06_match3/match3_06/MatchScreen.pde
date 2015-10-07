

class MatchScreen extends GameScreen
{
  
  ArrayList<GemButton> gemList;
  
  int gameScore = 0;
  int clearedThisTurn = 0;
  
  MatchScreen()
  {
    super();
    
    gemList = new ArrayList<GemButton>();
    
    Sprite background = new Sprite("web_images/background.png", 320, 480);
    spriteList.add(background);
    
    Sprite score_thingy = new Sprite("web_images/score_window.png", 210,75);
    spriteList.add(score_thingy);    
    
    //a button made up of 1 image drawn at different sizes (3 different sprites)
    Rectangle close_normal = new Sprite("my_images/close_button.png", 580, 60);
    Rectangle close_big = new Sprite("my_images/close_button.png", 580, 60, 75, 75);
    Rectangle close_small = new Sprite("my_images/close_button.png", 580, 60, 65, 65);
    Button scaleButton = new Button("scale_button", close_normal, close_big, close_small);
    //buttonList is a property inherited from GameScreen
    buttonList.add(scaleButton);
    
    
    //add our tiled background   (Confession: real world Prof would just bake these into the background image)
    
    //magic numbers -- just guess & checked these
    float tile_width = 115;
    float tile_height = 115;
    
    //use arithmetic to center all this
    float total_width = 5*tile_width;
    float start_x = (640 - total_width)/2 + tile_width/2;
    
    float start_y = 220; 
    
    for(int i = 0; i < 5; i++)
    {
      for(int j = 0; j < 6; j++)
      {
         //same logic as our checkerboard!
         if((i + j) %2 == 0)
         {
           Sprite dark_image = new Sprite("web_images/field_dark.png", start_x + i*tile_width, start_y+j*tile_height, tile_width, tile_height);
           spriteList.add(dark_image);
         }else{
           Sprite light_image = new Sprite("web_images/field_bright.png", start_x + i*tile_width, start_y+j*tile_height, tile_width, tile_height);
           spriteList.add(light_image);
         }
         
         //get a random int from 1 to 10  (ceil = "round up")
         int which_gem = ceil(random(10));
         
         
         //Sprite gem = new Sprite("web_images/jewel" + which_gem + ".png", start_x + i*tile_width, start_y+j*tile_width);
         //spriteList.add(gem);
         
         
         GemButton gem_button = new GemButton(i + "_" + j, i, j, which_gem,start_x + i*tile_width, start_y+j*tile_width); 
         gemList.add(gem_button);
         
      }
    }
  }
  
  void draw()
  {
    //if we dont' call this, none of our buttonList or spriteList will draw...
    super.draw();
    
    for(GemButton gem : gemList)
    {
      gem.draw();
    }
    
    textSize(40);
    textAlign(CENTER);
    
    //black text
    fill(0);
    text("" + gameScore, 170, 100);
  }
  
  void mousePressed()
  {
    super.mousePressed();
    
    for(GemButton gem : gemList)
    {
      gem.mousePressed();
    }
    
  }
  
  Button mouseReleased()
  {
    Button return_button = super.mouseReleased();
    
    if(return_button != null)
    {
      return return_button;
    }
    
    GemButton clicked_gem = null;    
    for(GemButton gem : gemList)
    {
      if(gem.mouseReleased())
      {
        clicked_gem = gem;
      }
    }
    
    if(clicked_gem != null)
    {
      //WE KNOW A GEM WAS CLICKED
    
      //take our clicked gem out of the buttonList, which will "kill it"
      // (it will no longer get events or draw calls
      gemList.remove(clicked_gem);
      
      println("KILLED GEM AT " + clicked_gem.gridX + "," + clicked_gem.gridY);
      println("GEM HAD A VALUE OF " + clicked_gem.value);
      
      //reset our counter
      clearedThisTurn = 1;  //we're already removing this one
      clearNeighboringGemsThatMatch(clicked_gem);
      
      //award points equal to clearedThisTurn SQUARED
      println("CLEARED " + clearedThisTurn);
      gameScore += clearedThisTurn*clearedThisTurn;
    }
    

    return null;
  }
  
  void clearNeighboringGemsThatMatch(GemButton gem)
  {
    //you can't modify the contents of an ArrayList while you're 
    //going through it, so we need to save the "dead" gems for after
    ArrayList<GemButton> dead_gems = new ArrayList<GemButton>();
    
    for(GemButton board_gem : gemList)
    {
      if(board_gem.value == gem.value)
      {
        //same row
        if(gem.gridX == board_gem.gridX)
        {
          //check left & right
          if(gem.gridY == board_gem.gridY + 1 || gem.gridY == board_gem.gridY - 1)
          {
            dead_gems.add(board_gem);
          }
        }else if(gem.gridY == board_gem.gridY){
          //check above & below
          if(gem.gridX == board_gem.gridX + 1 || gem.gridX == board_gem.gridX - 1)
          {
            dead_gems.add(board_gem);
          }
        }
      }
    }
    
    //we now need to make TWO passes through dead gems
    // 1) remove all of the dead gems from our active gemList
    // 2) check all of the dead gem neighbors to see if the chain continues
    
    for(GemButton deader : dead_gems)
    {
      //also need to increment our round score by 1!
      clearedThisTurn += 1;
      gemList.remove(deader);
    }
    
    //if we didn't pick up any new dead gems, this will be empty and nothing will happen!
    for(GemButton deader : dead_gems)
    {
      clearNeighboringGemsThatMatch(deader);
    }
    
  }
  
}