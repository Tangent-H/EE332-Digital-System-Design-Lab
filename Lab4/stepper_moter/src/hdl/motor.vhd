library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity motor is
    port (
        clk : in std_logic;
        rst : in std_logic;
        direction : in std_logic;
        speed : in integer;
        start : in std_logic;
        phase_A : out std_logic;
        phase_B : out std_logic;
        phase_C : out std_logic;
        phase_D : out std_logic
    );
end motor;

architecture rtl of motor is
    signal count : integer range 0 to 1e9;
    signal step : std_logic_vector (1 downto 0) := "00";
    signal period : integer range 0 to 1e9;
begin
    -- period <= 146484375 / rpm / 100 when rpm > 0 else 0;
    period <= 4e5 when speed = 4 else
            6e5 when speed = 3 else
            8e5 when speed = 2 else
            1e6 when speed = 1 else
            15e5;
            
    process(clk, rst)
    begin
        if rst = '1' then
            count <= 0;
            step <= "00";
        elsif rising_edge(clk) and start = '1' then
            count <= count + 1;
            if count = period - 1 then
                count <= 0;
                if direction = '1' then
                    step <= step - 1;
                else
                    step <= step + 1;
                end if;
            end if;
        end if;
    end process;

    process(step)
    begin
        case step is
            when "00" =>
                phase_A <= '1';
                phase_B <= '0';
                phase_C <= '0';
                phase_D <= '0';
            when "01" =>
                phase_A <= '0';
                phase_B <= '1';
                phase_C <= '0';
                phase_D <= '0';
            when "10" =>
                phase_A <= '0';
                phase_B <= '0';
                phase_C <= '1';
                phase_D <= '0';
            when "11" =>
                phase_A <= '0';
                phase_B <= '0';
                phase_C <= '0';
                phase_D <= '1';
            when others =>
                phase_A <= '0';
                phase_B <= '0';
                phase_C <= '0';
                phase_D <= '0';
        end case;
    end process;

end architecture;