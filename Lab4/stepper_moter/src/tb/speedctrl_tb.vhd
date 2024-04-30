library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
use std.env.finish;

entity speedctrl_tb is
end speedctrl_tb;

architecture sim of speedctrl_tb is

    constant clk_hz : integer := 1e8;
    constant clk_period : time := 1 sec / clk_hz;

    signal clk : std_logic := '1';
    signal rst : std_logic := '1';
    signal sp_up_tb, sp_dn_tb : std_logic := '0';
    signal rpm_tb : integer := 0;
begin

    clk <= not clk after clk_period / 2;

    DUT : entity work.speedctrl(rtl)
    port map (
        clk => clk,
        rst => rst,
        sp_up => sp_up_tb,
        sp_dn => sp_dn_tb,
        rpm => rpm_tb
    );

    SEQUENCER_PROC : process
    begin
        wait for clk_period * 2;

        rst <= '0';

        wait for clk_period * 10;

        sp_up_tb <= '1';
        wait for clk_period * 4;
        sp_up_tb <= '0';
        wait for clk_period * 4;
        sp_up_tb <= '1';
        wait for clk_period * 4;
        sp_up_tb <= '0';
        wait for clk_period * 4;
        sp_dn_tb <= '1';
        wait for clk_period * 4;
        sp_dn_tb <= '0';
        wait for clk_period * 4;
        sp_dn_tb <= '1';
        wait for clk_period * 4;
        sp_dn_tb <= '0';
    end process;

end architecture;