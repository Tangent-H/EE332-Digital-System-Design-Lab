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
    signal direction_tb : std_logic := '0';
    signal sp_up_tb, sp_dn_tb : std_logic := '0';
    signal phase_A_tb, phase_B_tb, phase_C_tb, phase_D_tb : std_logic := '0';
    
begin

    clk <= not clk after clk_period / 2;

    DUT : entity work.top_module(rtl)
    port map (
        clk => clk,
        rst => rst,
        direction => direction_tb,
        sp_up => sp_up_tb,
        sp_down => sp_dn_tb,
        start => '1',
        phase_A => phase_A_tb,
        phase_B => phase_B_tb,
        phase_C => phase_C_tb,
        phase_D => phase_D_tb,
        anode => open,
        cathode => open
    );

    SEQUENCER_PROC : process
    begin
        wait for clk_period * 2;

        rst <= '0';

        wait for clk_period * 10;
        
        sp_up_tb <= '1';
        wait for clk_period * 5;
        sp_up_tb <= '0';

        wait for clk_period * 5;
        sp_up_tb <= '1';
        wait for clk_period * 5;
        sp_up_tb <= '0';

        wait for clk_period * 5;
        sp_dn_tb <= '1';
        wait for clk_period * 5;
        sp_dn_tb <= '0';
        wait for clk_period * 5;
        sp_dn_tb <= '1';
        wait for clk_period * 5;
        sp_dn_tb <= '0';

        wait;
    end process;

end architecture;