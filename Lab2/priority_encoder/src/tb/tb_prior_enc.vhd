library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity tb_prior_enc is

end tb_prior_enc ; 

architecture test of tb_prior_enc is
    component top_module is
        port (
            en : in std_logic;
            S: in std_logic_vector(15 downto 0);
            Z1 : out std_logic_vector (3 downto 0);
            r1 : out std_logic;
            ys1 : out std_logic;
            Z2 : out std_logic_vector (3 downto 0);
            r2 : out std_logic;
            ys2 : out std_logic
        );
    end component ;


    signal S_tb : std_logic_vector(15 downto 0) ;
    signal Z1_tb : std_logic_vector(3 downto 0) ;
    signal r1_tb : std_logic ;
    signal Z2_tb : std_logic_vector(3 downto 0) ;
    signal r2_tb : std_logic ;
begin
    UUT: top_module port map(en => '1', S => S_tb, Z1 => Z1_tb, r1 => r1_tb, ys1 => open, Z2 => Z2_tb, r2 => r2_tb, ys2 => open) ;
    
    seq: process
    begin
        S_tb <= "0000000000000000" ;
        wait for 5 ns ;
        
        S_tb <= "0000000000000001" ;
        wait for 5 ns ;
        
        for i in 0 to 15 loop
            S_tb <=to_stdlogicvector(to_bitvector(S_tb) sll 1);
            wait for 5 ns ;
        end loop ;
        
        wait;
    end process;
        
end architecture;