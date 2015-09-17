class Button
{
  
  Boolean isPressed = false;
  
  int x;
  int y;
  int width;
  int height;
  
  Color upColor;
  Color downColor;
  Color overColor;
   
  Button()
  {
    
  }
  
  Button(int _x, int _y, int _width, int _height, Color up, Color down, Color over)
  {
    x = _x;
    y = _y;
    width = _width;
    height = _height;
    upColor = up;
    downColor = down;
    overColor = over;
  }
  
  void draw()
  {
    //is the mouse within the bounds of the button
    if(mouseX > x && mouseX < x + width && mouseY > y && mouseY < y + height)
    {
      if(isPressed)
      {
        downColor.apply();
      }else{
        overColor.apply();
      }
    }else{
      upColor.apply();
      fill(upColor.r, upColor.g, upColor.b);
    }

    rect(x,y,width,height);
  }
  
  void mousePressed()
  {
    if(mouseX > x && mouseX < x + width && mouseY > y && mouseY < y + height)
    {
      isPressed = true;
    }
  }
  
  //if the mouse was pressed, return true IF within our rect
  //otherwise return false
  Boolean mouseReleased()
  {
    if(isPressed && mouseX > x && mouseX < x + width && mouseY > y && mouseY < y + height)
    {
      isPressed = false;
      return true;
    }
    
    isPressed = false;
    return false;
  }
  
  
  
}