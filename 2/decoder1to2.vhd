----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:34:46 02/25/2018 
-- Design Name: 
-- Module Name:    decoder1to2 - Behavioral 
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

entity decoder1to2 is
	Port (
		A0 : in STD_LOGIC;
		
		f : out STD_LOGIC_VECTOR(1 downto 0)
		);
		
end decoder1to2;

architecture gateLevel of decoder1to2 is

begin
	f(0) <= not A0;
	f(1) <= A0;

end gateLevel;

