----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:45:22 04/08/2018 
-- Design Name: 
-- Module Name:    FullAdder - Behavioral 
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

entity FullAdder is
	Port(
	i0, i1, cin: in std_logic;
	s, cout : out std_logic
	);
end entity FullAdder;
architecture structure of Fulladder is
	component HalfAdder is
		Port(
		in1, in2: in std_logic;
		s, c : out std_logic
		);
	end component HalfAdder;
	signal internal_signal0, internal_signal1, internal_signal2: std_logic;
begin
		HalfAdder_instance0: HalfAdder port map ( in1 => i0, in2 => i1, s => internal_signal0, c => internal_signal1);
		HalfAdder_instance1: HalfAdder port map ( in1 => internal_signal0, in2 => cin, s => s, c => internal_signal2);
		cout <= internal_signal1 or internal_signal2;
end structure;


