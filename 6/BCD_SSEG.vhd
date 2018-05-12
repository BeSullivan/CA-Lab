----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:47:03 04/22/2018 
-- Design Name: 
-- Module Name:    BCD_SSEG - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all;
 
entity BCD_SSEG is
    port ( bcd : in std_logic_vector (3 downto 0);
    SEG_DATA : out std_logic_vector (7 downto 0);
    SEG_SEL : out std_logic_vector (4 downto 0));
end BCD_SSEG;
 
architecture behavioral of BCD_SSEG is
 
begin
 
    process(bcd)
    begin
        
        case bcd is
        when "0000" =>
        SEG_DATA <= "00111111"; ---0
        when "0001" =>
        SEG_DATA <= "00000110"; ---1
        when "0010" =>
        SEG_DATA <= "01011011"; ---2
        when "0011" =>
        SEG_DATA <= "01001111"; ---3
        when "0100" =>
        SEG_DATA <= "01100110"; ---4
        when "0101" =>
        SEG_DATA <= "01101101"; ---5
        when "0110" =>
        SEG_DATA <= "01111101"; ---6
        when "0111" =>
        SEG_DATA <= "00000111"; ---7
        when "1000" =>
        SEG_DATA <= "01111111"; ---8
        when "1001" =>
        SEG_DATA <= "01101111"; ---9
        when "1010" => 
        SEG_DATA <= "01110111"; ---A
        when "1011" => 
        SEG_DATA <= "01111100"; ---B
		  when "1100" => 
        SEG_DATA <= "00111001"; ---C
		  when "1101" => 
        SEG_DATA <= "01011110"; ---D
		  when "1110" => 
        SEG_DATA <= "01111001"; ---E
		  when others =>
        SEG_DATA <= "01110001"; ---F
        end case;
    
    end process;
    
    SEG_SEL <= "00001";
end behavioral;

