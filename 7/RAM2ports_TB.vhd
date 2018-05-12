--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:32:29 04/29/2018
-- Design Name:   
-- Module Name:   E:/University/Year 96 - 97/Semester 2/Computer Architecture/CA-Lab/7/Memory/RAM2ports_TB.vhd
-- Project Name:  Memory
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RAM2ports
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
 
ENTITY RAM2ports_TB IS
END RAM2ports_TB;
 
ARCHITECTURE behavior OF RAM2ports_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM2ports
    PORT(
         CLK : IN  std_logic;
         WR : IN  std_logic;
         RD : IN  std_logic;
         Addr : IN  std_logic_vector(8 downto 0);
         reset : IN  std_logic;
         data_in : IN  std_logic_vector(9 downto 0);
         data_out : OUT  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal WR : std_logic := '0';
   signal RD : std_logic := '0';
   signal Addr : std_logic_vector(8 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal data_in : std_logic_vector(9 downto 0) := (others => '0');

 	--Outputs
   signal data_out : std_logic_vector(9 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM2ports PORT MAP (
          CLK => CLK,
          WR => WR,
          RD => RD,
          Addr => Addr,
          reset => reset,
          data_in => data_in,
          data_out => data_out
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
		
				
		reset <= '1';
		
		wait for CLK_period;
		
		reset <= '0';
		WR <= '1';
		data_in <= "0100110110";
		Addr <= "000000100";
		RD <= '0';

		wait for CLK_period;

		reset <= '0';
		WR <= '0';
		Addr <= "000000100";
		RD <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;
