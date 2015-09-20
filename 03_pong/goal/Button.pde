class Button
{
  Rectangle buttonRect;
  
  color normalFill = color(120,120,120);
  color overFill = color(80,80,80);
  color downFill = color(0, 0, 0);
  
  Boolean isDown = false;
  
  //when you call the empty constructor, you must declare any variables that get used before they're called
  Button()
  {
    println("BE CAREFUL USING AN EMPTY CONSTRUCTOR");
  }
  
  Button(Rectangle rect, color normal_fill, color over_fill, color down_fill)
  {
    buttonRect = rect;
    normalFill = normal_fill;
    overFill = over_fill;
    downFill = down_fill;
  }
  
  void mousePressed()
  {
    if(buttonRect.containsPoint(mouseX,mouseY))
    {
      isDown = true;
    }
  }
  
  Boolean mouseReleased()
  {
    if(isDown && buttonRect.containsPoint(mouseX,mouseY))
    {
      isDown = false;
      return true;
    }
    
    isDown = false;
    return false;
  }
  
  void draw()
  {
    if(buttonRect.containsPoint(mouseX,mouseY))
    {
      if(isDown)
      {
        buttonRect.fillColor = downFill;
      }else{
        buttonRect.fillColor = overFill;
      }
    }else{
      buttonRect.fillColor = normalFill;
    }
    
    buttonRect.draw();
  }
}