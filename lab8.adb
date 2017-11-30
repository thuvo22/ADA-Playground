WITH Ada.Text_Io;
USE Ada.Text_Io;
WITH Ada.Integer_Text_Io;
USE Ada.Integer_Text_Io;
WITH Ada.Float_Text_IO;
USE Ada.Float_Text_IO;

PROCEDURE Lab8 IS
   TYPE Score_Array_Type IS ARRAY (1 .. 500) OF Natural;
   --notice the subtype below
   SUBTYPE Name_Type IS String(1..25);
   --notice the array of strings below
   TYPE Name_Array_Type IS ARRAY (1 .. 500) OF Name_Type;
   Avg       : Float;
   Count,
   Sum       : Natural := 0;
   Top_Score : Natural;
   -------------------------------------------------------------------------------------
   PROCEDURE Get_Names_And_Scores (
         Scores_Fp :    OUT Score_Array_Type;
         Names_Fp  :    OUT Name_Array_Type;
         N_Fp      :    OUT Natural) IS
   --This reads both the name and score arrays and returns them to the main program
   BEGIN
      N_Fp := 0;
      WHILE NOT End_Of_File LOOP
         N_Fp := N_Fp + 1;
         Get(Item => Names_Fp (N_Fp));
         Get(Item => Scores_Fp (N_Fp));
      END LOOP;
   END Get_Names_And_Scores;
   ------------------------------------------------------------------------------------
  PROCEDURE Selection_Sort (
         Scores_Fp : IN OUT Score_Array_Type;
         N_Fp      : IN     Natural;
         Name_FP : IN OUT Name_Array_Type) IS
      --This sorts an array of scores
      Temp : Natural; --temporary element holding variable
      Temp2: Name_Type;
   BEGIN
      FOR I IN 1..N_Fp - 1 LOOP
         FOR J IN I+1 .. N_Fp LOOP
            IF Scores_Fp(I) < Scores_Fp(J) THEN
               Temp := Scores_Fp(I);
               Scores_Fp(I) := Scores_Fp(J);
               Scores_Fp(J) := Temp;
               Temp2:= Name_Fp(I);
               Name_FP(I):= Name_FP(J);
               Name_FP(J):= Temp2;
            END IF;
         END LOOP;
      END LOOP;
   END Selection_Sort;
   ------------------------------------------------------------------------------------
--   PROCEDURE Selection_Sort_Names (
--         Name_Fp : IN OUT Name_Array_Type;
--         N_Fp    : IN     Natural) IS
--      --This sorts an array of names
--      Temp : Name_Type; --temporary element holding variable
--   BEGIN
--      FOR I IN 1..N_Fp - 1 LOOP
--         FOR J IN I+1 .. N_Fp LOOP
--            IF Name_Fp(I) > Name_Fp(J) THEN
--               Temp := Name_Fp(I);
--               Name_Fp(I) := Name_Fp(J);
--               Name_Fp(J) := Temp;
--           END IF;
--         END LOOP;
--      END LOOP;
--   END Selection_Sort_Names;

   ------------------------------------------------------------------------------------
   PROCEDURE Print_Name_And_Score_Array (
         Names_Fp  : IN     Name_Array_Type;
         Scores_Fp : IN     Score_Array_Type;
         N_Fp      : IN     Natural) IS
   BEGIN
      --This shows how to use parallel arrays
   Put("Last Name");
   Set_Col(30);
   Put("Test Score");
   New_Line(2);
      FOR I IN 1.. N_Fp LOOP
         Put(Item => Names_Fp (I));
         Put(Item => "   ");
         Put(
            Item  => Scores_Fp (I),
            Width => 7);
         New_Line;
      END LOOP;
   END Print_Name_And_Score_Array;
   ------------------------------------------------------------------------------------

   --main program declaration section

   N,
   Top    : Natural;
   Scores : Score_Array_Type;
   Names  : Name_Array_Type;




BEGIN --main program
   --feel free to change whatever you'd like to achieve your desired solution
   --Are the names and scores correct after all sorting is finished?

   Get_Names_And_Scores(Scores, Names,N);
   Put("Original Input");
   New_Line(2);
   Print_Name_And_Score_Array(Names,Scores,N);
   New_Line(4);
   Selection_Sort(Scores,N, Names);--you will need to modify the selection sort procedure
-- Selection_Sort_Names(Names,N);
   Put("Sorted by Test Score:");
   New_Line(2);
   Print_Name_And_Score_Array(Names,Scores,N);

END Lab8;


