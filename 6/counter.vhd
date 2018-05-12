----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:14:41 04/15/2018 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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

entity counter is
	port(clk : in STD_LOGIC;
			clkOut: out STD_LOGIC);
end counter;
	
architecture Behavioral of counter is
signal clkSig : STD_LOGIC := '0';
begin
	process(clk)
		variable c : integer := 0;
	begin
		if(clk'event and clk = '1') then
			c := c + 1;
		end if;
		if (c = 5) then --20000000
			clkSig <= not clkSig;
			c := 0;
		end if;
		
	end process;
	clkOut <= clkSig;
end Behavioral;

