----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:35:18 04/15/2018 
-- Design Name: 
-- Module Name:    ShifReg - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ShifReg is
	port( parallel_input : in STD_LOGIC_VECTOR(3 downto 0);
			serial_input : in STD_LOGIC;
			LR : in STD_LOGIC_VECTOR(1 downto 0);
			LOAD : in STD_LOGIC_VECTOR(1 downto 0);
			reset : in STD_LOGIC;
			CLK : in STD_LOGIC;
			Reg_out : OUT STD_LOGIC_VECTOR(3 downto 0));
end ShifReg;

architecture Behavioral of ShifReg is

signal regTemp : STD_LOGIC_VECTOR(3 downto 0);
begin

	MAIN:process (CLK)
		variable ShiftEN : integer := 0;
	begin
		if(CLK'event and CLK = '1') then
			if(reset = '1') then
				regTemp <= "0000";
				ShiftEN := 0;
			else
				if(LOAD = "00") then
					-- Parallel Input
					regTemp <= parallel_input;
				elsif (LOAD = "01") then
					-- Serial Input
					regTemp(3) <= regTemp(2);
					regTemp(2) <= regTemp(1);
					regTemp(1) <= regTemp(0);
					regTemp(0) <= serial_input;
				-- LR ====> (Logical 0 / Arithmetic 1 , Right 0 / Left 1)
				elsif(LOAD = "10" or LOAD = "11") then
					if (LR = "00") then
						regTemp(0) <= regTemp(1);
						regTemp(1) <= regTemp(2);
						regTemp(2) <= regTemp(3);
						regTemp(3) <= '0';
					elsif (LR = "01") then
						regTemp(3) <= regTemp(2);
						regTemp(2) <= regTemp(1);
						regTemp(1) <= regTemp(0);
						regTemp(0) <= '0';
					elsif (LR = "10") then
						regTemp(0) <= regTemp(1);
						regTemp(1) <= regTemp(2);
						regTemp(2) <= regTemp(3);
						regTemp(3) <= regTemp(3);
					else
						regTemp(3) <= regTemp(2);
						regTemp(2) <= regTemp(1);
						regTemp(1) <= regTemp(0);
						regTemp(0) <= '0';
					end if;
				end if;
			end if;
			
		end if;
	
end process MAIN;
	Reg_out <= regTemp;
end Behavioral;	

