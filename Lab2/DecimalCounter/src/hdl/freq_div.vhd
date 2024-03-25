library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity freq_div is
    port (
        clk : in std_logic;
        rst : in std_logic;
        out_clk : out std_logic
    );
end freq_div;

architecture behavioral of freq_div is
constant N : integer := 2;
signal q_reg, q_next : integer range 0 to N-1 := 0;
-- to count 10^8 clock cycles, we need 27 bits
begin
count_PROC : process(clk, rst) is
begin
    if rst = '1' then
        q_reg <= 0;
    elsif (clk'event and clk = '1') then
        q_reg <= q_next;
    end if;
end process;
q_next <= (q_reg + 1) when q_reg < N-1 else 0;
out_clk <= '1' when q_reg = N-1 else '0';
end architecture;