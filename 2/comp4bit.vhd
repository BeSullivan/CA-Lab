----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:04:46 02/25/2018 
-- Design Name: 
-- Module Name:    comp4bit - Behavioral 
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

entity comp4bit is
	Port (
	A : in STD_LOGIC_VECTOR (3 downto 0);
	B : in STD_LOGIC_VECTOR (3 downto 0);
	
	A_GT_B : out STD_LOGIC;
	A_EQ_B : out STD_LOGIC;
	A_LT_B : out STD_LOGIC
	);
	
end comp4bit;

architecture Structural of comp4bit is

	signal outGT ,outEQ ,outLT : STD_LOGIC_VECTOR(2 downto 0);

	component comparatorBase is
		Port (
			A : in STD_LOGIC;
			B : in STD_LOGIC;
			
			wasGT : in STD_LOGIC;
			wasEQ : in STD_LOGIC;
			wasLT : in STD_LOGIC;
			
			A_GT_B : out STD_LOGIC;
			A_EQ_B : out STD_LOGIC;
			A_LT_B : out STD_LOGIC
			);
	end component;

begin

	CMP_first: comparatorBase port map(A => A(3) ,B => B(3) ,wasGT => '0' ,wasEQ => '1' ,wasLT => '0' ,A_GT_B => outGT(0) ,A_EQ_B => outEQ(0) ,A_LT_B => outLT(0));
	CMP_second: comparatorBase port map(A => A(2) ,B => B(2) ,wasGT => outGT(0) ,wasEQ => outEQ(0) ,wasLT => outLT(0) ,A_GT_B => outGT(1) ,A_EQ_B => outEQ(1) ,A_LT_B => outLT(1));
	CMP_third: comparatorBase port map(A => A(1) ,B => B(1) ,wasGT => outGT(1) ,wasEQ => outEQ(1) ,wasLT => outLT(1) ,A_GT_B => outGT(2) ,A_EQ_B => outEQ(2) ,A_LT_B => outLT(2));
	CMP_fourth: comparatorBase port map(A => A(0) ,B => B(0) ,wasGT => outGT(2) ,wasEQ => outEQ(2) ,wasLT => outLT(2) ,A_GT_B => A_GT_B ,A_EQ_B => A_EQ_B ,A_LT_B => A_LT_B);


end Structural;

