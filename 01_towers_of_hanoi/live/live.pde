int[] peg_1 = {4,3,2,1};
int[] peg_2 = {0,0,0,0};
int[] peg_3 = {0,0,0,0};

int base_y = 500;
int peg_spacing = 200;
int peg_height = 250;
int peg_width = 35;

int disc_height = 25;
int disc_width = 50;

void setup()
{
  size(800,600);
}

void draw()
{
   //rgb(140, 115, 85)
  fill(140, 115, 85);
  
  rect(0,base_y,800,100);
  
  for(int i = 1; i <= 3; i++)
  {
    rect(  peg_spacing*i - peg_width/2, 
          base_y - peg_height,
          peg_width,
          peg_height);
  }
  

  
  for(int i = 0; i < peg_1.length; i++)
  {
    fill(0,255,0);
    
    //the width of an individual disc
    int temp_width = disc_width*peg_1[i];
    //draw a disc
    rect(peg_spacing*1 - temp_width/2, base_y - disc_height*(i+1), temp_width, disc_height);
  } 
}

void mouseClicked()
{
  for(int i = 1; i <= 3; i++)
  {
    if(mouseX > peg_spacing*i - disc_width*peg_1.length/2 && mouseX < peg_spacing*i + disc_width*peg_1.length/2)
    {
      println(i);
    }
  }
  
}