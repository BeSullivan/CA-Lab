--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:19:36 03/04/2018
-- Design Name:   
-- Module Name:   D:/9412032-9531020/3/Process/TFFLOP_Tb.vhd
-- Project Name:  Process
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TFFLOP
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
 
ENTITY TFFLOP_Tb IS
END TFFLOP_Tb;
 
ARCHITECTURE behavior OF TFFLOP_Tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TFFLOP
    PORT(
         clk : IN  std_logic;
         tBit : IN  std_logic;
         reset : IN  std_logic;
         q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal tBit : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal q : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TFFLOP PORT MAP (
          clk => clk,
          tBit => tBit,
          reset => reset,
          q => q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= not clk;
		wait for 10ns;
   end process;
 

   -- Stimulus process
	reset <= '1', '0' after 10ns ;
	process
	begin
		tBit <= '1';
		wait for 50ns;
		tBit <= '0';
		wait for 50ns;
	end process;

END;
