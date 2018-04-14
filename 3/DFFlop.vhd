----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:42:24 03/04/2018 
-- Design Name: 
-- Module Name:    DFFlop - Behavioral 
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

entity DFFlop is
	Port (
		reset : in STD_LOGIC;
		dBit : in STD_LOGIC;
		clk : in STD_LOGIC;
		q : out STD_LOGIC
	);
end DFFlop;

architecture Behavioral of DFFlop is
begin
	RFLOP:process(clk ,reset)
	begin
			if (reset = '0') then
				q <= '0';
			elsif(clk'event and clk = '0') then
				q <= dBit;
			end if;
	end process;
end Behavioral;

