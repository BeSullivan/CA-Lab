----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:57:44 02/25/2018 
-- Design Name: 
-- Module Name:    comparatorBase - Behavioral 
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

entity comparatorBase is
	Port (
		A : in STD_LOGIC;
		B : in STD_LOGIC;
		
		wasGT : in STD_LOGIC;
		wasEQ : in STD_LOGIC;
		wasLT : in STD_LOGIC;
		
		A_GT_B : out STD_LOGIC;
		A_EQ_B : out STD_LOGIC;
		A_LT_B : out STD_LOGIC
		);
end comparatorBase;

architecture gateLevel of comparatorBase is

	signal notGT ,notLT ,isGT ,isLT ,isEQ : STD_LOGIC;

begin
	
	notGT <= not wasGT;
	notLT <= not wasLT;
	
	isGT <= A and (not B) and notLT;
	isLT <= B and (not A) and notGT;
	isEQ <= A xnor B;
	
	A_GT_B <= wasGT or isGT;
	A_LT_B <= wasLT or isLT;
	A_EQ_B <= isEQ and notLT and notGT;

end gateLevel;

