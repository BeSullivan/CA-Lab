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
		A , B , cIn : in STD_LOGIC;
		sum , cOut : out STD_LOGIC
		);
	end component;

	signal cTemp : STD_LOGIC_VECTOR(2 downto 0);

begin
	
	FullAdder_no1: FullAdder port map (A => A(0) ,B => B(0) ,cIn => cIn ,sum => sums(0) ,cOut => cTemp(0));
	FullAdder_no2: FullAdder port map (A => A(1) ,B => B(1) ,cIn => cTemp(0) ,sum => sums(1) ,cOut => cTemp(1));
	FullAdder_no3: FullAdder port map (A => A(2) ,B => B(2) ,cIn => cTemp(1) ,sum => sums(2) ,cOut => cTemp(2));
	FullAdder_no4: FullAdder port map (A => A(3) ,B => B(3) ,cIn => cTemp(2) ,sum => sums(3) ,cOut => cOut);
	
	
end Behavioral;

