----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:00:56 03/04/2018 
-- Design Name: 
-- Module Name:    TFFLOP - Behavioral 
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

entity TFFLOP is
	Port(
		clk ,tBit ,reset : in STD_LOGIC;
		q : out STD_LOGIC
	);
end TFFLOP;

architecture Behavioral of TFFLOP is	
	signal hQ : STD_LOGIC := '0';
begin
	process(clk ,reset)
	begin
		if (reset = '0') then
			hQ <= '0';
		elsif (clk'event and clk = '0' and tBit = '1') then
			hQ <= not hQ;
		end if;
	end process;
	q <= hQ;

end Behavioral;

