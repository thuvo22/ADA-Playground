
CS 180	Program 6	Full Points Cutoff Date: 11/13/17

This Program Covers :  Two-Dimensional Arrays, Parallel One-Dimensional arrays,  the Get_Line procedure, Enumerated Data Types,  Enumerated Data Type subscripts, Testing, and test data file creation.

Program Assignment:
Dr. Acme, the professor from Babbage University, is not grading any assignments from his class.  Instead, he gives the assignments to his six office workers to grade.  A student’s grade for a single assignment is the average of the grades given by the office workers.  Since Dr. Acme is worried that one of his staff may be biased for or against a student, he throws out the highest and lowest scores before averaging.  The total grade in his class is the average of the grades on each assignment.  He has asked you to create a program to help each student determine his/her grade per assignment, as well as the total class grade.  He also wants a report of the average scores given by each grader.  Note that the program only keeps track of one student's set of scores.

The data file will consist of:  the name of the assignment (on a record by itself), followed by the six grades received on the assignment (in a consistent order—i.e. grader #1 will always be first, grader #2 second, etc).  There may be any number of assignments given in the class (will not exceed 50).  You may assume that no assignment description will be longer than 30 characters.  

Please create your own test data file for this assignment.  Make sure your code is written in general.  You must use the Get_Line procedure and a two-dimensional array column indexed by the six graders' names (as an enumerated data type.)  You may use numbers for the row indexes.   You need to output the enumerated type subscripts themselves (not as strings.)  Don't forget, you need the following statement to do I/O of enumerated data type literals:

                package My_Enumeration_IO is new Ada.Text_IO.Enumeration_IO(My_Enumeration_Type);
                use My_Enumeration_IO;

Use the graders’ names as the enumeration type literals for the column index.

This "instantiating a generic package" statement should be placed after the type definitions but before the subprograms and declaration section in the main program.  

Sample Data:
Homework #1 – pg 320
87 92 84 77 95 86
Lab #1 – the ‘For’ loop
100 99 86 94 92 88

Required Output Format:
Assignment	Susie	Austin	Victor	Marie	Lilly	Hannah	Total
---------------	---------	---------	---------	--------	---------	---------	-------
Homework #1 – pg 320	87	92	84	77	95	86	87.25
Lab #1 – the ‘For’ loop	100	99	86	94	92	88	93.25

Averages per grader:	93.5	95.5	85.0	85.5	93.5	87.0
Total Class Score:	90.25


Requirement Checklist:
Your program code must contain each of the following.  Failure to include one will result in a redo.
__Banner Section	(in main and all subprograms)
__Enumerated Data Type
__Two-Dimensional Array indexed by an enumerated data type
__Output of enumerated data type literals (generic package instantiation)
__Parallel One-Dimensional Array
__Use of Get_Line procedure
__Significant Modular Design (the main program should consist almost entirely of subprogram calls)
__Data File Creation
__Testing
