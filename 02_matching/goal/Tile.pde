class Tile
{
  int value = 0;
  Boolean isFaceUp = false;
  Boolean isFinal = false;
  
  Tile(int start_value)
  {
    value = start_value;
  }
  
  void flip()
  {
    if(!isFinal)
    {
      isFaceUp = !isFaceUp;
    }
  }
}