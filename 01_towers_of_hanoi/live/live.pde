// DID: whiteboard Tower of Hanoi
// DID: draw the board & pegs with magic numbers. woodish color = rgb(140, 115, 85)
// DID: refactor with variables and then change some around
// DID: draw the discs (use {0,0,0,0} for empty pegs)
// DID: detect which peg was clicked...OOPS. let's refactor into functions
// DID: detect which peg was clicked, add a variable for selectedRing, take disc off a peg
// DID: write code to put a disc down on a peg
// DID: explain the difference between pass-by-value and pass-by-reference
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
    //using the mouseX, figure out which column/peg we clicked on and pass that peg's
    //data to the appropriate put down / pick up
    if(mouseX > pegSpacing*i - discWidth*peg1.length/2 && mouseX < pegSpacing*i + discWidth*peg1.length/2)
    {
       if(selectedDisc == 0)
       {
          if(i == 1)
         {
           maybePickSomethingFrom(peg1);
         }else if(i == 2){
           maybePickSomethingFrom(peg2);
         }else{
           maybePickSomethingFrom(peg3);
         } 
       }else{
         if(i == 1)
         {
           maybePutSomethingDown(peg1);
         }else if(i == 2){
           maybePutSomethingDown(peg2);
         }else{
           maybePutSomethingDown(peg3);
         }
       }
       
    }
  }
}

//try to put a disc into the peg array that's passed in
void maybePutSomethingDown(int[] peg_data)
{
  for(int i = 0; i < peg_data.length; i++)
  {
    //test to see if we found an empty
    if(peg_data[i] == 0)
    {
      peg_data[i] = selectedDisc;
      selectedDisc = 0;
      return;
    }
  }
}

//try to pick something up from the peg array that's passed in
void maybePickSomethingFrom(int[] peg_data)
{
  //start at the top and work backwards
  for(int i = peg_data.length-1; i >= 0; i--)
  {
    
    //if we find a non-zero int, that's a ring. pick it up!
    if(peg_data[i] != 0)
    {
      println("PICK UP ITEM " + i);
      //pick up this disc
      selectedDisc = peg_data[i];
      peg_data[i] = 0;
      return;
    }
  }
  
 
}