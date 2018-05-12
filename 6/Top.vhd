----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:54:43 04/22/2018 
-- Design Name: 
-- Module Name:    Top - Behavioral 
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

entity Top is
			port( parallel_input : in STD_LOGIC_VECTOR(3 downto 0);
			serial_input : in STD_LOGIC;
			LR : in STD_LOGIC_VECTOR(1 downto 0);
			LOAD : in STD_LOGIC_vector(1 downto 0);
			reset : in STD_LOGIC;
			CLK : in STD_LOGIC;
			SEG_DATA : out std_logic_vector (7 downto 0);
			SEG_SEL : out std_logic_vector (4 downto 0));
end Top;

architecture Behavioral of Top is

component BCD_SSEG is
	 port ( bcd : in std_logic_vector (3 downto 0);
    SEG_DATA : out std_logic_vector (7 downto 0);
    SEG_SEL : out std_logic_vector (4 downto 0));
end component;

component ShifReg is
		port( parallel_input : in STD_LOGIC_VECTOR(3 downto 0);
			serial_input : in STD_LOGIC;
			LR : in STD_LOGIC_VECTOR(1 downto 0);
			LOAD : in STD_LOGIC_vector(1 downto 0);
			reset : in STD_LOGIC;
			CLK : in STD_LOGIC;
			Reg_out : OUT STD_LOGIC_VECTOR(3 downto 0));
end component;

component counter is
	port(clk : in STD_LOGIC;
			clkOut: out STD_LOGIC);
end component;

signal newClk : STD_LOGIC;
signal bcdSig : STD_LOGIC_VECTOR(3 downto 0);

begin
	i0: counter port map (clk => CLK ,clkOut => newClk);
	i1: ShifReg port map (parallel_input => parallel_input ,serial_input => serial_input ,LR => LR ,LOAD => LOAD ,reset => reset ,CLK => newClk ,Reg_out => bcdSig);
	i2: BCD_SSEG port map (bcd => bcdSig ,SEG_DATA => SEG_DATA ,SEG_SEL => SEG_SEL);


end Behavioral;

