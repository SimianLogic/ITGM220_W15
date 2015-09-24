class Tile
{
  int value;
  Boolean isFaceUp = false;
  Boolean isFinal = false;
  
  Tile(int start_value)
  {
    value = start_value;
  }
  
  void flip()
  {
    isFaceUp = !isFaceUp;
  }
  
}