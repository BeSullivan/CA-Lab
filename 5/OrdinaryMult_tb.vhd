--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:19:54 04/08/2018
-- Design Name:   
-- Module Name:   D:/9412032-9531020/5/Multi/OrdinaryMult_tb.vhd
-- Project Name:  Multi
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: OrdinaryMulti
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
 
ENTITY OrdinaryMult_tb IS
END OrdinaryMult_tb;
 
ARCHITECTURE behavior OF OrdinaryMult_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT OrdinaryMulti
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         outMult : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal outMult : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: OrdinaryMulti PORT MAP (
          A => A,
          B => B,
          outMult => outMult
        );

	A <= "0011";
	B <= "0111";

	


END;
