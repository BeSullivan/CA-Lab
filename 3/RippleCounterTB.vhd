--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:05:23 03/04/2018
-- Design Name:   
-- Module Name:   D:/9412032-9531020/3/Process/RippleCounterTB.vhd
-- Project Name:  Process
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RippleCounter
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
 
ENTITY RippleCounterTB IS
END RippleCounterTB;
 
ARCHITECTURE behavior OF RippleCounterTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RippleCounter
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         cnt : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal cnt : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RippleCounter PORT MAP (
          clk => clk,
          reset => reset,
          cnt => cnt
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= not clk;
		wait for 20ns;
   end process;
	
 
END;
