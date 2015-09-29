class Rectangle
{
  float x;
  float y;
  float width;
  float height;
  color fill;
  
  void draw()
  {
    fill(fill);
    rect(x-width/2, y-height/2, width, height);
  }
  
  Boolean containsPoint(float test_x, float test_y)
  {
    if(test_x > x-width/2 && test_x < x+width/2 && test_y > y-height/2 && test_y < y+height/2)
    {
      return true;
    }
    
    return false;
  }
}