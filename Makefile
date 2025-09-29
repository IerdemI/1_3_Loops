# makefile for building the program. Each of these can be run from the command line like "make loops.out".
# "make clean" deletes the exectuable to build again 
# "make test" builds the main file and then runs the test script. This is what the autograder uses
# 
# Note to students: You dont need to fully understand this! 

loops.out:
	gcc loops.c -o loops.out

clean:
	-rm loops.out

test: clean loops.out
	bash test.sh
