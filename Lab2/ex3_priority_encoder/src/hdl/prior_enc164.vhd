library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity prior_enc164 is
    port (
        en164 : in std_logic;
        S164 : in std_logic_vector(15 downto 0);
        Z164 : out std_logic_vector(3 downto 0);
        r164 : out std_logic;
        ys164 : out std_logic
    );
end prior_enc164;

architecture behavioral of prior_enc164 is
    component prior_enc83 is
        port (
            en83 : in std_logic;
            S83 : in std_logic_vector(7 downto 0);
            Z83 : out std_logic_vector(2 downto 0);
            r83 : out std_logic;
            ys83 : out std_logic
        );
    end component;
    signal h, l : std_logic_vector(2 downto 0);
    signal en, rh, rl : std_logic;
begin
    ph: prior_enc83 port map (en83 => en164, S83 => S164(15 downto 8),Z83 => h, r83 => rh, ys83 => en);
    pl: prior_enc83 port map (en83 => en, S83 => S164(7 downto 0),Z83 => l, r83 => rl, ys83 => open);
    Z164(3) <= rh;
    Z164(2 downto 0) <= h or l;
    r164 <= rh or rl;
    ys164 <= (not (rh or rl)) and en164;
end architecture;