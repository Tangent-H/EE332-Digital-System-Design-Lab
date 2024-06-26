library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm is
    port (
        clk : in std_logic;
        rst : in std_logic;
        sig : in std_logic;
        match : out std_logic
    );
end fsm;

architecture rtl of fsm is
    type state_t is (s0, s1, s2, s3);
    signal state, next_state : state_t := s0;
begin
    clk_proc: process(clk,rst) is
    begin
        if rst = '1' then
            state <= s0;
        elsif rising_edge(clk) then
            state <= next_state;
        end if;
    end process;

    com_proc: process(state, sig) is
    begin
        next_state <= state;
        match <= '0';
        case state is 
            when s0 => 
                if sig = '1' then
                    next_state <= s1;
                end if;
            when s1 =>
                if sig = '0' then
                    next_state <= s2;
                end if;
            when s2 => 
                if sig = '0' then
                    next_state <= s0;
                else
                    next_state <= s3;
                    match <= '1';
                end if;
            when s3 =>
                next_state <= s3;
                match <= '1';
            end case;
    end process;

end architecture;