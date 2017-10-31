
WITH Ada.Text_Io;
USE Ada.Text_Io;
WITH Ada.Integer_Text_Io;
USE Ada.Integer_Text_Io;
--WITH Ada.Float_Text_IO;
--USE Ada.Float_Text_IO;

PROCEDURE Lab10 IS
   TYPE Day_Type IS
         (Sunday,
          Monday,
          Tuesday,
          Wednesday,
          Thursday,
          Friday,
          Saturday);
   SUBTYPE Name_Type IS String(1..25);
   TYPE Run_Array_Type IS ARRAY (Day_Type) OF Natural;

   TYPE Person_Rec_Type IS
      RECORD
         Name        : Name_Type;
         Name_Length : Natural;
         Miles_Array : Run_Array_Type;
      END RECORD;

   PACKAGE Day_Type_Io IS NEW Enumeration_IO
      (Enum=>Day_Type);
   USE Day_Type_IO;
   -------------------------------------------------------------------------------------
   PROCEDURE Get_A_Record (
         Runner_FP :    OUT Person_Rec_Type) IS
   BEGIN
      Get_Line(Runner_FP.Name,Runner_FP.Name_Length);
      FOR I IN Day_Type LOOP
         Get(Runner_Fp.Miles_Array(I));
      END LOOP;
      Skip_Line;
   END Get_A_Record;


   --------------------------------------------------------------------------------------

   PROCEDURE Print_A_Record( Runner_Fp : IN Person_Rec_Type) IS
   BEGIN
      set_col(1);
      Put (Runner_Fp.Name(1..Runner_Fp.Name_Length));
      set_col(15);
         FOR J IN Day_Type LOOP
         Put(Runner_Fp.Miles_Array(J),2);
         put("        ");
         END LOOP;

   END Print_A_Record;
   ----------------------------------------------------------------------------------------
   PROCEDURE Print_Headings IS
   BEGIN
      Put("NAME:       ");
      FOR I IN Day_Type LOOP
         Put(I,10);
      END LOOP;

      New_Line(3);
   END Print_Headings;

   ------------------------------------------------------------------------------------

   --main program declaration section


   Runner : Person_Rec_Type;


BEGIN --main program
   Print_Headings;
   WHILE NOT End_Of_File LOOP
      Get_A_Record(Runner);
      Print_A_Record(Runner);
   END LOOP;

END Lab10;
