class Rectangle
{
  float x;
  float y;
  float width;
  float height;
  
  Color fillColor;
  
  Rectangle(float center_x, float center_y, float width, float height)
  {
    x = center_x;
    y = center_y;
    this.width = width;
    this.height = height;
  }
  
  float top()
  {
    return y - height/2;
  }
  float bottom()
  {
    return y + height/2; 
  }
  
  float left()
  {
    return x - width/2;
  }
  
  float right()
  {
    return x + width/2;
  }
  
  void draw()
  {
    //if we've been given a color, apply it first! 
    //if not, just use the current fill
    if(fillColor != null)
    {
      fillColor.apply();
    }
    
    rect(x - width/2,y - height/2,width,height);
  }
  
  Boolean containsPoint(float test_x, float test_y)
  {
    if(test_x > x && test_x < x+width && test_y > y && test_y < y + height)
    {
      return true;
    }else{
      return false;
    }
  }
  
  
}