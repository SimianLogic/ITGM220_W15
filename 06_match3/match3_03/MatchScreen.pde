

class MatchScreen extends GameScreen
{
  
  int score = 0;
  
  MatchScreen()
  {
    super();
    
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
    int tile_width = 115;
    int tile_height = 115;
    
    //use arithmetic to center all this
    int total_width = 5*tile_width;
    int start_x = (640 - total_width)/2 + tile_width/2;
    
    int start_y = 220; 
    
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
         
         
         Sprite gem_normal = new Sprite("web_images/jewel" + which_gem + ".png", start_x + i*tile_width, start_y+j*tile_width);
         Sprite gem_up = new Sprite("web_images/jewel" + which_gem + ".png", start_x + i*tile_width, start_y+j*tile_width, 105, 105);
         Sprite gem_down = new Sprite("web_images/jewel" + which_gem + ".png", start_x + i*tile_width, start_y+j*tile_width, 90, 90);
         Button gem_button = new Button(i + "_" + j, gem_normal, gem_up, gem_down);
         buttonList.add(gem_button);
         
      }
    }
  }
  
  void draw()
  {
    //if we dont' call this, none of our buttonList or spriteList will draw...
    super.draw();
    
    textSize(40);
    textAlign(CENTER);
    
    //black text
    fill(0);
    text("" + score, 170, 100);
  }
  
  Button mouseReleased()
  {
    Button return_button = super.mouseReleased();
    
    if(return_button == null)
    {
      return null;
    }else if(return_button.name == "scale_button"){
      return return_button;
    }else{
      
      //WE KNOW A JEWEL WAS CLICKED
      
      //take our clicked jewel out of the buttonList, which will "kill it"
      // (it will no longer get events or draw calls
      buttonList.remove(return_button);
      
      String[] coordinates = return_button.name.split("_");
      int x = parseInt(coordinates[0]);
      int y = parseInt(coordinates[1]);
      
      println("KILLED JEWEL AT " + x + "," + y);
      
    }
    return null;
  }


  
  
}