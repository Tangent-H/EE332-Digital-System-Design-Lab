library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity top_module is
    port (
        clk : in std_logic;
        rst : in std_logic;
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        C : in std_logic_vector(3 downto 0);
        D : in std_logic_vector(3 downto 0);
        anode : out std_logic_vector(7 downto 0);
        cathode : out std_logic_vector(6 downto 0)
    );
end top_module;

architecture arch of top_module is
    component anode_driver is
        port (
            clk : in std_logic;
            en : in std_logic;
            rst : in std_logic;
            sel : out std_logic_vector(7 downto 0);
            cnt : out std_logic_vector(2 downto 0)
        );
    end component;
    component freq_divider is
        port (
            clk10mhz : in std_logic;
            rst : in std_logic;
            pulse8khz : out std_logic
        );
    end component;
    component multi_hex_decoder is
        port (
            sel : in std_logic_vector(2 downto 0);
            in_hex1, in_hex2, in_hex3, in_hex4, in_hex5, in_hex6, in_hex7, in_hex8 : in std_logic_vector(3 downto 0);
            cathode_out : out std_logic_vector(6 downto 0)
        );
    end component;
    -- component pll_clk is
    --     port (
    --         clk10mhz : out std_logic;
    --         reset : in std_logic;
    --         locked : out std_logic;
    --         clk100mhz : in std_logic
    --     );
    -- end component;
    -- signal locked : std_logic;
    signal enable : std_logic;
    signal clk10mhz : std_logic;
    signal pulse8khz : std_logic;
    signal cnt : std_logic_vector(2 downto 0);
    signal result1, result2, result3, result4 : std_logic_vector(3 downto 0);
begin
    -- pll: pll_clk port map (clk10mhz => clk10mhz, reset => rst, locked => locked, clk100mhz => clk);
    clk10mhz <= clk;    -- testing
    freq_div: freq_divider port map (clk10mhz => clk10mhz, rst => rst, pulse8khz => pulse8khz);
    anode_driv: anode_driver port map (clk => clk10mhz, en => enable, rst => rst, sel => anode, cnt => cnt);
    multi_hex_dec: multi_hex_decoder port map (sel => cnt, in_hex1 => A, in_hex2 => B, in_hex3 => C, in_hex4 => D, in_hex5 => result1, in_hex6 => result2, in_hex7 => result3, in_hex8 => result4, cathode_out => cathode);

    enable <= pulse8khz;
    result1 <= A+B;
    result2 <= A-B;
    result3 <= C+D;
    result4 <= C-D;
end architecture;