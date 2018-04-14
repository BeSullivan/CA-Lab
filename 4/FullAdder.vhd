----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:44:28 03/11/2018 
-- Design Name: 
-- Module Name:    FullAdder - Behavioral 
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

entity FullAdder is
	Port(
		A , B , cIn : in STD_LOGIC;
		sum , cOut : out STD_LOGIC
		);
end FullAdder;

architecture Behavioral of FullAdder is

	component HalfAdder is
		Port(
			A ,B : in STD_LOGIC;
			oPut ,carry : out STD_LOGIC
			);
	end component;
	
	signal co1 , co2 ,sum1 : STD_LOGIC;

begin
	
	HalfAdder_no1: HalfAdder port map (A => A ,B => B ,oPut => sum1 ,carry => co1);
	HalfAdder_no2: HalfAdder port map (A => cIn ,B => sum1 ,oPut => sum ,carry => co2);
	cOut <= co2 or co1;


end Behavioral;

