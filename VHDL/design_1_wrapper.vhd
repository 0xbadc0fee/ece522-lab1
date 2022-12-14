--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
--Date        : Tue Nov  8 13:16:53 2022
--Host        : ECE522 running 64-bit Ubuntu 20.04.5 LTS
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

--Entity list for project
-- remove 8 hardware ports, will be controlled by software HDL 'signals'
-- add 2 debug ports, led on board, XDC file will map debug ports to pins
entity design_1_wrapper is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
--    FCLK_CLK0 : out STD_LOGIC;
--    FCLK_RESET0_N : out STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
--    GPIO_Ins_tri_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
--    GPIO_Outs_tri_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
--    PNL_BRAM_addr : in STD_LOGIC_VECTOR ( 12 downto 0 );
--    PNL_BRAM_din : in STD_LOGIC_VECTOR ( 15 downto 0 );
--    PNL_BRAM_dout : out STD_LOGIC_VECTOR ( 15 downto 0 );
--    PNL_BRAM_we : in STD_LOGIC_VECTOR ( 0 to 0 )
    DEBUG_IN: in std_logic;
    DEBUG_OUT: out  std_logic
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  
  -- Declaration of design_1
  component design_1 is
  port (
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    GPIO_Ins_tri_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    PNL_BRAM_addr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    PNL_BRAM_din : in STD_LOGIC_VECTOR ( 15 downto 0 );
    PNL_BRAM_dout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    PNL_BRAM_we : in STD_LOGIC_VECTOR ( 0 to 0 );
    GPIO_Outs_tri_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FCLK_CLK0 : out STD_LOGIC;
    FCLK_RESET0_N : out STD_LOGIC
  );
  end component design_1;

-- Declaration of Top, used Top.vhd as model
component Top is
   port (
      Clk: in std_logic;
      PS_RESET_N: in std_logic;
      GPIO_Ins: in std_logic_vector(31 downto 0);
      GPIO_Outs: out std_logic_vector(31 downto 0);
      PNL_BRAM_addr: out std_logic_vector (12 downto 0);
      PNL_BRAM_din: out std_logic_vector (15 downto 0);
      PNL_BRAM_dout: in std_logic_vector (15 downto 0);
      PNL_BRAM_we: out std_logic_vector (0 to 0);
      DEBUG_IN: in std_logic;
      DEBUG_OUT: out std_logic
      );
end component Top;

-- Reintroduce 8 removed hardware ports as HDL 'signals'
    signal GPIO_Ins : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal GPIO_Outs : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal PNL_BRAM_addr : STD_LOGIC_VECTOR ( 12 downto 0 );
    signal PNL_BRAM_din : STD_LOGIC_VECTOR ( 15 downto 0 );
    signal PNL_BRAM_dout : STD_LOGIC_VECTOR ( 15 downto 0 );
    signal PNL_BRAM_we : STD_LOGIC_VECTOR ( 0 to 0 );
    signal FCLK_CLK0 : STD_LOGIC;
    signal FCLK_RESET0_N : STD_LOGIC;



begin

-- Instantiation // design_1_i is instance of type design_1
design_1_i: component design_1
     port map (
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FCLK_CLK0 => FCLK_CLK0,
      FCLK_RESET0_N => FCLK_RESET0_N,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      GPIO_Ins_tri_i(31 downto 0) => GPIO_Ins(31 downto 0),
      GPIO_Outs_tri_o(31 downto 0) => GPIO_Outs(31 downto 0),
      PNL_BRAM_addr(12 downto 0) => PNL_BRAM_addr(12 downto 0),
      PNL_BRAM_din(15 downto 0) => PNL_BRAM_din(15 downto 0),
      PNL_BRAM_dout(15 downto 0) => PNL_BRAM_dout(15 downto 0),
      PNL_BRAM_we(0) => PNL_BRAM_we(0)
    );

-- Instantiation // TopMod is instance of type Top
-- TopMod reverses GPIO I/O for use in PL <=> PS handoff
TopMod: component Top
   port map (
      Clk=>FCLK_CLK0,
      PS_RESET_N=>FCLK_RESET0_N,
      GPIO_Ins=>GPIO_Outs,  
      GPIO_Outs=>GPIO_Ins, 
      PNL_BRAM_addr=>PNL_BRAM_addr,
      PNL_BRAM_din=>PNL_BRAM_din,
      PNL_BRAM_dout=>PNL_BRAM_dout,
      PNL_BRAM_we=>PNL_BRAM_we,
      DEBUG_IN=>DEBUG_IN,
      DEBUG_OUT=>DEBUG_OUT 
      );

end STRUCTURE;
