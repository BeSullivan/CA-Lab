----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:07:41 04/29/2018 
-- Design Name: 
-- Module Name:    ROM - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

use work.constants.All;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
	Port(
		finished : in STD_LOGIC;
		CLK : IN STD_LOGIC;
		WR : IN STD_LOGIC;
		RD : IN STD_LOGIC;
		Addr : IN STD_LOGIC_VECTOR(C-1 downto 0);
		reset : IN STD_LOGIC;
		data : INOUT STD_LOGIC_VECTOR(W-1 downto 0)
	);
end ROM;

architecture Behavioral of ROM is

type stdArray is array (0 to D -1) of STD_LOGIC_VECTOR(W-1 downto 0);
signal allMemory : stdArray;
signal data_out : STD_LOGIC_VECTOR(W-1 downto 0);

begin

		mainProcess: process(reset ,clk)
			variable done : integer := 0;
		begin
		
			if(finished = '1') then
				done := 1;
			end if;
			if(reset'event and reset = '1') then
				for I in 0 to D-1 loop
					allMemory(I) <= std_logic_vector(to_unsigned(I ,W));
				end loop;
				done := 0;
			elsif(CLK'event and CLK = '1') then
					if(done = 0 and WR = '1' and RD = '0') then
						allMemory(to_integer(unsigned(Addr))) <= data;
					elsif (RD = '1' and WR = '0') then
						data_out <= allMemory(to_integer(unsigned(Addr)));
					end if;
			end if;
		end process;

		data <= data_out when (RD = '1') else (others => 'Z');
		
end Behavioral;

