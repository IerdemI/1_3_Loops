# ELEC2645 Unit 1.1 Activity 3 - Loops

For loops let you repeat code a fixed number of times. A reminder of the syntax :

```c
// for (code run at the start; condition for loop to run; code run after every loop)
for ( int i = 0 ; i < n ;  i++)
{
    //stuff that runs n times 
}
```
This creates variable `i` and initialises it to 0. `i < n` sets the condition for running the code i.e. the code will run whilst this condition is true, and `i++` increments the variable and is run after every loop. 

In this task we will implement a for loop and read some user input using scanf(). For example to read into an integer variable `n` we use 
```c
int n;
scanf("%d", &n);
```
Note the `%d` format specifier for an integer is the same as in `printf()`. The symbol `&` means "address of" such that `&n` means  "the address of n", we need to pass this to `scanf` in order for it to change the value of `n`. We will go into more detail later in the course, for now its enough to know that we get an error if we don't! 

### 1 Run code
The program `loops.c` needs compiling before it can run. In the terminal you can type `gcc loops.c -o loops.out` and then `./loops.out` to run the new program

### 2 The assignment
Ask the user how many numbers they want to add. Then ask for each number in turn, then return the sum. Your terminal should look something like this: 

```c
Enter how many numbers: 3
Enter a number: 4
Enter a number: 5
Enter a number: 6
Sum = 15 // this line must match
```
Please match the last line text `Sum = N` exactly as ELEC2645 Bot is not that smart!

Check your solution works by testing a few different combinations of inputs.

### 3 Test command
In the terminal run `make test` which will build `loops.c` to create `loops.out` if not done already, then run the test script `test.sh`

### 4 Submit Solution
Once you have solved the task, you must submit the changes so the autograder runs. To do this you must commit changes and then publish them to the repository. 

To do this:
- Switch to `Source Control` tab on the left hand side
- Stage the files you have changed by clicking `+`
- Type a _meaningful_ commit message in the text box then hit `Commit`
- Hit `Sync Changes` to send updates to to the remote repository on github
- The autograder will run in the background, you can check the results on the repository page