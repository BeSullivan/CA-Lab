--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:18:13 04/08/2018
-- Design Name:   
-- Module Name:   D:/9412032-9531020/5/Multi/ArrayMult_tb.vhd
-- Project Name:  Multi
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ArrayMult
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
 
ENTITY ArrayMult_tb IS
END ArrayMult_tb;
 
ARCHITECTURE behavior OF ArrayMult_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ArrayMult
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         output : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ArrayMult PORT MAP (
          A => A,
          B => B,
          output => output
        );
	A <= "0111";
	B <= "0011";
END;
