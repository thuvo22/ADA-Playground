with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
procedure Hello is
subtype Num_Range is Integer range 1..10;
Type Test_Character is array (Num_Range) of Character;

A: Test_Character;

begin
    for i in Num_Range loop 
    Get(A(i));
    Put(A(i)); --it will be Character with the range from 1 to 10. So you can get Integer, Float or String, as long as it fits 10 characters.
    Put(" ");
    end loop;
      
end Hello;
