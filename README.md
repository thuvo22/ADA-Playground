Program Assignment:
The library at ACME University would like a way to keep track of its users who have incurred overdue fines and the amount they owe.  Given a list of names, book types, and days overdue, write a program that will produce two lists of information.  The first will be a list of names, followed by the amount owed, in descending order by fine amount. The second will be an alphabetical list of names and corresponding fine information (type of book, days overdue, total amount of fine).  Fines are computed based on the following:
		General (G)	$0.15 per day (prorated)
		Reserve (R)	$0.25 per hour (prorated)
Note that Reserve fines are calculated based on 24 hr/day, regardless of the library’s hours.

The data file, posted on Blackboard, will consist of a name (string of length 20) followed by the type of book (character:  G or R—no space between the name and the book code) and days overdue (float).   Your program should work for any number of customers.

Sample Input:
Doe, John           G 2.3
Smith, Sue          R 0.1
Rogers, Scott      R 1.7

Required Output Format:

Customers Listed in Order of Fines (highest to lowest)
NAME				                           FINE
===========================================
Rogers, Scott		           $ 10.20nkfdngvkngvd
Smith, Sue		           $   0.60
Doe, John 		           $   0.35Typ
<3 blank lines>
NAME		TYPE		DAYS		FINE
===========================================
Doe, John	General	2.3                  $   0.35	
Rogers, Scott	Reserve	1.7	            $  10.20     
Smith, Sue	Reserve	0.1                  $   0.35	


Remember to turn in your adb file via Blackboard.  

Requirement Checklist:
Your program code must contain each of the following.  Failure to include one will result in a redo.
__Banner Section (in main and all subprograms)				
__Use of Parallel Arrays 	
__Sort Routine				
__Modular Design—in increasing levels.  Your main program, from this program on, should consist mainly of            subprogram calls.
__At least one of each subprogram type (function and procedure)
