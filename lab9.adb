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
   PACKAGE ASSIGNMENT_TYPE_IO IS NEW Enumeration_IO(Enum=>ASSIGNMENT_TYPE);

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
      Set_Col(36);
      FOR I IN  Assignment_Type  LOOP
         Put (I);
         Put("   ");
      END LOOP;
       New_Line;
         FOR Student_Index IN 1.. N_Fp LOOP
         Put(Names_Fp(Student_Index)(1..Name_Length(Student_Index)));
         Put("  ");
         Set_Col(34);
         FOR Score_Index IN Assignment_Type LOOP
            Put(Scores_Fp(Student_Index, Score_Index),4);
            Put("     ");
         END LOOP;
         New_Line;
         END LOOP;



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

