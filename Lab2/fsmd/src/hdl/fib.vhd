library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity fib is
    port (
        clk : in std_logic;
        rst : in std_logic;
        n : in std_logic_vector(5 downto 0);
        start : in std_logic;
        fib_n : out std_logic_vector(31 downto 0);
        ready : out std_logic
    );
end fib;

architecture rtl of fib is
    type state_type is (idle, op);
    signal state_reg, state_next : state_type;
    signal n1_reg, n1_next, n2_reg, n2_next : std_logic_vector(31 downto 0);
    signal ni_reg, ni_next : std_logic_vector(5 downto 0);
begin
    --- state and data registers
    process(clk, rst) is
    begin
        if rst = '1' then
            state_reg <= idle;
            n1_reg <= std_logic_vector(to_unsigned(1,32));
            n2_reg <= ((others => '0'));
            ni_reg <= (others => '0');
        elsif rising_edge(clk) then
            state_reg <= state_next;
            n1_reg <= n1_next;
            n2_reg <= n2_next;
            ni_reg <= ni_next;
        end if;
    end process;

    --- combinational circuit
    process (start, state_reg, n1_reg, n2_reg, ni_reg, n) is
    begin
        --- default values
        ready <= '0';
        state_next <= state_reg;
        n1_next <= n1_reg;
        n2_next <= n2_reg;
        ni_next <= ni_reg;
        
        case state_reg is
            when idle => 
                ready <= '1';
                if start = '1' then
                    n1_next <= std_logic_vector(to_unsigned(1,32));
                    n2_next <= (others => '0');
                    ni_next <= n;   --- need delta delay to take in effect, thus, don't use ni_next = 0 in the next line
                    if n = 0 then
                        fib_n <= (others => '0');
                    elsif n = 1 then
                        fib_n <= std_logic_vector(to_unsigned(1,32));
                    else
                        state_next <= op;
                    end if;
                end if;
            when op => 
                n1_next <= n1_reg + n2_reg;
                n2_next <= n1_reg;
                ni_next <= ni_reg - 1;
                if ni_next = 1 then
                    fib_n <= n1_reg;
                    state_next <= idle;
                end if;
        end case;
    end process;
end architecture;