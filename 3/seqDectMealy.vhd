----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:09:17 03/04/2018 
-- Design Name: 
-- Module Name:    seqDectMealy - Behavioral 
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

entity seqDectMealy is
	port(
		clk: in STD_LOGIC;
		reset: in STD_LOGIC;
		inBit: in STD_LOGIC;
		output: out STD_LOGIC
	);
end seqDectMealy;

architecture Behavioral of seqDectMealy is
	type state_t is(s0,s1,s2,s3,s4);
	signal state : state_t:= s0;
	signal next_state	: state_t:= s0;
	signal next_output: std_logic;
begin
	process(inBit , state)
	begin
		case state is
			when s0=>
				if(inBit = '1') then
					next_state <= state;
					next_output <= '0';
				else
					next_state <= s1;
					next_output <= '0';
				end if;
			when s1=>
				if(inBit = '1') then
					next_state <= s2;
					next_output <= '0';
				else
					next_state <= state;
					next_output <= '0';
				end if;
			when s2=>
				if(inBit = '1') then
					next_state <= s4;
					next_output <= '0';
				else
					next_state <= s3;
					next_output <= '0';
				end if;
			when s3=>
				if(inBit = '1') then
					next_state <= s2;
					next_output <= '1';
				else
					next_state <= s1;
					next_output <= '0';
				end if;
			when s4=>
				if(inBit = '1') then
					next_state <= s0;
					next_output <= '0';
				else
					next_state <= s1;
					next_output <= '1';
			end if;
		end case;
	end process;
	process(clk)
		begin
		if(clk'event and clk = '1') then
			state <= next_state;
			output <= next_output;
		end if;
	end process;
end Behavioral;



