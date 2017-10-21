with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; Use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; Use Ada.Float_Text_IO;

procedure Hello is
    subtype Number_Range is Integer range 1..10;
    Type Value_Array is array (Number_Range) of Integer;
    Value: Value_Array;

begin

       for Number in Number_Range loop
       Get(Value(Number));
       end loop;
       
       for Number in reverse Number_Range loop
       Put(Value(Number));
       New_Line;
       end loop;
       
end Hello;
