----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:53:54 05/06/2018 
-- Design Name: 
-- Module Name:    divide - Behavioral 
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
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divide is
	Port(
		clk : IN std_logic;
		Divided : IN std_logic_vector(8 downto 0); -- Divided
		Divisor : IN std_logic_vector(4 downto 0); -- Divisor
		Quotient : OUT std_logic_vector( (4) downto 0); -- Quotient
		Remaning : OUT std_logic_vector(3 downto 0) -- Remaining
	);
end divide;

architecture Behavioral of divide is

type state_t is(s0 ,dshL ,dshL1 ,subS ,subS1 ,plusQ ,restore ,subSC ,subSC1 ,finish);
signal state : state_t:= s0;
signal next_state : state_t:= s0;


signal BQ : std_logic_vector(8 downto 0) := Divided;
signal B : std_logic_vector(3 downto 0) := Divided(7 downto 4);
signal A : std_logic_vector(3 downto 0);
signal Q : std_logic_vector(3 downto 0);
signal E : std_logic;
signal Qs : std_logic;
signal tmp : std_logic_vector(4 downto 0);
signal SC : std_logic_vector(2 downto 0);


begin	
	Main:Process (state)
	begin
		case state is
			when s0 => 
				BQ <= Divided;
				A <= Divisor(3 downto 0);
				Qs <= Divided(8) xor Divisor(4);
				Q <= "0000";
				SC <= "100";
				next_state <= dshL;
			when dshL =>
				BQ(8) <= BQ(7);
				BQ(7) <= BQ(6);
				BQ(6) <= BQ(5);
				BQ(5) <= BQ(4);
				BQ(4) <= BQ(3);
				BQ(3) <= BQ(2);
				BQ(2) <= BQ(1);
				BQ(1) <= BQ(0);
				BQ(0) <= '0';
				next_state <= dshL1;
			when dshL1 =>
				B <= BQ(7 downto 4);
				next_state <= subS;
			when subS =>
				tmp <= '0' &B + not(A) + '1';
				next_state <= subS1;
			when subS1 =>
				E <= tmp(4);
				B <= tmp(3 downto 0);
				if(E = '0') then
					next_state <= restore;
				else
					next_state <= plusQ;
				end if;
			when plusQ =>
				Q <= Q + '1';
				next_state <= subS;
			when restore => 
				B <= B + A;
				next_state <= subSC;
			when subSC => 
				SC <= SC - '1';
				next_state <= subSC1;
			when subSC1 =>
				if(SC = "000") then
					next_state <= finish;
				else
					next_state <= dshL;
				end if;
			when finish		=>		
				Quotient <= Qs & Q;
				Remaning <= B;
			when others =>
				next_state <= finish;
		end case;
	end process;
	
	process (clk)
	begin
		if(clk'event and clk = '1') then
			state <= next_state;
		end if;
	end process;

	
end Behavioral;
