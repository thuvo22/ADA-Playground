--CS 180          Lab 9                                                                 Due by beginning of class on Friday, 10/27/17

--This lab investigates enumerated data types, two-dimensional arrays, parallel one-dimensional arrays, the Get_Line procedure, and I/O of enumerated data types.

--Your task is to first, understand the code provided below.  Then modify the following code to print the column headings (as enumerated types, not strings) above their respective data in the two-dimensional array.

--Each record of the input file (an initial test file is provided on Blackboard) consists of 5 scores:  a program score, quiz score, homework score, lab score, test score, and student name, in this order.  Of particular note, is the fact that the names are not any specific length and they do not have blanks appended to make them uniform length.

--The program below reads all the data, stores it in the appropriate data structures.  You need to complete the procedure that outputs the data.  One of the things you’ll need to do is figure out how to make the column headings (PROGRAM, QUIZ, HOMEWORK, LAB, TEST) appear above their respective columns as you print the two-dimensional array; note that you must output the enumerated type as the enumerated type, itself and not convert it to a string before output.





WITH Ada.Text_Io;
USE Ada.Text_Io;
WITH Ada.Integer_Text_Io;
USE Ada.Integer_Text_Io;
WITH Ada.Float_Text_IO;
USE Ada.Float_Text_IO;

PROCEDURE Lab9 IS
   TYPE Assignment_Type IS
         (Program,
          Quiz,
          Homework,
          Lab,
          Test);
   --two-dimensional array type definition
   TYPE Score_Array_Type IS ARRAY (1 .. 100, Assignment_Type) OF Natural;
   --array of strings
   SUBTYPE Name_Type IS String(1..25);
   TYPE Name_Array_Type IS ARRAY (1 .. 100) OF Name_Type;
   --what is the purpose of this array type?
   TYPE Name_Length_Array_Type IS ARRAY (1 .. 100) OF Natural;
   --instantiate the generic package to do I/O of Assignment_Type literals

--complete the statement below
   PACKAGE ASSIGNMENT_TYPE_IO IS NEW 

   USE ASSIGNMENT_TYPE_IO;
   -------------------------------------------------------------------------------------
   PROCEDURE Get_Names_And_Scores (
         Scores_Fp       :    OUT Score_Array_Type;
         Names_Fp        :    OUT Name_Array_Type;
         Name_Lengths_Fp :    OUT Name_Length_Array_Type;
         N_Fp            :    OUT Natural) IS
      BLANK : CHARACTER;
   BEGIN
      N_Fp := 0;
      WHILE NOT End_Of_File LOOP
         N_Fp := N_Fp + 1;
         FOR Col_INDEX IN ASSIGNMENT_Type LOOP
            Get(SCORES_FP(N_FP,COL_INDEX));
         END LOOP;
         GET(BLANK);
         Get_Line(
            Names_Fp (N_Fp),
            Name_Lengths_Fp (N_Fp));
      END LOOP;
   END Get_Names_And_Scores;
   --------------------------------------------------------------------------------------

   PROCEDURE Print_Name_And_Score_Arrays (
         Names_Fp    : IN     Name_Array_Type;
         Scores_Fp   : IN     Score_Array_Type;
         NAME_LENGTH : IN     NAME_LENGTH_ARRAY_TYPE;
         N_Fp        : IN     Natural) IS
   BEGIN

--complete this procedure so that it outputs each student’s name followed by all their scores
--don’t forget to output, as an enumerated data type, the column heading label (program, quiz, homework, etc) 
--above its respective score.  Good luck!!

   END Print_Name_And_Score_Arrays;

   ------------------------------------------------------------------------------------

   --main program declaration section


   N            : Natural;
   Scores       : Score_Array_Type;
   Names        : Name_Array_Type;
   Name_Lengths : Name_Length_Array_Type;



BEGIN --main program
   Get_Names_And_Scores(Scores, Names,Name_Lengths,N);
   Print_Name_And_Score_Arrays(Names,Scores,NAME_LENGTHS,N);
END Lab9;

