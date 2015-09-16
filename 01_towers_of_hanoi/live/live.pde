// DID: whiteboard Tower of Hanoi
// DID: draw the board & pegs with magic numbers. woodish color = rgb(140, 115, 85)
// DID: refactor with variables and then change some around
// DID: draw the discs (use {0,0,0,0} for empty pegs)
// DID: detect which peg was clicked...OOPS. let's refactor into functions
// DID: detect which peg was clicked, add a variable for selectedRing, take disc off a peg
// TODO: write code to put a disc down on a peg
// TODO: explain the difference between pass-by-value and pass-by-reference
// TODO: pseudo-code homework assignments on whiteboard

int[] peg1 = {4,3,2,1};
int[] peg2 = {0,0,0,0};
int[] peg3 = {0,0,0,0};

int selectedDisc = 0;

int baseY = 500;
int pegSpacing = 200;
int pegHeight = 250;
int pegWidth = 35;

int discHeight = 25;
int discWidth = 50;

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
  
  rect(0,baseY,800,100);
  
  for(int i = 1; i <= 3; i++)
  {
    rect(  pegSpacing*i - pegWidth/2, 
          baseY - pegHeight,
          pegWidth,
          pegHeight);
  }
  
  drawPeg(1, peg1);
  drawPeg(2, peg2);
  drawPeg(3, peg3);
  
  if(selectedDisc > 0)
  {
    fill(0,255,0);
    rect(400 - selectedDisc*discWidth/2, 100, discWidth*selectedDisc, discHeight);
  }
}

void drawPeg(int which_peg, int[] discs)
{
  for(int i = 0; i < discs.length; i++)
  {
    fill(0,255,0);
    
    if(discs[i] > 0)
    {
      //the width of an individual disc
      int temp_width = discWidth*discs[i];
      //draw a disc
      rect(pegSpacing*which_peg - temp_width/2, baseY - discHeight*(i+1), temp_width, discHeight);
    }
  } 
}

void mouseClicked()
{
  for(int i = 1; i <= 3; i++)
  {
    if(mouseX > pegSpacing*i - discWidth*peg1.length/2 && mouseX < pegSpacing*i + discWidth*peg1.length/2)
    {
       if(selectedDisc == 0)
       {
          selectedDisc = pickSomethingFrom(i); 
       }else{
         //putSomethingDown(i, selectedDisc);
       }
       
    }
  }
}

int pickSomethingFrom(int which_peg)
{
  if(which_peg == 1)
  {
    for(int i = peg1.length-1; i >= 0; i--)
    {
      if(peg1[i] != 0)
      {
        int disc = peg1[i];
        peg1[i] = 0;
        return disc;
      }
    }
  }
  
  return 0;
}