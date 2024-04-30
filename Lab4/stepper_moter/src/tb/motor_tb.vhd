library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
use std.env.finish;

entity motor_tb is
end motor_tb;

architecture sim of motor_tb is

    constant clk_hz : integer := 1e8;
    constant clk_period : time := 1 sec / clk_hz;

    signal clk : std_logic := '1';
    signal rst : std_logic := '1';
    signal direction_tb : std_logic := '0';
    signal rpm_tb : integer := 6e5;
    signal phase_A_tb, phase_B_tb, phase_C_tb, phase_D_tb : std_logic := '0';
    signal start_tb : std_logic := '0';
begin

    clk <= not clk after clk_period / 2;

    DUT : entity work.motor(rtl)
    port map (
        clk => clk,
        rst => rst,
        direction => direction_tb,
        rpm => rpm_tb,
        start => start_tb,
        phase_A => phase_A_tb,
        phase_B => phase_B_tb,
        phase_C => phase_C_tb,
        phase_D => phase_D_tb
    );

    SEQUENCER_PROC : process
    begin
        wait for clk_period * 2;

        rst <= '0';

        wait for clk_period * 2;
        start_tb <= '1';

        wait for clk_period * 30;
        direction_tb <= '1';


    end process;

end architecture;