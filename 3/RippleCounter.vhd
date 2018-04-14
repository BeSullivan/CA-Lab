----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:37:48 03/04/2018 
-- Design Name: 
-- Module Name:    RippleCounter - Behavioral 
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

entity RippleCounter is
	Port (
		clk : IN STD_LOGIC;
		reset : in STD_LOGIC;
		cnt : out STD_LOGIC_VECTOR(3 downto 0) := "0000"
	);
end RippleCounter;

architecture structural of RippleCounter is
	
	signal helpClk : STD_LOGIC_VECTOR (2 downto 0);
	component TFFLOP is 
		Port(
			clk ,tBit ,reset : in STD_LOGIC;
			q : out STD_LOGIC
		);
	end component;

begin
	
	TFFLOP_zeroBit: TFFLOP port map (clk => clk ,tBit => '1' ,reset => '1' ,q => helpCLK(0));
	TFFLOP_oneBit: TFFLOP port map (clk => helpCLK(0) ,tBit => '1' ,reset => '1' ,q => helpCLK(1));
	TFFLOP_twoBit: TFFLOP port map (clk => helpCLK(1) ,tBit => '1' ,reset => '1' ,q => helpCLK(2));
	TFFLOP_threeBit: TFFLOP port map (clk =>helpCLK(2) ,tBit => '1' ,reset => '1' ,q => cnt(3));
	
	cnt(0) <= helpCLK(0);
	cnt(1) <= helpCLK(1);
	cnt(2) <= helpCLK(2);

end structural;

