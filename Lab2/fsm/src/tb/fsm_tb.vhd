library IEEE;
use IEEE.std_logic_1164.all;


entity fsm_tb is
end entity;


architecture Behavioral of fsm_tb is
    component fsm is
        port (
            clk : in std_logic;
            rst : in std_logic;
            sig : in std_logic;
            match : out std_logic
        );
    end component;

    signal clk, rst, data, match: std_logic;
    signal data_in_arr: std_logic_vector(0 to 12) := "0000110010101";
begin
    uut: fsm port map (
        clk => clk,
        rst => rst,
        sig => data,
        match => match
    );

    process is
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;

    process is
    begin
        wait for 3 ns;
        for i in 0 to 12 loop
            data <= data_in_arr(i);
            wait for 20 ns;
        end loop;
        wait;
    end process;

    rst <= '1', '0' after 25 ns;
end architecture;
