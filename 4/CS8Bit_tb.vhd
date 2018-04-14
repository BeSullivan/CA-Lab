--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:39:43 03/11/2018
-- Design Name:   
-- Module Name:   D:/9412032-9531020/4/Adders/CS8Bit_tb.vhd
-- Project Name:  Adders
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CarrySelect8bit
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
 
ENTITY CS8Bit_tb IS
END CS8Bit_tb;
 
ARCHITECTURE behavior OF CS8Bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CarrySelect8bit
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         cIn : IN  std_logic;
         sums : OUT  std_logic_vector(7 downto 0);
         cOut : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal cIn : std_logic := '0';

 	--Outputs
   signal sums : std_logic_vector(7 downto 0);
   signal cOut : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CarrySelect8bit PORT MAP (
          A => A,
          B => B,
          cIn => cIn,
          sums => sums,
          cOut => cOut
        );

	A <= "11001001";
	B <= "01101110";
	cIn <= '0';
	
 

END;
