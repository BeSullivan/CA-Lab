----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:52:48 04/08/2018 
-- Design Name: 
-- Module Name:    OrdinaryMulti - Behavioral 
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

entity OrdinaryMulti is
	Port(
		A ,B : in STD_LOGIC_VECTOR (3 downto 0);
		outMult : out STD_LOGIC_VECTOR (7 downto 0)
	);
end OrdinaryMulti;

architecture Behavioral of OrdinaryMulti is
	
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

	signal carrySig : STD_LOGIC_VECTOR(10 downto 0);
	signal sumSig : STD_LOGIC_VECTOR(5 downto 0);
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
	
	outMult(0) <= andCarry(0);
	
	-- First Row
	
	HalfAdder_instance10: HalfAdder port map (in1 => andCarry(4) ,in2 => andCarry(1) ,s => outMult(1) ,c => carrySig(0));
	FullAdder_instance10: FullAdder port map (cin => carrySig(0) ,i0 => andCarry(2) ,i1 => andCarry(5) ,s => sumSig(0) ,cout => carrySig(1));
	FullAdder_instance11: FullAdder port map (cin => carrySig(1) ,i0 => andCarry(3) ,i1 => andCarry(6) ,s => sumSig(1) ,cout => carrySig(2));
	HalfAdder_instance11: HalfAdder port map (in1 => carrySig(2) ,in2 => andCarry(7) ,s => sumSig(2) ,c => carrySig(3));
	
	-- Second Row
	
	HalfAdder_instance20: HalfAdder port map (in1 => andCarry(8) ,in2 => sumSig(0) ,s => outMult(2) ,c => carrySig(4));
	FullAdder_instance20: FullAdder port map (cin => carrySig(4) ,i0 => andCarry(9) ,i1 => sumSig(1) ,s => sumSig(3) ,cout => carrySig(5));
	FullAdder_instance21: FullAdder port map (cin => carrySig(5) ,i0 => andCarry(10) ,i1 => sumSig(2) ,s => sumSig(4) ,cout => carrySig(6));
	FullAdder_instance22: FullAdder port map (cin => carrySig(6) ,i0 => carrySig(3) ,i1 => andCarry(11) ,s => sumSig(5) ,cout => carrySig(7));
	
	--Third Row
	
	HalfAdder_instance30: HalfAdder port map (in1 => andCarry(12) ,in2 => sumSig(3) ,s => outMult(3) ,c => carrySig(8));
	FullAdder_instance30: FullAdder port map (cin => carrySig(8) ,i0 => andCarry(13) ,i1 => sumSig(4) ,s => outMult(4) ,cout => carrySig(9));
	FullAdder_instance31: FullAdder port map (cin => carrySig(9) ,i0 => andCarry(14) ,i1 => sumSig(5) ,s => outMult(5) ,cout => carrySig(10));
	FullAdder_instance32: FullAdder port map (cin => carrySig(10) ,i0 => carrySig(7) ,i1 => andCarry(15) ,s => outMult(6) ,cout => outMult(7));
	
end Behavioral;

