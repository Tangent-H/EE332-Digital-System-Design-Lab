library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity prior_enc83 is
    port (
        en83 : in std_logic;
        S83 : in std_logic_vector(7 downto 0);
        Z83 : out std_logic_vector (2 downto 0);
        r83 : out std_logic;
        ys83 : out std_logic
    );
end prior_enc83;

architecture behavioral of prior_enc83 is
    component prior_enc42
        port (
            en42 : in std_logic;
            S42 : in std_logic_vector(3 downto 0);
            Z42 : out std_logic_vector (1 downto 0);
            r42 : out std_logic;
            ys42 : out std_logic
        );
    end component;
    signal h, l : std_logic_vector(1 downto 0);
    signal en, rl, rh : std_logic;
begin
    ph: prior_enc42 port map (en42 => en83, S42 => S83(7 downto 4), Z42 => h, r42 => rh, ys42 => en);
    pl: prior_enc42 port map (en42 => en, S42 => S83(3 downto 0), Z42 => l,r42 => rl, ys42 => open);
    Z83(2) <= rh;
    Z83(1 downto 0) <= h or l;
    r83 <= rh or rl;
    ys83 <= (not (rh or rl)) and en83;
end architecture;
