
/******************************************************************************
* file: arm_lab_cs18m524.s
* author: Ananya Barat
* Guide: Prof. Madhumutyam IITM, PACE
******************************************************************************/

/*
  This is the starter code for assignment 2
  */

  @ BSS section
      .bss

  @ DATA SECTION
      .data
data_items: .word 10, 4, 28, 100, 8, 0 

  @ TEXT section
      .text

.globl _main


_main:
      LDR R1, =data_items
	  LDR R2,[R1] @storing max value in R2
	  LDR R3,[R1] @storing min value in R3
	  MOV R5 , #0 @variable to store the number of elements
	  
LOOP: 
      LDR R4, [R1], #4 @Loading current array value to R4 and incrementing address of R1 by 4 so as to point to next element of the array
      CMP R4, #0       @If R4 has 0 it means we have reached the end of the array
      BEQ exit         @If the value is 0 that means we have reached the end of the array so exit
	  ADD R5, R5, #1   @Incrementing the counter by 1 for every valid variable
      CMP R4, R2  	   @Check R4 - R2 ; if R4 > R2 then R4 is new max
	  BPL Change_Max   @Update max value
	  CMP R3, R4       @Check R3 - R4 ; if R4 < R3 then R4 is the new min
	  BPL Change_Min   @Update min value
	  B LOOP           @Loop again

Change_Max:
      MOV R2, R4       @Update R2 = R4 
	  B LOOP           
	  
Change_Min:
      MOV R3, R4       @Update R3 = R4
	  B LOOP
	  
exit:

.end

	  




        
