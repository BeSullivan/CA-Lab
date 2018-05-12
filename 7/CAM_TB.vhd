--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:14:58 04/29/2018
-- Design Name:   
-- Module Name:   E:/University/Year 96 - 97/Semester 2/Computer Architecture/CA-Lab/7/Memory/CAM_TB.vhd
-- Project Name:  Memory
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CAM
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

use work.constants.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY CAM_TB IS
END CAM_TB;
 
ARCHITECTURE behavior OF CAM_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CAM
    PORT(
         CLK : IN  std_logic;
         WR : IN  std_logic;
         RD : IN  std_logic;
         reset : IN  std_logic;
         data : IN  std_logic_vector(W-1 downto 0);
         match : OUT  std_logic;
			match_addr : OUT std_logic_vector(C-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal WR : std_logic := '0';
   signal RD : std_logic := '0';
   signal reset : std_logic := '0';
   signal data : std_logic_vector(W-1 downto 0) := (others => '0');

 	--Outputs
   signal match : std_logic;
	signal match_addr : std_logic_vector(C-1 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CAM PORT MAP (
          CLK => CLK,
          WR => WR,
          RD => RD,
          reset => reset,
          data => data,
          match => match,
			 match_addr => match_addr
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
		reset <= '1';
		
      wait for CLK_period*2;

		reset <= '0';
		data <= "1100110110";
		WR <= '1';
		RD <= '0';
		
		wait for CLK_period;
		
		reset <= '0';
		data <= "1111111111";
		WR <= '1';
		RD <= '0';
		
		wait for CLK_period;
		
		
		reset <= '0';
		data <= "1100110110";
		WR <= '0';
		RD <= '1';
		
		

      -- insert stimulus here 

      wait;
   end process;

END;
