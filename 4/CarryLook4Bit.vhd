----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:04:08 03/11/2018 
-- Design Name: 
-- Module Name:    CarryLook4Bit - Behavioral 
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

entity CarryLook4Bit is
	Port(
		A , B : in STD_LOGIC_VECTOR(3 downto 0);
		cIn : in STD_LOGIC;
		sums : out STD_LOGIC_VECTOR(3 downto 0);
		cOut : out STD_LOGIC
		);
end CarryLook4Bit;

architecture Behavioral of CarryLook4Bit is

	component FullAdder is
		Port(
		A , B , cIn : in STD_LOGIC;
		sum , cOut : out STD_LOGIC
		);
	end component;
	
	signal G ,P ,cTemp ,ashqal : STD_LOGIC_VECTOR (3 downto 0);
	
begin
	G(0) <= A(0) and B(0);
	G(1) <= A(1) and B(1);
	G(2) <= A(2) and B(2);
	G(3) <= A(3) and B(3);

	P(0) <= A(0) xor B(0);
	P(1) <= A(1) xor B(1);
	P(2) <= A(2) xor B(2);
	P(3) <= A(3) xor B(3);
	
	cTemp(0) <= cIn;
	CARRY_REG:
	for I in 1 to 3 generate
		cTemp(I) <= G(I - 1) or (P(I - 1) and cTemp(I - 1));
	end generate CARRY_REG;
	
	FullAdder_no1: FullAdder port map(A => A(0) ,B => B(0) ,cIn => cTemp(0) ,sum => sums(0), cOut => ashqal(0));
	FullAdder_no2: FullAdder port map(A => A(1) ,B => B(1) ,cIn => cTemp(1) ,sum => sums(1), cOut => ashqal(1));
	FullAdder_no3: FullAdder port map(A => A(2) ,B => B(2) ,cIn => cTemp(2) ,sum => sums(2), cOut => ashqal(2));
	FullAdder_no4: FullAdder port map(A => A(3) ,B => B(3) ,cIn => cTemp(3) ,sum => sums(3), cOut => cOut);
	
end Behavioral;

