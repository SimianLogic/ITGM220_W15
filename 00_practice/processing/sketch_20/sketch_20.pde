boolean[][] tiles;

void setup()
{
   size(800,600);
   frameRate(15);
   
   tiles = new boolean[4][4];
   for(int i = 0; i < 4; i++)
   {
     for(int j = 0; j < 4; j++)
     {
       tiles[i][j] = getRandomBoolean();
     }
   }
}

boolean getRandomBoolean()
{
  if(random(1) > 0.5)
  {
    return true;
  }
  return false;
}

void draw()
{
  fill(128,128,128);
  rect(0,0,800,600);
  
  for(int i = 0; i < 4; i++)
   {
     for(int j = 0; j < 4; j++)
     {
       tiles[i][j] = getRandomBoolean();
     }
   }
  
  for(int i = 0; i < 4; i++)
  {
   for(int j = 0; j < 4; j++)
   {
     if(tiles[i][j])
     {
       fill(255,255,255);
     }else{
       fill(0,0,0);
     }
     rect(200*i,150*j,200,150);
   }
 }
}