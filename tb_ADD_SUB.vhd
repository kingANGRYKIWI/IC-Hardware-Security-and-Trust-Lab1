library IEEE,STD,WORK;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity tb_ADD_SUB is
    generic (N:integer:= 4);
end tb_ADD_SUB;

architecture Behavioral of tb_ADD_SUB is

component ADD_SUB
    generic(N:integer);
    port (A,B : in std_logic_vector(N-1 downto 0);
            M : in std_logic;
            Cout : out std_logic;
            S : out std_logic_vector(N-1 downto 0));
end component;

signal A,B,S : std_logic_vector(N-1 downto 0);
signal M,Cout : std_logic;

constant period : time := 10 ns;

begin
uut: ADD_SUB generic map(N=>N) port map (A=>A, B=>B, M=>M, Cout=>Cout, S=>S);

test_VECTOR : process
  
  begin
        ----------------------------------
        A <= "0110";
        B <= "0011";
        M <= '0';
        wait for period;
        ----------------------------------
        A <= "1010";
        B <= "0011";
        M <= '0';
        wait for period;
        ----------------------------------
        A <= "0100";
        B <= "0101";
        M <= '1';
        wait for period;  
        ----------------------------------
        A <= "0101";
        B <= "0110";
        M <= '1';
        wait for period;  
        ----------------------------------
  end process;

end Behavioral;
---