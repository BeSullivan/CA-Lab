----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:37:44 02/25/2018 
-- Design Name: 
-- Module Name:    decoder2to4 - Behavioral 
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

entity decoder2to4 is
	Port (
		A : in STD_LOGIC_VECTOR(1 downto 0);
		
		f : out STD_LOGIC_VECTOR(3 downto 0)
		);
end decoder2to4;

architecture Structural of decoder2to4 is

	signal outDec1 ,outDec2 : STD_LOGIC_VECTOR(1 downto 0);

	component decoder1to2 is
		Port (
			A0 : in STD_LOGIC;
			f : out STD_LOGIC_VECTOR(1 downto 0)
			);
	end component;

begin
	
	decoder1to2_first: decoder1to2 port map(A0 => A(0) ,f => outDec1);
	decoder1to2_second: decoder1to2 port map(A0 => A(1) ,f => outDec2);
	
	f(0) <= outDec1(0) and outDec2(0);
	f(1) <= outDec1(1) and outDec2(0);
	f(2) <= outDec1(0) and outDec2(1);
	f(3) <= outDec1(1) and outDec2(1);
	
end Structural;

