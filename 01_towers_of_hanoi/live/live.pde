int[] peg_1 = {4,3,2,1};
int[] peg_2 = {0,0,0,0};
int[] peg_3 = {0,0,0,0};

int selectedDisk = 0;

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
  fill(180,180,180);
  rect(0,0,800,600);
  
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
  
  drawPeg(1, peg_1);
  drawPeg(2, peg_2);
  drawPeg(3, peg_3);
  
  if(selectedDisk > 0)
  {
    fill(0,255,0);
    rect(400 - selectedDisk*disc_width/2, 100, disc_width*selectedDisk, disc_height);
  }
}

void drawPeg(int which_peg, int[] disks)
{
  for(int i = 0; i < disks.length; i++)
  {
    fill(0,255,0);
    
    if(disks[i] > 0)
    {
      //the width of an individual disc
      int temp_width = disc_width*disks[i];
      //draw a disc
      rect(peg_spacing*which_peg - temp_width/2, base_y - disc_height*(i+1), temp_width, disc_height);
    }
  } 
}

void mouseClicked()
{
  for(int i = 1; i <= 3; i++)
  {
    if(mouseX > peg_spacing*i - disc_width*peg_1.length/2 && mouseX < peg_spacing*i + disc_width*peg_1.length/2)
    {
       if(selectedDisk == 0)
       {
          selectedDisk = pickSomethingFrom(i); 
       }else{
         putSomethingDown(i, selectedDisk);
       }
       
    }
  }
}

int putSomethingDown(int which_peg, int disc_value)
{
  
}

int pickSomethingFrom(int which_peg)
{
  if(which_peg == 1)
  {
    for(int i = peg_1.length-1; i >= 0; i--)
    {
      if(peg_1[i] != 0)
      {
        int disk = peg_1[i];
        peg_1[i] = 0;
        return disk;
      }
    }
  }
  
  return 0;
}