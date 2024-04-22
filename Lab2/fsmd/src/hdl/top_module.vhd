library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_module is
    port (
        clk : in std_logic;
        rst : in std_logic;
        n : in std_logic_vector(5 downto 0);
        start : in std_logic;
        anode : out std_logic_vector(7 downto 0);
        cathode : out std_logic_vector(6 downto 0);
        ready : out std_logic
    );
end top_module;

architecture rtl of top_module is
    component sevenSegDisplay is
        port (
            clk : in std_logic;
            rst : in std_logic;
            hex_in : in std_logic_vector(31 downto 0);
            anode : out std_logic_vector(7 downto 0);
            cathode : out std_logic_vector(6 downto 0)
        );
    end component; 

    component fib is
        port (
            clk : in std_logic;
            rst : in std_logic;
            n : in std_logic_vector(5 downto 0);
            start : in std_logic;
            fib_n : out std_logic_vector(31 downto 0);
            ready : out std_logic
        );
    end component;
    
    -- component ila_0 is
    --     PORT (
    --         clk : IN STD_LOGIC;
    --         probe0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    --         probe1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    --         probe2 : IN STD_LOGIC_VECTOR(6 DOWNTO 0)
    --     );
    -- end component;

    signal fib_n : std_logic_vector(31 downto 0);
    signal anode_t : std_logic_vector(7 downto 0);
    signal cathode_t : std_logic_vector(6 downto 0);

begin
    fib_inst : fib
        port map (
            clk => clk,
            rst => rst,
            n => n,
            start => start,
            fib_n => fib_n,
            ready => ready
        );

    sevenSegDispaly_inst : sevenSegDisplay
        port map (
            clk => clk,
            rst => rst,
            hex_in => fib_n,
            anode => anode_t,
            cathode => cathode_t
        );

    -- ila_0_inst : ila_0
    --     PORT MAP (
    --         clk => clk,
    --         probe0 => fib_n,
    --         probe1 => anode_t,
    --         probe2 => cathode_t
    --     );
        
    anode <= anode_t;
    cathode <= cathode_t;    
end architecture;