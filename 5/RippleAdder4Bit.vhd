----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:50:58 03/11/2018 
-- Design Name: 
-- Module Name:    RippleAdder4Bit - Behavioral 
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

entity RippleAdder4Bit is
	Port(
		A , B : in STD_LOGIC_VECTOR(3 downto 0);
		cIn : in STD_LOGIC;
		sums : out STD_LOGIC_VECTOR(3 downto 0);
		cOut : out STD_LOGIC
		);
end RippleAdder4Bit;

architecture Behavioral of RippleAdder4Bit is

	component FullAdder is
		Port(
		i0, i1, cin: in std_logic;
		s, cout : out std_logic
		);
	end component;

	signal cTemp : STD_LOGIC_VECTOR(2 downto 0);

begin
	
	FullAdder_no1: FullAdder port map (i0 => A(0) ,i1 => B(0) ,cin => cIn ,s => sums(0) ,cout => cTemp(0));
	FullAdder_no2: FullAdder port map (i0 => A(1) ,i1 => B(1) ,cin => cTemp(0) ,s => sums(1) ,cout => cTemp(1));
	FullAdder_no3: FullAdder port map (i0 => A(2) ,i1 => B(2) ,cin => cTemp(1) ,s => sums(2) ,cout => cTemp(2));
	FullAdder_no4: FullAdder port map (i0 => A(3) ,i1 => B(3) ,cin => cTemp(2) ,s => sums(3) ,cout => cOut);
	
	
end Behavioral;

