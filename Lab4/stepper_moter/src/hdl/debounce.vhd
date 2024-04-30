library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity debounce is
    generic (
        DELAY_PERIOD : integer := 1e6
    );
    port (
        clk : in std_logic;
        rst : in std_logic;
        sig_in : in std_logic;
        sig_out : out std_logic
    );
end debounce;

architecture rtl of debounce is
    signal sig_last, sig_stable : std_logic;
    signal cnt : integer range 0 to DELAY_PERIOD - 1;
begin
    process(clk, rst)
    begin
        if rst = '1' then
            sig_last <= '0';
            sig_stable <= '0';
            cnt <= 0;
        elsif rising_edge(clk) then
            if sig_in = sig_last then
                cnt <= cnt + 1;
            else
                cnt <= 0;
            end if;

            if cnt = DELAY_PERIOD - 1 then
                cnt <= 0;
                sig_stable <= sig_last;
            end if;

            sig_last <= sig_in;
        end if;
    end process;

    sig_out <= sig_stable;

end architecture;