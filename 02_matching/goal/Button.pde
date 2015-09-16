class Button
{
  
  int x;
  int y;
  
  int width;
  int height;
  
  Color normalFill = new Color(120,120,120);
  Color overFill = new Color(80,80,80);
  Color downFill = new Color(0, 0, 0);
  
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
        downFill.apply();
      }else{
        overFill.apply();
      }
    }else{
      normalFill.apply();
    }
    
    rect(x,y,width,height);
  }
}