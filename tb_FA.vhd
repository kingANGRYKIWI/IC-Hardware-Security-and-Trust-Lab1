library IEEE,STD,WORK;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity tb_FA is
 
end tb_FA;

architecture Behavioral of tb_FA is

component FA
    port (A,B : in std_logic;
            Cin : in std_logic;
            Cout,S : out std_logic);
end component;

signal a,b : std_logic:= '0';
signal Ci : std_logic:= '0';
signal Co,s : std_logic;

constant period : time := 1 ns;

begin
uut: FA port map (A=>a, B=>b, Cin=>Ci, Cout=>Co, S=>s);

a <= not a after period;
b <= not b after period*2;
Ci <= not Ci after period*4;

end Behavioral;