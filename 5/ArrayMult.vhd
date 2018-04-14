----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:54:49 04/08/2018 
-- Design Name: 
-- Module Name:    ArrayMult - Behavioral 
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

entity ArrayMult is
	port (A ,B : in STD_LOGIC_VECTOR (3 downto 0);
			output : out STD_LOGIC_VECTOR(7 downto 0));
end ArrayMult;

architecture Behavioral of ArrayMult is

	component RippleAdder4Bit is
		Port(
			A , B : in STD_LOGIC_VECTOR(3 downto 0);
			cIn : in STD_LOGIC;
			sums : out STD_LOGIC_VECTOR(3 downto 0);
			cOut : out STD_LOGIC
		);
		end component;
		signal andCarry : STD_LOGIC_VECTOR(15 downto 0);
		signal temp : STD_LOGIC_VECTOR(3 downto 0);
		signal sumSig ,sumSig1 : STD_LOGIC_VECTOR(3 downto 0);
begin
	andCarry(0) <= A(0) and B(0);
	andCarry(1) <= A(1) and B(0);
	andCarry(2) <= A(2) and B(0);
	andCarry(3) <= A(3) and B(0);
	andCarry(4) <= A(0) and B(1);
	andCarry(5) <= A(1) and B(1);
	andCarry(6) <= A(2) and B(1);
	andCarry(7) <= A(3) and B(1);
	andCarry(8) <= A(0) and B(2);
	andCarry(9) <= A(1) and B(2);
	andCarry(10) <= A(2) and B(2);
	andCarry(11) <= A(3) and B(2);
	andCarry(12) <= A(0) and B(3);
	andCarry(13) <= A(1) and B(3);
	andCarry(14) <= A(2) and B(3);
	andCarry(15) <= A(3) and B(3);
	
	temp(0) <= andCarry(1);
	temp(1) <= andCarry(2);
	temp(2) <= andCarry(3);
	temp(3) <= '0';
	
	output(0) <= andCarry(0);
	adder0: RippleAdder4Bit port map(cIn => '0', A => (temp) , B => andCarry(7 downto 4), sums(0) => output(1), sums(3 downto 1) => sumSig(2 downto 0), cOut => sumSig(3));
	adder1: RippleAdder4Bit port map(cIn => '0', A => (sumSig) , B => andCarry(11 downto 8), sums(0) => output(2), sums(3 downto 1) => sumSig1(2 downto 0), cOut => sumSig1(3));
	adder3: RippleAdder4Bit port map(cIn => '0', A => (sumSig1) , B => andCarry(15 downto 12), sums => output(6 downto 3), cOut => output(7));
end Behavioral;

