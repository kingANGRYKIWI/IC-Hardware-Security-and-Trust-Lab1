library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FA is
    Port (A,B,Cin : in STD_LOGIC;
           Cout,S : out STD_LOGIC);
end FA;

architecture FA_Behavioral of FA is
begin
    Cout <= (Cin AND B) OR (Cin AND A) OR (A AND B);
    S <= (A XOR B) XOR Cin;
end;
---
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;

entity XOR2 is 
    Port (A,B :in std_logic;
            Y: out std_logic);
end entity;

architecture XOR2_Behavioral of XOR2 is 
    begin
        Y <= A XOR B;
    end;
---
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ADD_SUB is
    generic (N:integer:= 4);
    port (A,B : in std_logic_vector(N-1 downto 0);
            M: in std_logic;
            Cout : out std_logic;
            S : out std_logic_vector(N-1 downto 0));
end; 

architecture ADD_SUB_Behavioral of ADD_SUB is
component FA
    port (A,B,Cin : in std_logic;
            Cout,S : out std_logic);
end component;
component XOR2 
    port (A,B : in std_logic;
            Y : out std_logic);
end component;

signal OP : std_logic_vector(N-1 downto 0);
signal C : std_logic_vector(N downto 0);

begin
C(0) <= M;
GJ: for I in 0 to N-1 generate
    GJ:XOR2 port map(A=>B(I), B=>M, Y=>OP(I));
end generate;
GI: for I in 0 to N-1 generate
    GI:FA port map(A=>A(I), B=>OP(I), Cin=>C(I), Cout =>C(I+1), S => S(I));
end generate;
Cout <= C(N);
end;