library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_top_module is
    -- No ports for a testbench
end tb_top_module;

architecture behavior of tb_top_module is
    -- Signal declarations
    signal tb_clk : std_logic := '0';
    signal tb_rst : std_logic := '1'; -- Start in reset state
    signal tb_A, tb_B, tb_C, tb_D : std_logic_vector(3 downto 0);
    signal tb_anode : std_logic_vector(7 downto 0);
    signal tb_cathode : std_logic_vector(6 downto 0);

    component top_module
        port (
            clk : in std_logic;
            rst : in std_logic;
            A : in std_logic_vector(3 downto 0);
            B : in std_logic_vector(3 downto 0);
            C : in std_logic_vector(3 downto 0);
            D : in std_logic_vector(3 downto 0);
            anode : out std_logic_vector(7 downto 0);
            cathode : out std_logic_vector(6 downto 0)
        );
    end component;
    -- UUT instantiation
    begin
    uut: top_module
        port map (
            clk => tb_clk,
            rst => tb_rst,
            A => tb_A,
            B => tb_B,
            C => tb_C,
            D => tb_D,
            anode => tb_anode,
            cathode => tb_cathode
        );

    -- Clock process definition
    clk_process :process
    begin
        while true loop
            tb_clk <= '0';
            wait for 5 ns; -- Simulate a 100 MHz clock
            tb_clk <= '1';
            wait for 5 ns;
        end loop;
    end process;

    -- Stimulus process definition
    stim_proc: process
    begin
        -- Initial reset
        tb_rst <= '1';
        wait for 50 ns;
        tb_rst <= '0';
        
        -- Test vectors
        tb_A <= "0001"; -- Example values
        tb_B <= "0010";
        tb_C <= "0100";
        tb_D <= "1000";
        wait for 1000 ns;

        tb_A <= "0011"; -- Example values
        tb_B <= "0110";
        tb_C <= "1100";
        tb_D <= "1010";
        wait for 1000 ns;

        -- Add more test vectors and assertions to check the output behavior

        -- End simulation
        wait;
    end process;
end behavior;
