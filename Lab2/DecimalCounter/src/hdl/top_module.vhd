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
        pval : in std_logic_vector(3 downto 0);
        cnt : out std_logic_vector(3 downto 0)       
    );
end component;
signal en_cnt : std_logic_vector(2 downto 0) := "000";
signal temp : std_logic_vector(11 downto 0) := (others => '0');
begin
    fd: freq_div port map(clk => clk_t, rst => rst_t, out_clk => en_cnt(0));
    cnt1: counter port map(clk => clk_t, rst => rst_t, en => en_cnt(0), prst => prst_t, pval => pvalue_t(3 downto 0), cnt => temp(3 downto 0));
    cnt2: counter port map(clk => clk_t, rst => rst_t, en => en_cnt(1), prst => prst_t, pval => pvalue_t(7 downto 4), cnt => temp(7 downto 4));
    cnt3: counter port map(clk => clk_t, rst => rst_t, en => en_cnt(2), prst => prst_t, pval => pvalue_t(11 downto 8), cnt => temp(11 downto 8));

    en_cnt(1) <= '1' when (temp(3 downto 0) = "1001" and en_cnt(0)'event and en_cnt(0) = '1') else '0';
    en_cnt(2) <= '1' when (temp(7 downto 0) = "10011001" and en_cnt(0)'event and en_cnt(0) = '1')else '0';
    cnt_t <= temp;
end architecture;