class Button
{
  Rectangle buttonRect;
  
  Color normalFill = new Color(120,120,120);
  Color overFill = new Color(80,80,80);
  Color downFill = new Color(0, 0, 0);
  
  Boolean isDown = false;
  
  //when you call the empty constructor, you must declare any variables that get used before they're called
  Button()
  {
    println("BE CAREFUL USING AN EMPTY CONSTRUCTOR");
  }
  
  Button(Rectangle rect, Color normal_fill, Color over_fill, Color down_fill)
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
        downFill.apply();
      }else{
        overFill.apply();
      }
    }else{
      normalFill.apply();
    }
    
    buttonRect.draw();
  }
}