--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:14:47 04/29/2018
-- Design Name:   
-- Module Name:   E:/University/Year 96 - 97/Semester 2/Computer Architecture/CA-Lab/7/Memory/ROM_TB.vhd
-- Project Name:  Memory
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ROM
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
USE work.constants.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ROM_TB IS
END ROM_TB;
 
ARCHITECTURE behavior OF ROM_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROM
    PORT(
         finished : IN  std_logic;
         CLK : IN  std_logic;
         WR : IN  std_logic;
         RD : IN  std_logic;
         Addr : IN  std_logic_vector(C-1 downto 0);
         reset : IN  std_logic;
         data : INOUT  std_logic_vector(W-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal finished : std_logic := '0';
   signal CLK : std_logic := '0';
   signal WR : std_logic := '0';
   signal RD : std_logic := '0';
   signal Addr : std_logic_vector(C-1 downto 0) := (others => '0');
   signal reset : std_logic := '0';

	--BiDirs
   signal data : std_logic_vector(W-1 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM PORT MAP (
          finished => finished,
          CLK => CLK,
          WR => WR,
          RD => RD,
          Addr => Addr,
          reset => reset,
          data => data
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

		wait for CLK_period;
      -- insert stimulus here 
		
		finished <= '0';
		WR <= '1';
		RD <= '0';
		data <= "1001101111";
		Addr <= "000000100";

		wait for CLK_period;
		
		finished <= '0';
		WR <= '1';
		RD <= '0';
		data <= "1101110111";
		Addr <= "000000010";

		wait for CLK_period;

		finished <= '0';
		WR <= '1';
		RD <= '0';
		data <= "0001111011";
		Addr <= "000000001";
		
		wait for CLK_period;

		finished <= '0';
		WR <= '1';
		RD <= '0';
		data <= "0101101101";
		Addr <= "000000011";
		
		wait for CLK_period;

		finished <= '1';
		
		wait for CLK_period;

		finished <= '0';
		WR <= '1';
		RD <= '0';
		data <= "0101101101";
		Addr <= "000000011";
		
		wait for CLK_period;

		WR <= '0';
		RD <= '1';
		Addr <= "000000100";
		
		wait for CLK_period;

		WR <= '0';
		RD <= '1';
		Addr <= "111111111";
		
		
      wait;
   end process;

END;
