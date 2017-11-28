CS 180				Lab 11		Due by beginning of class on 11-28-17 (Tuesday)

	
This lab has you reading from 2 input files and producing 2 output files.  The code that accompanies this assignment already reads the master input file and stores the data in a constrained array of records (based upon an unconstrained array of records.)  It produces an echo check of the master input file.  The master file contains an item id, a quantity on hand, a cost, and a percent markup.

Your task is to read the transaction file and process it against the master input file.  The transaction file contains a product id, a B (indicating a buy) or an S (indicating a sell).  Buys are to be added to the quantity on hand and sells are to be subtracted from the quantity on hand.  If an item number is present in the transaction file, but not in the master file, it is to be considered an error in the transaction file and you need to print the transaction product id in the error output file, along with the message “Invalid product id”.


