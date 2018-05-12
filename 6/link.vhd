----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:33:42 04/15/2018 
-- Design Name: 
-- Module Name:    link - Behavioral 
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

entity link is
		port( parallel_input : in STD_LOGIC_VECTOR(3 downto 0);
			serial_input : in STD_LOGIC;
			LR : in STD_LOGIC_VECTOR(1 downto 0);
			LOAD : in STD_LOGIC;
			reset : in STD_LOGIC;
			clk : in STD_LOGIC);
end link;

architecture Behavioral of link is

	component ShiftReg is
		port( parallel_input : in STD_LOGIC_VECTOR(3 downto 0);
			serial_input : in STD_LOGIC;
			LR : in STD_LOGIC_VECTOR(1 downto 0);
			LOAD : in STD_LOGIC;
			reset : in STD_LOGIC;
			CLK : in STD_LOGIC;
			Reg_out : OUT STD_LOGIC_VECTOR(3 downto 0));
		end component;
		
	component counter is 
		port(clk : in STD_LOGIC;
			clkOut: out STD_LOGIC);
	end component;

signal clkO : STD_LOGIC;

begin

	i0: counter port map(clk => CLK ,clkOut => clkO);
	i1: ShiftReg port map(parallel_input => parallel_input, serial_input => serial_input ,LR => LR ,LOAD => LOAD ,reset => reset ,CLK => clkO);


end Behavioral;

