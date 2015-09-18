

class Rectangle
{
  float x;
  float y;
  float width;
  float height;
  
  void draw()
  {
    rect(x,y,width,height);
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