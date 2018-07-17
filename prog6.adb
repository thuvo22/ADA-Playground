WITH Ada.Text_IO; USE Ada.Text_IO;
WITH Ada.Integer_Text_IO; USE Ada.Integer_Text_IO;
WITH Ada.Float_Text_IO; USE Ada.Float_Text_IO;

PROCEDURE Prog6 IS
   ------------------------------------------------------------------------------------
   --Name: Thu Vo
   --Class: CS 180-03
   --Program: Six
   ------------------------Program Description-----------------------------------------
   --The program computes and prints out the list of student's grade and the total grades
   --by eliminating the highest and the smallest grade of the list. It computes and prints
   --out the average of each grader's grades and the average of the total grades

   TYPE Grader_Type IS (Susue, Austin, Victor, Marie, Lilly, Hannah);
   PACKAGE Grader_Type_Io IS NEW Enumeration_Io(Enum=> Grader_Type);
   USE Grader_Type_Io;

   TYPE GradeAndAssign_Type IS ARRAY (1..50, Grader_Type) OF Integer;
   Type Average_Type is array (Grader_Type) of Float;
   Type Total_Array is array (1..50) of Float;

   SUBTYPE Assignment_size IS String(1..25);
   TYPE Assignment_Type IS ARRAY (1..50) OF Assignment_Size;
   TYPE Name_Length_Array IS ARRAY (1..50) OF Integer;


   TYPE Score_Max_Array IS ARRAY (1..50) OF Integer;
   TYPE Score_Min_Array IS ARRAY (1..50) OF Integer;

    PROCEDURE Get_Assign_And_Grade (
    Assignment_FP: OUT Assignment_Type;
    Name_Length_FP: OUT Name_Length_Array;
    Grade_Fp: OUT GradeAndAssign_Type;
          N_Fp: OUT Integer) IS

    -------------------------------Subprogram description----------------------------------
    --This subprogram gets the input of Assignment type and each grader's grade
    ---------------------------------Identifier Table--------------------------------------
    --Assignment_FP: Assignment type
    --Grade_Fp: Grade
    --Name_Length_FP: Name Length
    --N_Fp: Count
    BEGIN
       N_Fp:=0;
        WHILE NOT End_Of_File LOOP
           N_Fp:=N_fp+1;
     Get_Line(Assignment_FP(N_fp), Name_Length_Fp(N_fp));
     for I in Grader_Type loop
             Get(Grade_Fp(N_Fp,I));
       END LOOP;
           Skip_Line;
        END LOOP;

    END Get_Assign_And_Grade;

    PROCEDURE Get_Average(
    Grade: IN GradeAndAssign_Type;
    Average_Fp : OUT Average_Type;
          N_Fp: IN Integer) IS
    -------------------------------Subprogram description----------------------------------
    --This subprogram gets the average of each grader's grade
    ---------------------------------Identifier Table--------------------------------------
    --Average_Fp: Average
    --Grade_Fp: Grade
    --N_Fp: Count
       Total_Fp: Integer;
       Begin
       FOR I IN Grader_Type LOOP
          Total_Fp:=0;
          FOR J IN 1..N_Fp LOOP
             Total_Fp:= Grade(J,I)+ Total_Fp;
          END LOOP;
          Average_Fp(I):= Float(Total_Fp)/Float(N_Fp);
       END LOOP;
       end Get_Average;



   Procedure Get_Max_And_Min(Grade_FP: IN GradeAndAssign_Type;
      Smallest_In_Row: OUT Score_Min_Array ;
      Highest_In_Row: OUT Score_Max_Array;
         N_Fp: IN Integer) IS
    -------------------------------Subprogram description----------------------------------
    --This subprogram gets the Max and Min of each assignment's grade
    ---------------------------------Identifier Table--------------------------------------
    --Grade_Fp: Grade
    --Highest_In_Row: The highest grade in the row
    --N_Fp: Count
    --Smallest_In_Row: The smallest grade in the row
      Begin
      FOR I IN 1..N_Fp LOOP
         Smallest_In_Row(i):=Grade_FP(I,Grader_Type'Val(1));
         Highest_In_Row(i):= Grade_FP(I,Grader_Type'Val(1));
            FOR J IN Grader_Type LOOP
            IF Grade_FP(I,J) < Smallest_In_Row(I) THEN
                  Smallest_In_Row(I):= Grade_FP(I,J);

            Elsif Grade_FP(I,J) > Highest_In_Row(I) THEN
                  Highest_In_Row(I):= Grade_FP(I,J);

               END IF;
         End loop;

         END LOOP;

         end Get_Max_And_Min;

      PROCEDURE Get_Total(
         Grade_Fp: IN GradeAndAssign_Type;
         Smallest_In_Row: IN Score_Min_Array ;
         Highest_In_Row: IN Score_Max_Array;
         Total_Fp: OUT Total_Array;
            N_Fp: IN Integer) IS
    -------------------------------Subprogram description----------------------------------
    --This subprogram gets the total average excluded the max and min
    ---------------------------------Identifier Table--------------------------------------
    --Grade_Fp: Grade
    --Highest_In_Row: The highest grade in the row
    --N_Fp: Count
    --Smallest_In_Row: The smallest grade in the row
    --Total_Fp: Total Average excluded the smallest and highest
         Total_Temp: Integer;
         Begin
         FOR I IN 1..N_Fp LOOP
            Total_Temp:=0;
            FOR J IN Grader_Type LOOP
               Total_Temp:= Total_Temp+Grade_Fp(I,J);
            END LOOP;
            Total_Temp:= Total_Temp-Smallest_In_Row(I)-Highest_In_Row(I);
            Total_Fp(I):=Float(Total_Temp)/4.0;
         END LOOP;
      END Get_Total;

      FUNCTION Get_Class_Total(
         Total_Fp: Total_Array;
            N_Fp: Integer) RETURN Float IS

    -------------------------------Subprogram description----------------------------------
    --This subprogram gets average of the total average grades
    ---------------------------------Identifier Table--------------------------------------
    --N_Fp: Count
    --Total_Fp: sum of the total average grades
         Total_Temp: Float:=0.0;
      BEGIN
         FOR I IN 1..N_Fp LOOP
            Total_Temp:=Total_Temp+Total_Fp(I);
         END LOOP;
         RETURN Total_Temp/Float(N_Fp);
      END Get_Class_Total;




   PROCEDURE Print_Assignment_And_Grade
   (Assignment_FP: IN Assignment_Type;
    Name_Length_FP: IN Name_Length_Array;
      Grade_Fp: IN GradeAndAssign_Type;
      Total_Fp: IN Total_Array;
      Average_Fp : IN Average_Type;
      Total_Class_Fp: IN Float;
         N_Fp: IN Integer) IS
    -------------------------------Subprogram description----------------------------------
    --This subprogram prints out the list of student's grade and the total grades
    --by eliminating the highest and the smallest grade of the list. It computes and prints
    --out the average of each grader's grades and the average of the total grades

    ---------------------------------Identifier Table--------------------------------------
    --Assignment_FP: Assignment types
    --Average_Fp : Average grades of each grader
    --Grade_Fp: Grade
    --Name_Length_FP: Name Length
    --N_Fp: Count
    --Total_Class_Fp: Total average of the class
    --Total_Fp: Total Average excluded the smallest and highest
   BEGIN
      Put("Assignment");
      Set_Col(15);
      FOR I IN Grader_Type LOOP
         Put(I,10);
      END LOOP;
      Set_Col(75);
      Put("Total");
      New_line;
      Put("----------");
      Set_Col(15);
      For I in 1..7 loop
         Put("-----");
         Put("     ");
      END LOOP;
      New_Line;
      Set_Col(1);
      FOR I IN 1..N_Fp LOOP
      Set_Col(1);
      Put(Assignment_FP(I)(1..Name_Length_Fp(I)));
      Set_Col(15);
         FOR J IN Grader_Type LOOP
         Put(Grade_Fp(I,J),3);
         Put("       ");
         END LOOP;
         Set_Col(75);
         Put(Total_Fp(I),1,2,0);
      END LOOP;
      New_Line(2);

      Put("Averages per grader:");
      Set_Col(15);
      FOR I IN Grader_Type LOOP
         Put(Average_Fp(I),1,2,0);
         Put("     ");
      END LOOP;
      New_Line;
      Put("Total Class Score:");
      Set_Col(75);
      Put(Total_Class_Fp,1,2,0);


   END Print_Assignment_And_Grade;
---------------------------Declaration of main program---------------------------

   Assignment : Assignment_Type;       --Assignment types
   Average    : Average_Type;          --Average of each grader's grades
   Grade      : GradeAndAssign_Type;   --Grade
   Highest    : Score_Max_Array;       --The highest grade in the row
   Name_Length: Name_Length_Array;     --Name Length
   N          : Integer;               --Count
   Smallest   : Score_Min_Array;       --The smallest grade in the row
   Total      : Total_Array;           --Total average excluded the smallest and highest
   Total_Class: Float;                 --Average of the total average

BEGIN--Prog6 (Begin of main program)
   While not end_of_file loop
      Get_Assign_And_Grade (Assignment,Name_Length,Grade,N);
      Get_Average(Grade,Average,N);
      Get_Max_And_Min(Grade, Smallest, Highest,N);
      Get_Total(Grade,Smallest,Highest,Total,N);
      Total_Class :=Get_Class_Total(Total,N);
      Print_Assignment_And_Grade(Assignment,Name_Length,Grade,Total,Average,Total_Class,N);

   END LOOP;

END Prog6;--end of main program




