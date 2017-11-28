WITH Ada.Text_Io;
USE Ada.Text_Io;
WITH Ada.Integer_Text_Io;
USE Ada.Integer_Text_Io;
WITH Ada.Float_Text_IO;
USE Ada.Float_Text_IO;

PROCEDURE Lab11 IS
   Master_Input_File      : File_Type;
   Transaction_Input_File : File_Type;
   Report_Output_File     : File_Type;
   Error_Output_File      : File_Type;
   SUBTYPE ID_String_Type IS String(1..5);
   TYPE Product_Rec_Type IS
      RECORD
         ID             : ID_String_Type;
         QOH            : Integer;        --quantity on hand
         Cost           : Float;
         Percent_Markup : Natural;
   END RECORD;

   TYPE Ucon_Product_Array_Type IS ARRAY (Positive RANGE <>) OF Product_Rec_Type;
   SUBTYPE Product_Array_Type IS Ucon_Product_Array_Type(1..100);

   TYPE Trans_Rec_Type IS RECORD
      ID: ID_String_Type;
      BuyOrSell      : Character;
      Number   : Integer;
      item_stat   : boolean:= true;
      END RECORD;

  TYPE Trans_Array_Type IS ARRAY(1..100) OF Trans_Rec_Type ;




   -------------------------------------------------------------------------------------
   PROCEDURE Load_Product_Array (
         Product_Array_FP :    OUT Product_Array_Type;
         N_Fp             :    OUT Natural) IS

   BEGIN
      N_Fp := 0;
      WHILE NOT End_Of_File(File => Master_Input_File)LOOP
         N_Fp := N_Fp + 1;
         Get(
            File => Master_Input_File,
            Item => Product_Array_Fp (N_Fp).Id);
         Get(
            File => Master_Input_File,
            Item => Product_Array_Fp (N_Fp).QOH);
         Get(
            File => Master_Input_File,
            Item => Product_Array_Fp (N_Fp).Cost);
         Get(
            File => Master_Input_File,
            Item => Product_Array_Fp (N_Fp).Percent_Markup);

      END LOOP;
   END Load_Product_Array;

   -------------------------------------------------------------------------
    PROCEDURE Load_Transaction_Array (
               Trans_Array_FP : out Trans_Array_Type;
      M_FP : out Natural  ) IS
      Blank : character;
   BEGIN
      M_Fp := 0;
      WHILE NOT End_Of_File(File => Transaction_input_file)LOOP
         M_Fp := M_Fp + 1;
         Get(
            File => Transaction_input_file,
            Item => Trans_Array_FP(M_Fp).Id);
         Get(File => Transaction_input_file,
            Item => Blank);
         Get(
            File => Transaction_input_file,
            Item => Trans_Array_FP(M_Fp).BuyOrSell);
         Get(
            File => Transaction_input_file,
            Item => Trans_Array_FP(M_Fp).Number);
      END LOOP;
   END Load_Transaction_Array;
--------------------------------------------
   PROCEDURE Compute_QOH(
      Product_Array_FP : IN OUT Product_Array_Type;
      Trans_Array_FP :   IN OUT Trans_Array_Type;
      N_Fp: IN Natural;
      M_Fp: IN Natural)  IS
   BEGIN
      FOR I IN 1..M_FP LOOP
         FOR J IN 1..N_FP LOOP
            IF Trans_Array_FP(I).Id = Product_Array_Fp (J).Id THEN
               Trans_Array_FP(I).item_stat:= False;
               IF Trans_Array_FP(I).BuyOrSell = 'S'  THEN
                  Product_Array_Fp (J).QOH := Product_Array_Fp (J).QOH - Trans_Array_FP(i).Number;
               ELSIF Trans_Array_FP(M_Fp).BuyOrSell = 'B'   THEN
                  Product_Array_Fp (J).QOH := Product_Array_Fp (J).QOH + Trans_Array_FP(i).Number;
               END IF;

            END IF;

         END LOOP;
      END LOOP;


   END Compute_QOH;
------------------------------------------
   PROCEDURE Print_Error_Output (
      Trans_Array_FP : IN Trans_Array_Type;
      M_FP : in Natural
         ) IS


   BEGIN
      Put(
         File => Error_Output_File,
         Item => "ID");
      Set_Col(
         File => Error_Output_File,
            To   =>  15);
      Put(
         File => Error_Output_File,
         Item => "ERROR");

      New_Line(
         File => Error_Output_File);
      FOR I IN 1..M_FP LOOP
         IF Trans_Array_FP(I).Item_Stat = True THEN
            Put(
               File => Error_Output_File,
               Item => Trans_Array_FP(I).ID);
            Set_Col(
               File => Error_Output_File,
               To   =>  15);

            Put(
               File=> Error_Output_File,
               Item=> "INVALID ITEM NUMBER");
            New_Line(
               File => Error_Output_File);
         END IF;
      END LOOP;


   END Print_Error_Output;
   ---------------------------------
   PROCEDURE Print_Product_Array (
         Product_Array_FP : IN     Product_Array_Type;
         N_Fp             : IN     Natural) IS

   BEGIN
      FOR I IN 1..N_Fp LOOP
         Set_Col(
            File => Report_Output_File,
            To   => 5);
         Put(
            File => Report_Output_File,
            Item => Product_Array_Fp (I).Id);
         Set_Col(
            File => Report_Output_File,
            To   => 17);

         Put(
            File => Report_Output_File,
            Item => Product_Array_Fp (I).QOH);
         Set_Col(
            File => Report_Output_File,
            To   => 40);

         Put(
            File => Report_Output_File,
            Item => Product_Array_Fp (I).Cost,
            Fore => 1,
            Aft  => 2,
            Exp  => 0);
         Set_Col(
            File => Report_Output_File,
            To   => 55);
         Put(
            File  => Report_Output_File,
            Item  => Product_Array_Fp (I).Percent_Markup,
            Width => 1);
         New_Line(
            File    => Report_Output_File,
            Spacing => 1);

      END LOOP;
   END Print_Product_Array;

   -------------------------------------------------------------------------------------
   PROCEDURE Print_Headings IS
   BEGIN
      Put_Line(
         File => Report_Output_File,
         ITEM => "Product Id       Quantity on Hand       Cost       % Markup");
      New_Line(
         File    => Report_Output_File,
         Spacing => 2);
   END Print_Headings;

   ------------------------------------------------------------------------------------

   --main program declaration section
   Product_Array : Product_Array_Type;
   Trans_Array :  Trans_Array_Type;
   N             : Natural;
   M             : Natural;




BEGIN --main program
   Open(
      File => Master_Input_File,
      Mode => In_File,
      Name => "lab11master_input.txt");
   Open(
      File => Transaction_Input_File,
      Mode => In_File,
      Name => "Transactionlab11.txt");
   Create(
      File => Report_Output_File,
      Mode => Out_File,
      Name => "lab11master_output.txt");

   Create(
      File => Error_Output_File,
      Mode => Out_File,
      Name => "Error_Output_File.txt");

   Print_Headings;
   Load_Product_Array(Product_Array,N);
   Load_Transaction_Array(Trans_Array,M);
   Compute_QOH(Product_Array, Trans_Array, N, M);
   Print_Product_Array(Product_Array,N);
   Print_Error_Output (Trans_Array,M);
   --You need to read the transaction file and process it against the master file.  Then print the updated master file.  A 'B' means you (the store) bought more
   --of the item.  An 'S' in the transaction file means you (the store) sold some of the item.  Output the updated inventory in the report output file.  Output
   --any bad item numbers from the transaction file (i.e. an item number in the transaction file that is not in the master file) in the output error file.
   --Label the output error file with column headings       ID         ERROR.
   --Under the ID column, simply print the item's id.  Under the ERROR column, simply print "INVALID ITEM NUMBER".  This will be the only error you will need to check.
   -- A negative quantity on hand means some items are on backorder.

   --wrap-up file activities

   Close(File => Master_Input_File);
   Close(File => Report_Output_File);
   Close(File => Transaction_Input_File);
   Close(File => Error_Output_File);

END Lab11;