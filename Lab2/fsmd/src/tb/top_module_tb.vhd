library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
use std.env.finish;

entity top_module_tb is
end top_module_tb;

architecture sim of top_module_tb is

    constant clk_hz : integer := 1e8;
    constant clk_period : time := 1 sec / clk_hz;

    signal clk : std_logic := '1';
    signal rst : std_logic := '1';
    signal anode : std_logic_vector(7 downto 0);
    signal cathode : std_logic_vector(6 downto 0);
    signal ready, start: std_logic;

begin

    clk <= not clk after clk_period / 2;

    DUT : entity work.top_module(rtl)
    port map (
        clk => clk,
        rst => rst,
        n => "000011",
        start => start,
        anode => anode,
        cathode => cathode,
        ready => ready
    );

    SEQUENCER_PROC : process
    begin
        start <= '0';
        wait for clk_period * 2;
        rst <= '0';
        wait for 200 ns;
        start <= '1';
        wait for clk_period * 1;
        start <= '0';
        wait;
    end process;

end architecture;