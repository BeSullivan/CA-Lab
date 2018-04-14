----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:23:56 03/04/2018 
-- Design Name: 
-- Module Name:    seqDectMoore - Behavioral 
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

entity seqDectMoore is
	port(
		clk: in STD_LOGIC;
		reset: in STD_LOGIC;
		inBit: in STD_LOGIC;
		output: out STD_LOGIC
	);
end seqDectMoore;

architecture Behavioral of seqDectMoore is
	type state_t is(s0,s1,s2,s3,s4,s5,s6);
	signal state : state_t:= s0;
	signal next_state	: state_t:= s0;
begin
	process(inBit , state)
	begin
		case state is
			when s0=>
				if(inBit = '1') then
					next_state <= state;
				else
					next_state <= s1;
			end if;
			when s1=>
				if(inBit = '1') then
					next_state <= s2;
				else
					next_state <= state;
			end if;
			when s2=>
				if(inBit = '1') then
					next_state <= s3;
				else
					next_state <= s4;
			end if;
			when s3=>
				if(inBit = '1') then
					next_state <= s0;
				else
					next_state <= s6;
			end if;
			when s4=>
				if(inBit = '1') then
					next_state <= s5;
				else
					next_state <= s1;
			end if;
			when s5=>
				if(inBit = '1') then
					next_state <= s3;
				else
					next_state <= s4;
			end if;
			when s6=>
				if(inBit = '1') then
					next_state <= s2;
				else
					next_state <= s1;
				end if;
		end case;
	end process;
	process(clk)
		begin
		if(clk'event and clk = '1') then
			state <= next_state;
		end if;
	end process;
	output <= '1' when state = s6 else
				 '1' when state = s5 else
				 '0';
				 
end Behavioral;

