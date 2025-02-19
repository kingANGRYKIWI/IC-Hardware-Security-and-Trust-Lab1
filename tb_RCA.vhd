library IEEE,STD,WORK;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity tb_RCA is
    generic (N:integer:= 4);
end tb_RCA;

architecture Behavioral of tb_RCA is

component RCA 
    generic(N:integer);
    port (A,B : in std_logic_vector(N-1 downto 0);
            Cin : in std_logic;
            Cout : out std_logic;
            S : out std_logic_vector(N-1 downto 0));
end component;

signal A,B : std_logic_vector(N-1 downto 0);
signal Ci : std_logic:= '0';
signal S : std_logic_vector(N downto 0);

constant period : time := 12 ns;

begin
uut: RCA generic map(N=>N) port map(A=>A, B=>B, Cin=>Ci, Cout=>S(N), S=>S(N-1 downto 0));

test_VECTOR : process
  
  begin
        ----------------------------------
        A <= "0110";
        B <= "0011";
        Ci <= '0';
        wait for period;
        ----------------------------------
        A <= "1010";
        B <= "0011";
        Ci <= '0';
        wait for period;
        ----------------------------------
        A <= "0100";
        B <= "0101";
        Ci <= '1';
        wait for period;  
        ----------------------------------
        A <= "0101";
        B <= "0110";
        Ci <= '1';
        wait for period;  
        ----------------------------------
  end process;

end Behavioral;