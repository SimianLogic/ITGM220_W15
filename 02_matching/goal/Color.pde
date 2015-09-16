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