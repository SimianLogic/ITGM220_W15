size(800,600);

int base_y = 500;
int peg_spacing = 200;
int peg_height = 250;
int peg_width = 50;


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