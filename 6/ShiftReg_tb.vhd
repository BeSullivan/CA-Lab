--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:37:28 04/15/2018
-- Design Name:   
-- Module Name:   D:/9412032-9531020/6/Registers/ShiftReg_tb.vhd
-- Project Name:  Registers
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ShifReg
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
 
ENTITY ShiftReg_tb IS
END ShiftReg_tb;
 
ARCHITECTURE behavior OF ShiftReg_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ShifReg
    PORT(
         parallel_input : IN  std_logic_vector(3 downto 0);
         serial_input : IN  std_logic;
         LR : IN  std_logic_vector(1 downto 0);
         LOAD : IN  std_logic;
         reset : IN  std_logic;
			shiftEN : IN std_logic;
         CLK : IN  std_logic;
         Reg_out : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal parallel_input : std_logic_vector(3 downto 0) := (others => '0');
   signal serial_input : std_logic := '0';
   signal LR : std_logic_vector(1 downto 0) := (others => '0');
   signal LOAD : std_logic := '0';
	signal shiftEN : std_logic := '0';
   signal reset : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Reg_out : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ShifReg PORT MAP (
          parallel_input => parallel_input,
          serial_input => serial_input,
          LR => LR,
          LOAD => LOAD,
			 shiftEN => shiftEN,
          reset => reset,
          CLK => CLK,
          Reg_out => Reg_out
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
		reset <= '1';
		wait for CLK_period;
		reset <= '0';
		
		LR <= "00";
		parallel_input <= "1010";
		serial_input <= '1';		
		LOAD <= '1';
		wait for CLK_period;
		shiftEN <= '1';


      wait;
   end process;

END;
