--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:46:35 03/04/2018
-- Design Name:   
-- Module Name:   D:/9412032-9531020/3/Process/seqDectMooreTB.vhd
-- Project Name:  Process
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: seqDectMoore
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
 
ENTITY seqDectMooreTB IS
END seqDectMooreTB;
 
ARCHITECTURE behavior OF seqDectMooreTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT seqDectMoore
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         inBit : IN  std_logic;
         output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal inBit : std_logic := '0';

 	--Outputs
   signal output : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: seqDectMoore PORT MAP (
          clk => clk,
          reset => reset,
          inBit => inBit,
          output => output
        );

   clk_process :process
   begin

		clk <= '0';
		wait for 20 ns;
		clk <= '1';
		wait for 20 ns;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		inBit <= '1';
      wait for 40 ns;	
		inBit <= '0';
      wait for 40 ns;
		inBit <= '1';
		wait for 40 ns;
		inBit <= '0'; 
		wait for 40 ns;
   end process;

END;
