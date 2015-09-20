class Tile
{
  int value = 0;
  Boolean isFaceUp = false;
  Boolean isFrozen = false;
  
  Tile(int start_value)
  {
    value = start_value;
  }
  
  void flip()
  {
    if(!isFrozen)
    {
      isFaceUp = !isFaceUp;
    }
  }
}