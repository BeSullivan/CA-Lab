--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:33:49 05/06/2018
-- Design Name:   
-- Module Name:   E:/University/Year 96 - 97/Semester 2/Computer Architecture/CA-Lab/8/Divider/divide_tb.vhd
-- Project Name:  Divider
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: divide
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
 
ENTITY divide_tb IS
END divide_tb;
 
ARCHITECTURE behavior OF divide_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT divide
    PORT(
         clk : IN  std_logic;
         Divided : IN  std_logic_vector(8 downto 0);
         Divisor : IN  std_logic_vector(4 downto 0);
         Quotient : OUT  std_logic_vector(4 downto 0);
         Remaning : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal Divided : std_logic_vector(8 downto 0) := "101100100";
   signal Divisor : std_logic_vector(4 downto 0) := "00001";

 	--Outputs
   signal Quotient : std_logic_vector(4 downto 0);
   signal Remaning : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: divide PORT MAP (
          clk => clk,
          Divided => Divided,
          Divisor => Divisor,
          Quotient => Quotient,
          Remaning => Remaning
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 



END;
