
//what we want to type is something like:
// Color green = new Color(0,255,0);
class Color
{
  int r;
  int g;
  int b;
  
  Color(int red, int green, int blue)
  {
    r = red;
    g = green;
    b = blue;
  }
  
  
  void apply()
  {
    fill(r,g,b);
  }
  
}