----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Professor Jim Plusquellic
-- 
-- Create Date:
-- Design Name: 
-- Module Name:    DataTypes_pkg - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

package DataTypes_pkg is

-- We represent numbers in FIXED-POINT format, with 12-bit integer portion of the 16-bit number stored in the PN BRAM. 
-- The fractional component is given by 'PRECISION' and the sum is PN_SIZE_NB. PN_SIZE_LB needs to be able to count 
-- to PN_SIZE_NB.
   constant PN_INTEGER_NB: integer := 12;
   constant PN_PRECISION_NB: integer := 4;
   constant PN_SIZE_LB: integer := 4;
   constant PN_SIZE_NB: integer := PN_INTEGER_NB + PN_PRECISION_NB;

   constant BYTE_SIZE_LB: integer := 3;
   constant BYTE_SIZE_NB: integer := 8;

   constant WORD_SIZE_LB: integer := 4;
   constant WORD_SIZE_NB: integer := 16;

-- BRAM SIZES: PNL is currently 8192 bytes with 16-bit words. 
   constant PNL_BRAM_ADDR_SIZE_NB: integer := 13;
   constant PNL_BRAM_DBITS_WIDTH_LB: integer := PN_SIZE_LB;
   constant PNL_BRAM_DBITS_WIDTH_NB: integer := PN_SIZE_NB;
   constant PNL_BRAM_NUM_WORDS_NB: integer := 2**PNL_BRAM_ADDR_SIZE_NB;

-- Total number PNs loaded into region 4096 to 8192 is 2^12 = 4096.
   constant NUM_PNS_NB: integer := 12;
   constant NUM_PNS: integer := 2**NUM_PNS_NB;

-- LAB1_MODS, total number of PNs in lower diffs area will be 1/2 of PNs in upper BRAM
   constant NUM_DIFFS_PNS_NB: integer := 11;
   constant NUM_DIFFS_PNS: integer := 2**NUM_DIFFS_PNS_NB;

-- Largest positive (signed) value for PNs is 1023.9375 which is in binary 01111111111.1111, BUT AS a integer binary value with no 
-- decimal place, it is 16383 (0011111111111111) (note, we have 16-bit for the word size now).
   constant LARGEST_POS_VAL: integer := 16383;

-- My largest negative value is -1023.9375 or 110000000000.0001, AND as a integer binary value, -16383
   constant LARGEST_NEG_VAL: integer := -16383;

-- We store the raw data in the upper half of memory (locations 4096 to 8191). 
   constant PN_BRAM_BASE: integer := PNL_BRAM_NUM_WORDS_NB/2;
   constant PN_UPPER_LIMIT: integer := PNL_BRAM_NUM_WORDS_NB;

-- The histogram starts at the mid-point in the lower half of the BRAM (2048 to 4095)
-- LAB1_MODS, keep HISTO_BRAM_BASE same, shorten HISTO_BRAM_UPPER_LIMIT to 1024 above base
-- LAB1_MODS, change HISTO_BRAM_SIZE from 2e11=2048 to 2e10=1024.
   constant HISTO_BRAM_SIZE_NB: integer := 10;
   constant HISTO_BRAM_BASE: integer := (PNL_BRAM_NUM_WORDS_NB/2)/2;
   constant HISTO_BRAM_UPPER_LIMIT: integer := HISTO_BRAM_BASE + (HISTO_BRAM_BASE/2);

-- Max range can never exceed the number of words we allocated in histo memory which is 2048. NOTE: WE NEED 12 bits to store
-- the value 2048!
-- LAB1_MODS, no change here but comments should reflect size of 1024 instead of 2048
   constant HISTO_MAX_RANGE_NB: integer := HISTO_BRAM_SIZE_NB+1;
   constant HISTO_MAX_RANGE: integer := 2**HISTO_BRAM_SIZE_NB;

-- Use 4 here for histo LV and HV bounds of 6.25% and 93.75%. With a total count across histo cells of 4096, the bounds become 
-- 256 and 3840. 
-- LAB1_MODS, find refs to HISTO_BOUND_PCT_SHIFT_NB & make sure reflects smaller total set but still 6.25% & 93.75%
-- LAB1_MODS, calculate new pct shift val.  New ints are 13bit in size (8192), 6.25% of 8192 = 512 (or 2e9), shl is still 4!
   constant HISTO_BOUND_PCT_SHIFT_NB: integer := 4;

-- LAB1_MODS, Setup data type to hold (k = i - j) difference values from PN_BRAM^upper - PN_BRAM^lower.  Value must accomodate values up to 2X value of inputs.  So instead of a 12 bit INT + 4 bit PRECISION, will use a 13 bit INT + 3 bit PRECISION
   constant PN_DIFFS_BRAM_BASE: integer := 0;
   constant PN_DIFFS_UPPER_LIMIT: integer := (PNL_BRAM_NUM_WORDS_NB/2)/2;
   constant PN_DIFFS_INTEGER_NB: integer := 13;
   constant PN_DIFFS_PRECISION_NB: integer := 3;
   constant PN_DIFFS_SIZE_LB: integer := 4;
   constant PN_DIFFS_SIZE_NB: integer := PN_INTEGER_NB + PN_PRECISION_NB;

end DataTypes_pkg;
