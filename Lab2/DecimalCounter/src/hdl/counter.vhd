library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;    -- for the "+" operator in std_logic_vector

entity counter is
    port (
        clk : in std_logic;
        rst : in std_logic;
        en : in std_logic;
        prst : in std_logic;
        pval : in std_logic_vector(11 downto 0);
        cnt : out std_logic_vector(11 downto 0)       
    );
end counter;

architecture behavioral of counter is
    signal q_reg, q_next : std_logic_vector(11 downto 0):= (others => '0');
begin
    process(clk, rst, prst) is
    begin
        if prst = '1' then
            q_reg <= pval;
        elsif rst = '1' then
            q_reg <= (others => '0');
        elsif (clk'event and clk = '1' and en = '1') then
            q_reg <= q_next;
        end if;
    end process;

    q_next(3 downto 0) <= "0000" when q_reg(3 downto 0) >= "1001" else q_reg(3 downto 0) + 1;
    q_next(7 downto 4) <= "0000" when q_reg(7 downto 0) >= "10011001" else q_reg(7 downto 4) + 1 when q_reg(3 downto 0) >= "1001" else q_reg(7 downto 4);
    q_next(11 downto 8) <= "0000" when q_reg(11 downto 0) >= "100110011001" else q_reg(11 downto 8) + 1 when q_reg(7 downto 0) >= "10011001" else q_reg(11 downto 8);
    cnt <= q_reg;
end architecture;