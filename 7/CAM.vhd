----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:35:15 04/29/2018 
-- Design Name: 
-- Module Name:    CAM - Behavioral 
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

use work.constants.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CAM is
		Port (
		CLK : IN STD_LOGIC;
		WR : IN STD_LOGIC;
		RD : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		data : IN STD_LOGIC_VECTOR(W-1 downto 0);
		match : out STD_LOGIC;
		match_addr : out STD_LOGIC_VECTOR(C-1 downto 0)
	);
end CAM;

architecture Behavioral of CAM is

type stdArray is array (0 to D -1) of STD_LOGIC_VECTOR(W-1 downto 0);
signal allMemory : stdArray;
signal data_out : STD_LOGIC_VECTOR(W-1 downto 0);
signal matchTemp : STD_LOGIC := '0';
signal mAddrTmp : STD_LOGIC_VECTOR(C-1 downto 0);

begin
	
	mainProcess:process(reset ,CLK)
		variable firstPlace : integer := 0;
	begin
		if(reset'event and reset = '1') then
			for I in 0 to D-1 loop
				allMemory(I) <= std_logic_vector(to_unsigned(I ,W));
			end loop;
		elsif (CLK'event and CLK = '1') then
			if(WR = '1') then
				for I in 0 to firstPlace loop
					if(allMemory(I) = data) then
						matchTemp <= '1';
						exit;
					end if;
				end loop;
				if(matchTemp = '0') then
					allMemory(firstPlace) <= data;
					firstPlace := firstPlace + 1;
				end if;
			elsif (RD = '1') then
				matchTemp <= '0';
				for I in 0 to firstPlace loop
					if(allMemory(I) = data) then
						matchTemp <= '1';
						mAddrTmp <= std_logic_vector(to_unsigned(I,C));
						exit;
					end if;
				end loop;
			end if;
		end if;
	end process;
	
	match <= matchTemp;
	match_addr <= mAddrTmp;

end Behavioral;

