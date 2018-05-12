--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:21:46 04/22/2018
-- Design Name:   
-- Module Name:   C:/Users/Roozbeh Ghasemi/Desktop/6/Registers/top_tb.vhd
-- Project Name:  Registers
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Top
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
 
ENTITY top_tb IS
END top_tb;
 
ARCHITECTURE behavior OF top_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Top
    PORT(
         parallel_input : IN  std_logic_vector(3 downto 0);
         serial_input : IN  std_logic;
         LR : IN  std_logic_vector(1 downto 0);
         LOAD : IN  std_logic_vector(1 downto 0);
         reset : IN  std_logic;
         CLK : IN  std_logic;
         SEG_DATA : OUT  std_logic_vector(7 downto 0);
         SEG_SEL : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal parallel_input : std_logic_vector(3 downto 0) := (others => '0');
   signal serial_input : std_logic := '0';
   signal LR : std_logic_vector(1 downto 0) := (others => '0');
   signal LOAD : std_logic_vector(1 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal SEG_DATA : std_logic_vector(7 downto 0);
   signal SEG_SEL : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Top PORT MAP (
          parallel_input => parallel_input,
          serial_input => serial_input,
          LR => LR,
          LOAD => LOAD,
          reset => reset,
          CLK => CLK,
          SEG_DATA => SEG_DATA,
          SEG_SEL => SEG_SEL
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 
		
		parallel_input <= "1111";
		LOAD <= "00";
		LR <= "00";
		reset <= '0';
		wait for CLK_period*10;
		LOAD <= "11";

      wait;
   end process;

END;
