----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:26:02 03/11/2018 
-- Design Name: 
-- Module Name:    CarrySelect8bit - Behavioral 
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

entity CarrySelect8bit is
	Port(
		A ,B : in STD_LOGIC_VECTOR(7 downto 0);
		cIn: in STD_LOGIC;
		sums : out STD_LOGIC_VECTOR(7 downto 0);
		cOut : out STD_LOGIC
	);
end CarrySelect8bit;

architecture Behavioral of CarrySelect8bit is

	component RippleAdder4Bit is
		Port(
		A , B : in STD_LOGIC_VECTOR(3 downto 0);
		cIn : in STD_LOGIC;
		sums : out STD_LOGIC_VECTOR(3 downto 0);
		cOut : out STD_LOGIC
		);
	end component;
	
	signal selectSum : STD_LOGIC;
	signal finalCout: STD_LOGIC_VECTOR(1 downto 0);
	signal finalSum0 ,finalSum1 : STD_LOGIC_VECTOR(3 downto 0);

begin
	RippleAdder_main: RippleAdder4bit port map(A => A(3 downto 0) ,B => B(3 downto 0) ,cIn => cIn ,sums => sums(3 downto 0) ,cOut => selectSum);
	
	RippleAdder_no1: RippleAdder4bit port map(A => A(7 downto 4) ,B => B(7 downto 4) ,cIn => '0' ,sums => finalSum0 ,cOut => finalCout(0));
	RippleAdder_no2: RippleAdder4bit port map(A => A(7 downto 4) ,B => B(7 downto 4) ,cIn => '1' ,sums => finalSum1 ,cOut => finalCout(1));
		
	
	with selectSum select
		sums(7 downto 4) <= finalSum0 when '0',
								finalSum1 when others;
	with selectSum select 							
		cOut <= finalCout(0) when '0',
		      finalCout(1) when others;
	
end Behavioral;

