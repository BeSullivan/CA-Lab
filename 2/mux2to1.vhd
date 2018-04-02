----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:45:20 02/25/2018 
-- Design Name: 
-- Module Name:    mux2to1 - Behavioral 
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

entity mux2to1 is
	Port (
		i0 : in STD_LOGIC;
		i1 : in STD_LOGIC;
		s : in STD_LOGIC;
		oPut : out STD_LOGIC
		);
end mux2to1;

architecture gateLevel of mux2to1 is
	
	signal sigAnd1 ,sigAnd2 ,sigNot : STD_LOGIC;
	
begin
	sigAnd1 <= i1 and s;
	sigNot <= not s;
	sigAnd2 <= i0 and sigNot;

	oPut <= sigAnd1 or sigAnd2;

end gateLevel;

