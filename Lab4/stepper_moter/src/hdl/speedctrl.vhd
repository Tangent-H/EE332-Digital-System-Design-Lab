library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity speedctrl is
    generic (
        DELAY_PERIOD : integer := 1e6
    );
    port (
        clk : in std_logic;
        rst : in std_logic;
        sp_up : in std_logic;
        sp_dn : in std_logic;
        speed : out integer range 0 to 4
    );
end speedctrl;

architecture rtl of speedctrl is
    component debounce is
        generic (
            DELAY_PERIOD : integer := 1e6
        );
        port (
            clk : in std_logic;
            rst : in std_logic;
            sig_in : in std_logic;
            sig_out : out std_logic
        );
    end component;

    signal sp_up_d, sp_dn_d : std_logic;
    signal sp_up_d_last, sp_dn_d_last : std_logic := '0';
    signal speed_reg : integer range 0 to 4 := 2;

begin
    db1: debounce
        generic map (
            DELAY_PERIOD => DELAY_PERIOD
        )
        port map (
            clk => clk,
            rst => rst,
            sig_in => sp_up,
            sig_out => sp_up_d
        );
    db2: debounce
        generic map (
            DELAY_PERIOD => DELAY_PERIOD
        )
        port map (
            clk => clk,
            rst => rst,
            sig_in => sp_dn,
            sig_out => sp_dn_d
        );

    process (clk, rst)
    begin
        if rst = '1' then
            speed_reg <= 2;
            sp_up_d_last <= '0';
            sp_dn_d_last <= '0';
        elsif rising_edge(clk) then
            if sp_up_d = '1' and sp_up_d_last = '0' then
                if speed_reg < 4 then
                    speed_reg <= speed_reg + 1;
                end if;
            elsif sp_dn_d = '1' and sp_dn_d_last = '0' then
                if speed_reg > 0 then
                    speed_reg <= speed_reg - 1;
                end if;
            end if;

            sp_up_d_last <= sp_up_d;
            sp_dn_d_last <= sp_dn_d;
        end if;
    end process;

    speed <= speed_reg;

end architecture;
