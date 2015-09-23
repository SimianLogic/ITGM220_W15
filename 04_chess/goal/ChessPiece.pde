class ChessPiece extends Sprite
{
  int gridX = 0;
  int gridY = 0;
  
  Boolean isSelected = false;
      
  ChessPiece(String image_path, float center_x, float center_y, float width, float height)
  {
    super(image_path, center_x, center_y, width, height);
  }
  
}