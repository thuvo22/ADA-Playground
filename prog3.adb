WITH Ada.Text_IO; USE Ada.Text_IO;
WITH Ada.Integer_Text_IO; USE Ada.Integer_Text_IO;
WITH Ada.Float_Text_IO;  USE Ada.Float_Text_IO;

PROCEDURE Prog3 IS

   ------------------------------------------------------------------
   --Name: Thu Vo
   --Class: CS 180-3
   --Program: Three
   ------------------------Program Description-----------------------
   --The program computes the price that
   --customers purchase in each item then adding together
   --to calculate the Total Price. The Change will be
   --calculated by the subtraction between Total Price and Payment.

   PROCEDURE Compute_Price(
      Num_Items_FP: IN Integer;
      Price_Item_FP: IN Float;
      Price_FP: OUT Float) IS
   ---------------------Subprogram description------------------------
   --This subprogram computes the Price based on the Price of each item
   --multiplied by the quatity of item.
   ---------------------Identifier Table------------------------------
   --Num_Items_FP : Number of Item
   --Price_Item_FP: Price of Item
   --Price_FP     : Price

   BEGIN---Compute Price
      Price_FP:= Float(Num_Items_FP)*Price_Item_FP;
      Set_Col(30);
      Put("$");
      Put(Price_FP,1,2,0);
   END Compute_Price;


   PROCEDURE Compute_Total_Price(Price_FP: IN Float;
                                 Total_Price_FP: IN OUT Float) IS
   ---------------------Subprogram description-------------------------
   --This subprogram computes the Total Price of each customer by summing
   --the previous Prices.
   -----------------------Identifier Table-----------------------------
   --Price_FP      : Price
   --Total_Price_FP: Total Price calculated based on the previous Total
   --Price and Price.
   BEGIN--Compute Total Price
         Total_Price_FP:= Total_Price_FP+Price_FP;
   End Compute_Total_Price;
--------------------------------------------------------
   FUNCTION Compute_Change(Payment_FP:Float;
                           Total_Price_FP: Float)-- Compute Change.
         RETURN Float IS
    ---------------------------Subprogram description----------------------------------
    --This subprogram computes the Change based ont the subtraction between Payment
    --and Total Price.
    ---------------------------------Identifier Table------------------------------------------
    --Payment_FP    : Payment made by customer
    --Total_Price_FP: Total Price calculated based on the previous Total Price and Price.
    --Change_Fp     : Change calculated by Total Price and Payment

         Change_Fp: Float;
         Begin
            Change_FP:= Payment_FP-Total_Price_FP;
            RETURN Change_Fp;
     End Compute_Change;
--------------------------------------------------------------------------------------------
   PROCEDURE First_Statement(Num_Items_FP: IN Integer;
         Price_Item_FP: IN Float) IS

    -------------------------------Subprogram description----------------------------------
    --This subprogram prints out the first statement including Number of Item and its price
    ---------------------------------Identifier Table--------------------------------------
    --Num_Items_FP   : Number of item in the data
    --Price_Item_FP  : Price of each item that calculated above

   BEGIN-- Statement of number items and the price for each item.
      New_Line;
      Set_Col(3);
      Put(Num_Items_FP,1);
      Put(" items at $");
      Put(Price_Item_FP,1,2,0);
   END First_Statement;
---------------------------------------------------------------------------------------------
   PROCEDURE Customer(Count_FP: IN Integer) IS
    -------------------------------Subprogram description----------------------------------
    --This subprogram prints out the customer number in order.
    ---------------------------------Identifier Table--------------------------------------
    --Count_FP: An integer identifier which attached to customer numbers.

   BEGIN--Customer number
      Put("Customer #");
      Put(Count_FP,1);
   END Customer;
---------------------------------------------------------------------------------------------

   PROCEDURE Output_Result(Total_Price_FP, Payment_FP: IN Float; Change_FP: IN Float ) IS
    -------------------------------Subprogram description----------------------------------
    --This subprogram prints out the Total Price, Payment received and Change.
    ---------------------------------Identifier Table--------------------------------------
    --Payment_FP    : Payment made by customer
    --Total_Price_FP: Total Price calculated based on the previous Total Price and Price.
    --Change_Fp     : Change calculated by Total Price and Payment

BEGIN--Output of Total, Received and Change.
   Set_Col(30);
   Put("------");
   New_Line;
   Set_Col(3);
   Put("Total: ");
   Set_Col(30);
   Put("$");
   Put(Total_Price_FP,1,2,0);
   New_Line;
   Set_Col(3);
   Put("Received: ");
   Set_Col(30);
   Put("$");
   Put(Payment_FP,1,2,0);
   New_Line;
   Set_Col(3);
   Put("Change: ");
   Set_Col(30);
   Put("$");
   Put(Change_FP,1,2,0);
   New_Line(2);
   End Output_Result;

--------------------------Declaration of main program-------------------------------

   Change      : Float;                  --Change calculated by Total Price and Payment
   Count       : Integer:=1;             --Count for Customer number
   Num_Items   : Integer;                --Number of Item
   Payment     : Float;                  --Payment made by customer
   Price       : Float;                  --Price
   Price_Item  : Float;                  --Price of Item
   Sentinel    : Integer:=-9;            --Loop exits when Num_Item reached -9
   Sentinel2   : CONSTANT Integer:=-999; --Loop exits when Num_Item reached -999
   Total_Price : Float:=0.0;             --Total Price calculated
   -------------------------------------------------------------------------------------
BEGIN--Prog3(begin of main program)
   LOOP
      Total_Price:= 0.0;
      Get(Num_Items);
      EXIT WHEN Num_Items= Sentinel2;
      Get(Price_Item);
      Customer(Count);
      Count:=Count+1;
      LOOP
         First_Statement(Num_Items, Price_Item);
         Compute_Price(Num_Items, Price_Item, Price);
         Compute_Total_Price(Price, Total_Price);
         Get(Num_Items);
         EXIT WHEN Num_Items= Sentinel;
         Get(Price_Item);
      END LOOP;
         Get(Payment);
         Change:=Compute_Change(Payment, Total_Price);
         Output_Result(Total_Price, Payment, Change);
   END LOOP;
END Prog3;--end of main program

