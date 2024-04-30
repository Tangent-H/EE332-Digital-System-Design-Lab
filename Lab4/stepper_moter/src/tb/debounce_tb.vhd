library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
use std.env.finish;

entity debounce_tb is
end debounce_tb;

architecture sim of debounce_tb is

    constant clk_hz : integer := 1e8;
    constant clk_period : time := 1 sec / clk_hz;

    signal clk : std_logic := '1';
    signal rst : std_logic := '1';

    signal in_tb, out_tb : std_logic;

begin

    clk <= not clk after clk_period / 2;

    DUT : entity work.debounce(rtl)
    generic map (
        DELAY_PERIOD => 3
    )
    port map (
        clk => clk,
        rst => rst,
        sig_in => in_tb,
        sig_out => out_tb
    );

    SEQUENCER_PROC : process
    begin
        wait for clk_period * 2;

        rst <= '0';

        wait for clk_period * 10;
        in_tb <= '0';
        wait for clk_period ;
        in_tb <= '1';
        wait for clk_period * 2;
        in_tb <= '0';
        wait for clk_period * 4;
        in_tb <= '1';
        
    end process;

end architecture;