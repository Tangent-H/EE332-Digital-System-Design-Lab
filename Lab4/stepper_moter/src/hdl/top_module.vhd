library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_module is
    port (
        clk : in std_logic;
        rst : in std_logic;
        direction : in std_logic;
        sp_up : in std_logic;
        sp_down : in std_logic;
        start : in std_logic;
        phase_A, phase_B, phase_C, phase_D : out std_logic;
        anode : out std_logic_vector(7 downto 0);
        cathode : out std_logic_vector(6 downto 0)
    );
end top_module;

architecture rtl of top_module is
    component speedctrl is
        generic (
            DELAY_PERIOD : integer := 1e6
        );
        port (
            clk : in std_logic;
            rst : in std_logic;
            sp_up : in std_logic;
            sp_dn : in std_logic;
            speed : out integer range 0 to 9
        );
    end component;

    component motor is
        port (
            clk : in std_logic;
            rst : in std_logic;
            direction : in std_logic;
            speed : in integer;
            start : in std_logic;
            phase_A : out std_logic;
            phase_B : out std_logic;
            phase_C : out std_logic;
            phase_D : out std_logic
        );
    end component;

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

    component sevenSegDisplay is
        port (
            clk : in std_logic;
            rst : in std_logic;
            hex_in : in std_logic_vector(31 downto 0);
            anode : out std_logic_vector(7 downto 0);
            cathode : out std_logic_vector(6 downto 0)
        );
    end component;

    signal direction_d, start_d : std_logic;
    signal speed : integer range 0 to 9;
    signal hex_in : std_logic_vector(31 downto 0);
begin

    hex_in <= std_logic_vector(to_unsigned(speed, 32));

    d1: debounce
        generic map (
            DELAY_PERIOD => 1e6
        )
        port map (
            clk => clk,
            rst => rst,
            sig_in => direction,
            sig_out => direction_d
        );
    
    d2: debounce
        generic map (
            DELAY_PERIOD => 1e6
        )
        port map (
            clk => clk,
            rst => rst,
            sig_in => start,
            sig_out => start_d
        );

    spctrl: speedctrl
        generic map (
            DELAY_PERIOD => 1e6
        )
        port map (
            clk => clk,
            rst => rst,
            sp_up => sp_up,
            sp_dn => sp_down,
            speed => speed
        );

    mt: motor
        port map (
            clk => clk,
            rst => rst,
            direction => direction_d,
            speed => speed,
            start => start_d,
            phase_A => phase_A,
            phase_B => phase_B,
            phase_C => phase_C,
            phase_D => phase_D
        );

    ssd: sevenSegDisplay
        port map (
            clk => clk,
            rst => rst,
            hex_in => hex_in,
            anode => anode,
            cathode => cathode
        );
end architecture;