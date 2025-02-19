library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RCA is
    Port ( A,B,Cin : in STD_LOGIC;
           Cout,S : out STD_LOGIC);
end RCA;

architecture Behavioral of RCA is

begin
    Cout <= (Cin AND B) OR (Cin AND A) OR (A AND B);
    
    S <= (A XOR B) XOR Cin;
    
end Behavioral;