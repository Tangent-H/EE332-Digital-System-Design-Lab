library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity sevenSegDisplay is
    port (
        clk : in std_logic;
        rst : in std_logic;
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        C : in std_logic_vector(3 downto 0);
        anode : out std_logic_vector(7 downto 0);
        cathode : out std_logic_vector(6 downto 0)
    );
end sevenSegDisplay;

architecture arch of sevenSegDisplay is
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
            clk100mhz : in std_logic;
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


    signal pulse8khz : std_logic;
    signal cnt : std_logic_vector(2 downto 0);
begin
    freq_div: freq_divider port map (clk100mhz => clk, rst => rst, pulse8khz => pulse8khz);
    anode_driv: anode_driver port map (clk => clk, en => pulse8khz, rst => rst, sel => anode, cnt => cnt);
    multi_hex_dec: multi_hex_decoder port map (sel => cnt, in_hex1 => (others => '0'), in_hex2 => (others => '0'), in_hex3 => (others => '0'), in_hex4 => (others => '0'), in_hex5 => (others => '0'), in_hex6 => A, in_hex7 => B, in_hex8 => C, cathode_out => cathode);
    
end architecture;