library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_module is
    port (
        en : in std_logic;
        S: in std_logic_vector(15 downto 0);
        Z1 : out std_logic_vector (3 downto 0);
        r1 : out std_logic;
        ys1 : out std_logic;
        Z2 : out std_logic_vector (3 downto 0);
        r2 : out std_logic;
        ys2 : out std_logic
    );
end top_module;

architecture behavioral of top_module is
    component prior_enc
        port (
            en : in std_logic;
            S: in std_logic_vector(15 downto 0);
            Z : out std_logic_vector (3 downto 0);
            r : out std_logic;
            ys : out std_logic
        );
    end component;
    component prior_enc164
        port (
            en164 : in std_logic;
            S164 : in std_logic_vector(15 downto 0);
            Z164 : out std_logic_vector(3 downto 0);
            r164 : out std_logic;
            ys164 : out std_logic
        );
    end component;
begin
    prior_enc_t: prior_enc port map (en, S, Z1, r1, ys1);
    prior_enc_tree_t: prior_enc164 port map (en, S, Z2, r2, ys2);
end architecture;