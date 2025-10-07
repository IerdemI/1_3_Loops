// ELEC2645 Unit 1 - Activity 3 - Loops
// Add the code to complete the steps below
// Ask the user how many integers they want to enter
// Then calculate the sum
// Keep the printf at the end for the bot to check your code

#include <stdio.h>

int main()
{
   int n;
   printf("Enter how many numbers to sum : ");
   // note the & before n - this is important!
   // we will learn about this later in the course
   scanf("%d", &n);

   int sum = 0;
   int x;
  
   for (int i = 0; i < n; i++) //i++ to increment 
    {
        printf("Enter number %d: ", i + 1);
        scanf("%d", &x);   
        sum += x;          
    }

   

   
   // leave this line as it - ELEC2645 Bot isnt smart enough to check anything else!
   printf("Sum = %d\n", sum); 

   return 0; // return zero to indicate the program ran ok
}
