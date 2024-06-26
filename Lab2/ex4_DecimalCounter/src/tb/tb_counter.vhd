library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity counter_tb is
end counter_tb;

architecture sim of counter_tb is

    component top_module is 
        port (
            clk_t : in std_logic;
            rst_t : in std_logic;
            prst_t : in std_logic;
            pvalue_t : in std_logic_vector(11 downto 0);
            cnt_t : out std_logic_vector(11 downto 0)
        );
    end component;

    constant clk_hz : integer := 1e8;
    constant clk_period : time := 1 sec / clk_hz;

    signal clk_tb : std_logic := '1';
    signal rst_tb : std_logic := '1';
    signal d_tb : std_logic_vector(11 downto 0) := (others => '0');
begin

    clk_tb <= not clk_tb after clk_period / 2;
    rst_tb <= '0' after 20 ns;

    UUT: top_module port map (
        clk_t => clk_tb,
        rst_t => rst_tb,
        prst_t => '0',
        pvalue_t => (others => '0'),
        cnt_t => d_tb
    );

    process
        constant n : integer := 1000;
        variable num : integer range 0 to 999 := 0;
    begin
        wait until rst_tb <= '0';
        wait for 1 ns;
        for i in 0 to n loop
            num := to_integer(unsigned(d_tb(11 downto 8)))*100 + to_integer(unsigned(d_tb(7 downto 4)))*10 + to_integer(unsigned(d_tb(3 downto 0)));
            assert num = i mod n
                report "Error: num = " & integer'image(num) & ", i = " & integer'image(i)
                severity error;
            wait until clk_tb = '1';
            wait for 1 ns;
        end loop;
        wait;
    end process;

end architecture;