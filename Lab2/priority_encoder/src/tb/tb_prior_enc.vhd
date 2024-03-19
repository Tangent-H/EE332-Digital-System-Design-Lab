library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity tb_prior_enc is

end tb_prior_enc ; 

architecture test of tb_prior_enc is
    -- component prior_enc is
    --     port (
    --         S : in std_logic_vector(15 downto 0) ;
    --         Z : out std_logic_vector(3 downto 0);
    --         r : out std_logic
    --       ) ;
    -- end component ;

    component prior_enc164 is
        port (
            en164 : in std_logic;
            S164 : in std_logic_vector(15 downto 0);
            Z164 : out std_logic_vector(3 downto 0);
            r164 : out std_logic;
            ys164 : out std_logic
        );
    end component;


    signal S_tb : std_logic_vector(15 downto 0) ;
    signal Z_tb : std_logic_vector(3 downto 0) ;
    signal r_tb : std_logic ;
begin
    -- UUT1: prior_enc port map (S => S_tb, Z => Z_tb, r => r_tb) ;
    UUT2: prior_enc164 port map (en164 => '1', S164 => S_tb, Z164 => Z_tb, r164 => r_tb, ys164 => open);
    
    seq: process
    begin
        S_tb <= "0000000000000000" ;
        wait for 5 ns ;
        assert Z_tb = "0000" and r_tb = '0'
            report "The expression is false"
            severity error;
        
        S_tb <= "0000000000000001" ;
        wait for 5 ns ;
        assert r_tb = '1'
            report "The expression is false"
            severity error;
        
        for i in 0 to 15 loop
            S_tb <=to_stdlogicvector(to_bitvector(S_tb) sll 1);
            
            wait for 5 ns ;
            assert r_tb = '1'
                report "The expression is false"
                severity error;
        end loop ;
        
        wait;
    end process;
        
end architecture;