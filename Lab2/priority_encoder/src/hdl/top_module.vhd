library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_module is
    port (
        S: in std_logic_vector(15 downto 0);
        Z : out std_logic_vector (3 downto 0);
        r : out std_logic
    );
end top_module;

architecture behavioral of top_module is
    -- component prior_tree
    --     port (
    --         S: in std_logic_vector(15 downto 0);
    --         Z : out std_logic_vector (3 downto 0);
    --         r : out std_logic
    --     );
    -- end component;

    component prior_enc
        port (
            S: in std_logic_vector(15 downto 0);
            Z : out std_logic_vector (3 downto 0);
            r : out std_logic
        );
    end component;
begin
    -- prior_tree_t: prior_tree port map (S, Z, r);
    prior_enc_t: prior_enc port map (S, Z, r);
end architecture;