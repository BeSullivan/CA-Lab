----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:28:25 02/25/2018 
-- Design Name: 
-- Module Name:    encoder4to2 - Behavioral 
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

entity encoder4to2 is
	Port ( 
		i0 : in STD_lOGIC;
		i1 : in STD_lOGIC;
		i2 : in STD_lOGIC;
		i3 : in STD_lOGIC;
		
		f0 : out STD_LOGIC;
		f1 : out STD_LOGIC
		);
end encoder4to2;

architecture gateLevel of encoder4to2 is

begin

	f0 <= i1 or i3;
	f1 <= i2 or i3;

end gateLevel;

