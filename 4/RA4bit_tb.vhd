--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:00:01 03/11/2018
-- Design Name:   
-- Module Name:   D:/9412032-9531020/4/Adders/RA4bit_tb.vhd
-- Project Name:  Adders
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RippleAdder4Bit
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
 
ENTITY RA4bit_tb IS
END RA4bit_tb;
 
ARCHITECTURE behavior OF RA4bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RippleAdder4Bit
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         cIn : IN  std_logic;
         sums : OUT  std_logic_vector(3 downto 0);
         cOut : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal cIn : std_logic := '0';

 	--Outputs
   signal sums : std_logic_vector(3 downto 0);
   signal cOut : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RippleAdder4Bit PORT MAP (
          A => A,
          B => B,
          cIn => cIn,
          sums => sums,
          cOut => cOut
        );
	
	
	A <= "1101";
	B <= "1001";
	cIn <= '0';
 
 
END;
