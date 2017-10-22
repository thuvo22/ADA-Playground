with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
procedure Hello is

Subtype Names_Type is String(1..20); --anonynmous type so (1..20) is not the range
Type Names_Type_Array is array (1..100) of Names_Type;
Type Book_Type_Array is array (1..100) of Character;
TYPE Day_OverDue IS ARRAY (1 .. 100) of Float;
Type Fine_Array_Type is Array (1..100) of Float;


   PROCEDURE Get_Names_Type_Overdue (
         Names_Fp :          OUT Names_Type_Array;
         Book_Types_Fp  :    OUT Book_Type_Array;
         Day_OverDue_Fp    : OUT Day_OverDue;
         N_Fp      :    OUT Natural) IS
   --This reads both the name and score arrays and returns them to the main program
   BEGIN
      N_Fp := 0;
      WHILE NOT End_Of_File LOOP
         N_Fp := N_Fp + 1;
         Get(Names_Fp (N_Fp));
         Get(Book_Types_Fp (N_Fp));
         Get(Day_OverDue_Fp(N_Fp));
      END LOOP;
   END Get_Names_Type_Overdue;
-----------------------------------------
Function Total_Fine_Calculated(
   Day_OverDue_Fp    :  Day_OverDue;
   Book_Types_Fp     :  Book_Type_Array;
   I: Integer) Return Float is
   Total_Fines_Fp: Float;
   
   begin
       
       if (Book_Types_Fp(I) = 'G')
       then Total_Fines_Fp:= Day_OverDue_Fp(I) * 0.15;
       elsif (Book_Types_Fp(I) = 'R')
       then Total_Fines_Fp:= (Day_OverDue_Fp(I)*24.0) * 0.25;
       end if;
       return Total_Fines_Fp;
   end Total_Fine_Calculated;

-------------------------------------------
Procedure Selection_Sort_TotalFine(
    Total_Fine_Fp : IN OUT Fine_Array_Type;
    N_Fp: IN Natural) is
    Temp: Float;
   Begin
    For I in 1..N_Fp -1 loop
        for J in I+1.. N_Fp loop
            if Total_Fine_Fp(I)< Total_Fine_Fp(J) then
                Temp:= Total_Fine_Fp(I);
                Total_Fine_Fp(I):= Total_Fine_Fp(J);
                Total_Fine_Fp(J):= Temp;
            end if;
        end loop;
   end loop;
end Selection_Sort_TotalFine;
            
-------------------------------------------
Procedure Print_Fines_Array(
    Names_Fp: IN Names_Type_Array;
    Total_Fines_Fp: IN Fine_Array_Type;
    N_Fp: IN Natural) is
Begin
    Put("Customers Listed in Order of Fines (highest to lowest)");
    New_line;
    Put("NAME");
    Set_col(50);
    Put("FINE");
    New_line;
    Put("======================================================");
    new_Line;
    FOR I IN 1.. N_Fp LOOP
    Put(Names_Fp (I));
    Set_Col(50);
    Put(Total_Fines_Fp(I),1,2,0);
    new_line;
    END LOOP;
    New_Line;    
end Print_Fines_Array; 
-------------------------------------------------
Procedure Selection_Sort_Name(
    Name_Type_Fp: IN OUT Names_Type_Array;
    Total_Fine_Fp : IN OUT Fine_Array_Type;
    N_Fp: IN Natural) is
    Temp: Names_Type;
    Temp2: Float;
    begin
    For I in 1..N_Fp -1 loop
        for J in I+1.. N_Fp loop           
             if Name_Type_Fp(I)>Name_Type_Fp(J) then
                Temp:= Name_Type_Fp(I);
                Name_Type_Fp(I):= Name_Type_Fp(J);
                Name_Type_Fp(J):= Temp;
                Temp2:=Total_Fine_Fp(I);
                Total_Fine_Fp(I):=Total_Fine_Fp(J);
                Total_Fine_Fp(J):=Temp2;
             end if;
        end loop;
   end loop;
end Selection_Sort_Name;
--------------------------------------------------
Procedure Print_Names_Array(
    Name_Type_Fp: IN Names_Type_Array;
    Book_Type_Fp: IN Book_Type_Array;
    Day_OverDue_Fp: IN Day_OverDue;
    Total_Fine_Fp: IN Fine_Array_Type;
    N_Fp: IN Natural) is
begin
    Put("Alphabetical List of Customers and Corresponding Fine Info");
    New_line;
    Put("NAME");
    Set_Col(30);
    Put("TYPE");
    Set_Col(42);
    Put("DAYS");
    Set_Col(52);
    Put("FINE");
    New_Line;
    Put("======================================================");
    
   for I in 1..N_Fp loop
    New_Line;
    Put(Name_Type_Fp(I));
    Set_Col(30);
    if Book_Type_Fp(I) = 'G' then Put("General");
    else Put("Reserve");
    end if;
    Set_Col(40);
    Put(Day_OverDue_Fp(I),3,2,0);
    Set_Col(50);
    Put(Total_Fine_Fp(I),3,2,0);
   end loop;
end Print_Names_Array;

Names: Names_Type_Array;
Book_Types: Book_Type_Array;
Day_OverDue_Arr: Day_OverDue;
N: Natural;
Total_Fine: Fine_Array_Type;

Begin
  Get_Names_Type_Overdue (Names,Book_Types,Day_OverDue_Arr,N);
  FOR I IN 1.. N LOOP
  Total_Fine(I):=Total_Fine_Calculated(Day_OverDue_Arr,Book_Types,I);
  end loop;
  Selection_Sort_TotalFine(Total_Fine,N);
  Print_Fines_Array(Names, Total_Fine,N);
  Selection_Sort_Name(Names,Total_Fine,N);
  Print_Names_Array(Names, Book_Types, Day_OverDue_Arr, Total_Fine, N);

 
end Hello;
