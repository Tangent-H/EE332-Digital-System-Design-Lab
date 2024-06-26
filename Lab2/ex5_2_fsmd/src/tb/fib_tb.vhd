library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

use std.textio.all;
use std.env.finish;

entity fib_tb is
end fib_tb;

architecture sim of fib_tb is

    constant clk_hz : integer := 1e8;
    constant clk_period : time := 1 sec / clk_hz;

    signal clk : std_logic := '1';
    signal rst : std_logic := '1'; 
    signal n_tb : std_logic_vector(5 downto 0) := (others => '0');
    signal start_tb : std_logic := '0';
    signal fib_tb : std_logic_vector(31 downto 0);
    signal ready_tb : std_logic;
begin

    clk <= not clk after clk_period / 2;

    DUT : entity work.fib(rtl)
    port map (
        clk => clk,
        rst => rst,
        n => n_tb,
        start => start_tb,
        fib_n => fib_tb,
        ready => ready_tb
    );

    SEQUENCER_PROC : process
    begin
        
        wait for clk_period * 2;

        rst <= '0';

        wait for clk_period * 10;

        start_tb <= '1';

        for i in 0 to 10 loop
            wait for clk_period * 10;
                n_tb <=  n_tb +1;
        end loop;

        wait for clk_period * 2;
        start_tb <= '0';
        wait;

    end process;

end architecture;