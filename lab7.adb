WITH Ada.Text_Io;
USE Ada.Text_Io;
WITH Ada.Integer_Text_Io;
USE Ada.Integer_Text_Io;
WITH Ada.Float_Text_Io;
USE Ada.Float_Text_Io;
PROCEDURE Lab7 IS


   PROCEDURE Compute_Charges (Num_Pizzas_FP : IN Integer;
             Bulldog_Charge_FP: IN OUT Float;
             Osteopathic_Charge_FP : IN OUT Float) IS

   BEGIN

 Case Num_Pizzas_FP is
      when 1
         =>Bulldog_Charge_FP:=8.0;

    when 2
         =>Bulldog_Charge_FP:= 8.0 * Float(Num_Pizzas_FP) -1.0;
      when 3
         =>Bulldog_Charge_FP:= 8.0 * Float(Num_Pizzas_FP) -3.0;
      when 4
         =>Bulldog_Charge_FP:= 8.0 * Float(Num_Pizzas_wwFP) -6.0;
      when 5
         =>Bulldog_Charge_FP:= 8.0 * Float(Num_Pizzas_FP) -10.0;
      when others
         =>Bulldog_Charge_FP:= 30.0+((Float(Num_Pizzas_FP)-5.0)*3.0);

      END case;

      case Num_Pizzas_FP is
      when 1
         =>Osteopathic_Charge_FP:=6.50;
      when 2..3
         =>Osteopathic_Charge_FP:=6.50*Float(Num_Pizzas_FP);
      when 4..6
         =>Osteopathic_Charge_FP:=19.5 +5.00*(Float(Num_Pizzas_FP)-3.0);
      when 7..9
         =>Osteopathic_Charge_FP:=34.5+3.50*(Float(Num_Pizzas_FP)-6.0);
      when others
         =>Osteopathic_Charge_FP:=45.0+((Float(Num_Pizzas_FP)-9.0)*2.0);
      END case;

        New_Line;
   END Compute_Charges;
   PROCEDURE Output_Results (
         Num_Pizzas_FP         : IN     Integer;
         Bulldog_Charge_FP,
         Osteopathic_Charge_FP : IN     Float) IS
      -------------------------------------------------------------------------------
      --Preconditions:  This procedure receives the data to be output
      --Postconditions:  The data, along with appropriate labeling messages, are printed.
      -------------------------------------------------------------------------------
   BEGIN
      New_Line;
      Put("The number of pizzas ordered:  ");
      Put(Num_Pizzas_FP,1);
      New_Line;
      Put("Bulldog Pizza charges:  $");
      Put(Bulldog_Charge_FP,1,2,0);
      New_Line;
      Put("Osteopathic Pizza Charges:  $");
      Put(Osteopathic_Charge_FP,1,2,0);
      New_Line;
      IF Bulldog_Charge_FP < Osteopathic_Charge_FP THEN
         Put("Bulldog Pizza is less expensive.");
      ELSIF (Osteopathic_Charge_FP < Bulldog_Charge_FP) THEN
         Put("Osteopathic Pizza is less expensive.");
         New_Line;
      ELSE
         Put("The charges are equal.");
         New_Line;
      END IF;
      New_Line;

   END Output_Results;


   ----------------------declaration section for main program-------------------------


   Num_Pizzas         :  Integer;          --Number of Pizzas Purchased
   Bulldog_Charge     :  Float:=8.0;
   Osteopathic_Charge :  Float:=6.0;       --Charges  for Bulldog Pizza and Osteopathic Pizza
   Header             :  Integer;

   -----------------------------------------------------------------------------------
BEGIN --Lab7 (begin of main program)

   Get(Header);
   FOR I IN 1..Header LOOP
     Get(Num_Pizzas);
     --Compute_Charges();  --You need to complete this procedure which computes and returns the price charged by both stores
     Compute_Charges(Num_Pizzas,Bulldog_Charge,Osteopathic_Charge);
     Output_Results(Num_Pizzas, Bulldog_Charge, Osteopathic_Charge);
   END LOOP;
   New_Line;

   Put("Thank you for using this program.  Have a nice day!");
   New_Line;
END Lab7; -- (end of main program)
