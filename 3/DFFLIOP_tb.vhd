--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:08:29 03/04/2018
-- Design Name:   
-- Module Name:   D:/9412032-9531020/3/Process/DFFLIOP_tb.vhd
-- Project Name:  Process
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DFFlop
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY DFFLIOP_tb IS
END DFFLIOP_tb;
 
ARCHITECTURE behavior OF DFFLIOP_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DFFlop
    PORT(
         reset : IN  std_logic;
         dBit : IN  std_logic;
         clk : IN  std_logic;
         q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal dBit : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal q : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DFFlop PORT MAP (
          reset => reset,
          dBit => dBit,
          clk => clk,
          q => q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for 10ns;
		clk <= '1';
		wait for 10ns;
   end process;
	
	process 
	begin
		reset <= '0';
		wait for 50ns;
		reset <= '1';
		dBit <= '1';
		wait for 50ns;
		dBit <= '0';
	end process;

END;
