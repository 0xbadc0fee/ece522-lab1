# Journal Entries
1. Full review of Lab#0 code to prepare for lab1
2. Create state diagram model for changes
3. Convert SM to tasks for PS side
4. Convert SM to tasks for PL side
5. Make PS side changes
6. Make PL side changes
7. Test in Vivado
8. Test in Vitis
9. Upload to board
10. test application

## Attempt #1
Attempt one failed because of going too deep into review of existing code.  All necessary changes can be made focusing on HISTO.vhd.  

## Attempt #2 (12/16/22)
Starting over with lab1 and minimizing steps, need to make it less complicated.  Made too many changes to too many places on first attempt.

###Task list
-[ ]copy fsm used for attempt1
-[ ]STARTING ONLY IN HISTO.VHD, INSERT FSM FOR PAIRWISE DIFFS INTO HISTO STATE MACHINE
-[ ]resynth in Vivado and look for missing calls / variables /constants.
-[ ]tune modified HISTO until resynth clean
-[ ]stream to zybo and test
-[ ]skip PS side edits this time, move to lab2 ASAP
