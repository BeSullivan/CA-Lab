----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:23:53 04/08/2018 
-- Design Name: 
-- Module Name:    CarrySaveMult - Behavioral 
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

entity CarrySaveMult is
	Port(
		A ,B : IN STD_LOGIC_VECTOR (3 downto 0);
		output : out STD_LOGIC_VECTOR(7 downto 0)
		);
	
end CarrySaveMult;

architecture Behavioral of CarrySaveMult is

	component HalfAdder is
		Port(
		in1, in2: in std_logic;
		s, c : out std_logic
		);
	end component HalfAdder;
	
	component FullAdder is 
			Port(
			i0, i1, cin: in std_logic;
			s, cout : out std_logic
			);
	end component FullAdder;
	
	signal carrySig : STD_LOGIC_VECTOR (10 downto 0);
	signal sumSig : STD_LOGIC_VECTOR (5 downto 0);
	signal andCarry : STD_LOGIC_VECTOR(15 downto 0);

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

	output(0) <= andCarry(0);
	
	-- First Row
	
	HalfAdder0: HalfAdder port map (in1 => andCarry(1) ,in2 => andCarry(4) ,s => output(1) ,c => carrySig(0));
	HalfAdder1: HalfAdder port map (in1 => andCarry(2) ,in2 => andCarry(5) ,s => sumSig(0) ,c => carrySig(1));
	HalfAdder2: HalfAdder port map (in1 => andCarry(3) ,in2 => andCarry(6) ,s => suMSig(1) ,c => carrySig(2));
	
	--Second Row
	
	FullAdder0: FullAdder port map (i0 => sumSig(0) ,i1 => carrySig(0) ,cin => andCarry(8),cout => carrySig(3) ,s => output(2));
	FullAdder1: FullAdder port map (i0 => sumSig(1) ,i1 => carrySig(1) ,cin => andCarry(9) ,cout => carrySig(4) ,s => sumSig(2));
	FullAdder2: FullAdder port map (i0 => andCarry(7) ,i1 => carrySig(2) ,cin => andCarry(10),cout => carrySig(5) ,s => sumSig(3));

	--Third Row
	
	FullAdder3: FullAdder port map (i0 => sumSig(2) ,i1 => carrySig(3) ,cin => andCarry(12),cout => carrySig(6),s => output(3));
	FullAdder4: FullAdder port map (i0 => sumSig(3) ,i1 => carrySig(4) ,cin => andCarry(13),cout => carrySig(7),s => sumSig(4));
	FullAdder5: FullAdder port map (i0 => andCarry(11),i1 => carrySig(5) ,cin => andCarry(14),cout => carrySig(8),s => sumSig(5));
	
	--Fourth Row
	
	HalfAdder3: HalfAdder port map (in1 => carrySig(6) ,in2 => sumSig(4) ,s => output(4),c => carrySig(9));
	FullAdder6: FullAdder port map (i0 => carrySig(7),i1 => sumSig(5) ,cin => carrySig(9) ,cout => carrySig(10) ,s => output(5));
	FullAdder7: FullAdder port map (i0 => carrySig(8),i1 => andCarry(15) ,cin => carrySig(10) ,cout => output(7),s => output(6));



end Behavioral;

