final int MY_CONSTANT = 10;
IntList my_array = new IntList();

for(int i = 0; i < MY_CONSTANT; i++)
{
  my_array.append(i);
}

println(my_array);

my_array.set(4, 25);

println(my_array);