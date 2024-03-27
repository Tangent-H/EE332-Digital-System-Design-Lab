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
    constant N : integer := 1e7;
    signal q_reg, q_next : integer range 0 to N-1 := 0;
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
    -- out_tmp <= (not out_tmp) when q_reg ;    !!don't use signal flipping in a singal concurrent statement or the output will be flipping all the time
    out_clk <= '1' when q_reg = N-1 else '0';
end architecture;