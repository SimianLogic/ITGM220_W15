
//BoardPoint is a helper data structure. 
// to make a point at (5,5) it's no different than using 
//
// int[] point = new point[2];
// point[0] = 5;
// point[1] = 5;
//
// but now we can type
//
// BoardPoint point = new BoardPoint(5,5);
//
class BoardPoint
{
  int x;
  int y;
  
  BoardPoint(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  //return a new point offset by the values passed in
  BoardPoint offset(int offset_x, int offset_y)
  {
    return new BoardPoint(offset_x + x, offset_y + y);
  }
}