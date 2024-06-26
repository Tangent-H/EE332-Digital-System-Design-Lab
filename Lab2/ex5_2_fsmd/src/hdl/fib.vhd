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
    type state_type is (idle, load, op);
    signal state_reg, state_next : state_type;
    signal n1_reg, n1_next, n2_reg, n2_next : std_logic_vector(31 downto 0);
    signal ni_reg, ni_next : std_logic_vector(5 downto 0);
    signal fib_reg, fib_next : std_logic_vector(31 downto 0);
begin
    --- state and data registers
    process(clk, rst) is
    begin
        if rst = '1' then
            state_reg <= idle;
            n1_reg <= std_logic_vector(to_unsigned(1,32));
            n2_reg <= ((others => '0'));
            ni_reg <= (others => '0');
            fib_reg <= (others => '0');
        elsif rising_edge(clk) then
            state_reg <= state_next;
            n1_reg <= n1_next;
            n2_reg <= n2_next;
            ni_reg <= ni_next;
            fib_reg <= fib_next;
        end if;
    end process;

    --- combinational circuit
    --- only use the input value and register value in "if" statement
    --- only assign value to next_value in this process
    --- output signal needs to be taken from a register value
    process (start, state_reg, n1_reg, n2_reg, ni_reg, fib_reg, n) is
    begin
        --- default values
        ready <= '0';
        fib_next <= fib_reg;
        state_next <= state_reg;
        n1_next <= n1_reg;
        n2_next <= n2_reg;
        ni_next <= ni_reg;

        case state_reg is
            when idle => 
                ready <= '1';
                if start = '1' then
                    state_next <=  load;
                end if;
            when load =>
                n1_next <= std_logic_vector(to_unsigned(1,32));
                n2_next <= (others => '0');
                if start ='0' then
                    ni_next <= n;   --- don't assign a signal and use it immediately in a process (delta delay)
                    if n = 0 then
                        fib_next <= (others => '0');
                        state_next <= idle;
                    elsif n = 1 then
                        fib_next <= std_logic_vector(to_unsigned(1,32));
                        state_next <= idle;
                    else
                        state_next <= op;
                    end if;
                end if;
            when op => 
                n1_next <= n1_reg + n2_reg;
                n2_next <= n1_reg;
                ni_next <= ni_reg - 1;
                if ni_reg = 1 then
                    fib_next <= n1_reg;
                    state_next <= idle;
                end if;
        end case;
    end process;
    fib_n <= fib_reg;
end architecture;