library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_module is
    port (
        clk_t : in std_logic;
        rst_t : in std_logic;
        prst_t : in std_logic;
        pvalue_t : in std_logic_vector(11 downto 0);
        cnt_t : out std_logic_vector(11 downto 0)
    );
end top_module;

architecture behavioral of top_module is
    component freq_div is
        port (
            clk : in std_logic;
            rst : in std_logic;
            out_clk : out std_logic
        );
    end component;

    component counter is
        port (
            clk : in std_logic;
            rst : in std_logic;
            en : in std_logic;
            prst : in std_logic;
            pval : in std_logic_vector(11 downto 0);
            cnt : out std_logic_vector(11 downto 0)       
        );
    end component;
    signal clk_div : std_logic;
begin
    fd: freq_div port map(clk => clk_t, rst => rst_t, out_clk => clk_div);
    cnt: counter port map(clk => clk_t, rst => rst_t, en => clk_div, prst => prst_t, pval => pvalue_t, cnt => cnt_t);
end architecture;