WITH Ada.Text_IO; USE Ada.Text_IO;
WITH Ada.Integer_Text_IO; USE Ada.Integer_Text_IO;
WITH Ada.Float_Text_IO;  USE Ada.Float_Text_IO;

PROCEDURE Prog4 IS
   ------------------------------------------------------------------------------------
   --Name: Thu Vo
   --Class: CS 180-3
   --Program: Four
   ------------------------Program Description-----------------------------------------
   --The program computes and prints out the Final Price of each guest based on their
   --age, basic rate, nights and tax.

   PROCEDURE Type_Price(Price_FP : OUT Float; Room_Type_FP: IN Character) IS
    -------------------------------Subprogram description----------------------------------
    --This subprogram assigns the prices of each room to its initial character
    ---------------------------------Identifier Table--------------------------------------
    --Price_FP    : Price of each room
    --Room_Type_FP: Type of room

   BEGIN
      Case Room_type_Fp is
         when 'S'
              => Price_FP:=50.0;
         when 'D'
              => Price_FP:=75.0;
         when 'H'
              => Price_FP:=100.0;
         when 'F'
               => Price_FP:=150.0;
         WHEN OTHERS
            =>Null;
      END case;
   END Type_Price;

   PROCEDURE Basic_Rate_PP(Basic_Rate_FP: OUT Float; Age_FP: IN Integer) IS
    ---------------------------Subprogram description----------------------------------
    --This subprogram assigns the basic rate to the particular ages
    ------------------------------Identifier Table-------------------------------------
    -- Age_FP       : Age of guest
    -- Basic_Rate_FP: Basic rate of each guest based on age

      Begin
         Case Age_FP is
         when 21..30
               =>Basic_Rate_FP:=1.2;
         when 31..40
               => Basic_Rate_FP:=1.05;
         when 41..60
               => Basic_Rate_FP:= 0.9;
         when 61..100
               => Basic_Rate_FP:=0.75;
         when others
               => Null;
      END case;
   END Basic_Rate_PP;

 FUNCTION Final_Price(Price_FP:Float;Num_Night_FP: Integer;Basic_Rate_FP: Float) RETURN Float IS
 -------------------------------Subprogram description--------------------------------------
  --This subprogram calculates the Final Price based on number of nights, basic rate and tax
 ----------------------------------Identifier Table-------------------------------------
  --Basic_Rate_FP: The basic rate based on guest's age
  --Num_Night_FP : Number of nights that the guest stays
  --Price_FP     : Price of each night

    Final_Price_FP: Float;

         Begin
            Final_Price_FP:= Price_FP*Float(Num_Night_FP)*Basic_Rate_FP+((Price_FP*Float(Num_Night_FP)
               *Basic_Rate_FP)*7.9/100.0);
            RETURN Final_Price_FP;
         END Final_Price;


         PROCEDURE Output_Result(Final_Price_FP: IN Float; Room_Type_FP: IN Character;
               Num_Night_FP, Count_FP, Age_FP: IN Integer) IS
  -------------------------------Subprogram description----------------------------------
  --This subprogram prints out the format and results
  ----------------------------------Identifier Table-------------------------------------
  --Age_FP        : Age of the guests
  --Count_FP      : Counter of guests
  --Final_Price_FP: Final Price after tax and basic rate
  --Num_Night_FP  : Number of nights
  --Room_Type_FP  : Type of rooms

         BEGIN
            IF Age_FP>=21
           THEN
            New_line;
            Put("=================================================");
            New_line;
            Put("Guest #");
            Put(Count_FP,1);
            Set_Col(5);
            Put("Room Type");
            Set_Col(18);
            Put("Age");
            Set_Col(31);
            Put("Nights");
            Set_Col(44);
            Put("Total");
            New_Line;
            Set_Col(5);
               Case Room_Type_FP is
               when 'S'
                   => Put("Single");
               when 'D'
                   => Put("Double");
               when 'H'
                   => Put("Half Cabin");
               when 'F'
                   => Put("Full Cabin");
               WHEN OTHERS
                   => NULL;
            END case;
            Set_Col(18);
            Put(Age_FP,1);
            Set_Col(31);
            Put(Num_Night_FP,1);
            Set_Col(44);
            Put("$");
            Put(Final_Price_FP,1,2,0);
            ELSE
               New_line;
               Put("=================================================");
               New_line;
               Put("Guest #");
               Put(Count_FP,1);
               New_Line;
               Put("Persons under 21 cannot rent a room!");
               END IF;
END Output_Result;

---------------------------Declaration of main program------------------------------------

   Age           : Integer;             --Age of guest
   Basic_Rate    : Float;               --Basic Rate
   Count         : Integer:=0;          --Counter of guest
   FinalPrice    : Float;               --Final Price after tax and basic rate
   Head_Record   : Integer;             --Counter to count the number of executions
   Num_Night     : Integer;             --Number of nights
   Price         : Float;               --Price of each room for a night
   Room_Type     : Character;           --Type of room




BEGIN--Prog4 (Begin of main program)
   Get(Head_Record);
   Put("BABBAGE ISLAND INN GUEST BILLS");
   FOR I IN 1.. Head_Record LOOP
      Count:=Count+1;
      Get(Room_Type);
      Get(Age);
      Get(Num_Night);
      Type_Price(Price,Room_Type);
      Basic_Rate_PP(Basic_Rate, Age);
      FinalPrice:=Final_Price(Price,Num_Night,Basic_Rate);
      Output_Result(FinalPrice,Room_Type, Num_Night,Count, Age);
   END LOOP;


END Prog4;--end of main program

