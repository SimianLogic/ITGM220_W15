class GemButton extends Button
{
  int gridX;
  int gridY;
  int value; //gem1, gem2, gem3, etc
 
  //value is assumed to be 1-12
  GemButton(String name, int grid_x, int grid_y, int value, float x, float y)
  {
    //the super call has to come first, so we don't have time to declare our buttons
    //as individual variables... just create them inline!
    super(name, 
      new Sprite("web_images/jewel" + value + ".png", x, y), 
      new Sprite("web_images/jewel" + value + ".png", x, y, 105, 105),
      new Sprite("web_images/jewel" + value + ".png", x, y, 90, 90)
    );
    
    gridX = grid_x;
    gridY = grid_y;
    this.value = value;
    
  }
  
}