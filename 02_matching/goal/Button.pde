class Button
{
  
  int x;
  int y;
  
  int width;
  int height;
  
  color normalFill = color(120,120,120);
  color overFill = color(80,80,80);
  color downFill = color(0, 0, 0);
  
  Boolean isDown = false;
  
  void mousePressed()
  {
    if(hitTestMouse())
    {
      isDown = true;
    }
  }
  
  Boolean mouseReleased()
  {
    if(isDown && hitTestMouse())
    {
      isDown = false;
      return true;
    }
    
    isDown = false;
    return false;
  }
  
  Boolean hitTestMouse()
  {
    if(mouseX > x && mouseX < x+width && mouseY > y && mouseY < y + height)
    {
      return true;
    }else{
      return false;
    }
  }
  
  void draw()
  {
    if(hitTestMouse())
    {
      if(isDown)
      {
        fill(downFill);
      }else{
        fill(overFill);
      }
    }else{
      fill(normalFill);
    }
    
    rect(x,y,width,height);
  }
}