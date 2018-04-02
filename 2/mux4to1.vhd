----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:55:29 02/25/2018 
-- Design Name: 
-- Module Name:    mux4to1 - Behavioral 
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

entity mux4to1 is
	port (
		i0 : in STD_LOGIC;
		i1 : in STD_LOGIC;
		i2 : in STD_LOGIC;
		i3 : in STD_LOGIC;
		
		s0 : in STD_LOGIC;
		s1 : in STD_LOGIC;
		
		oPut : out STD_LOGIC
		
		);
end mux4to1;

architecture Structural of mux4to1 is

	signal sigOut1 ,sigOut2 : STD_LOGIC;

	component mux2to1 is
		Port (
			i0 ,i1 ,s : in STD_LOGIC;
			oPut : out STD_LOGIC
			);
	end component mux2to1;

begin

	mux2to1_first1 : mux2to1 port map(i0 => i0 ,i1 => i1 ,s => s0 ,oPut => sigOut1);
	mux2to1_first2 : mux2to1 port map(i0 => i2 ,i1 => i3 ,s => s0 ,oPut => sigOut2);
	mux2to1_second : mux2to1 port map(i0 => sigOut1 ,i1 => sigOut2 ,s => s1 ,oPut => oPut);

end Structural;

