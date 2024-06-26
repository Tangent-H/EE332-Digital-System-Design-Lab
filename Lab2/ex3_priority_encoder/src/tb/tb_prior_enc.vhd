library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity tb_prior_enc is

end tb_prior_enc ; 

architecture test of tb_prior_enc is
    component top_module is
        port (
            S: in std_logic_vector(15 downto 0);
            Z : out std_logic_vector (3 downto 0);
            r : out std_logic
        );
    end component ;


    signal S_tb : std_logic_vector(15 downto 0) ;
    signal Z_tb : std_logic_vector(3 downto 0) ;
    signal r_tb : std_logic ;
begin
    UUT: top_module port map(S => S_tb, Z => Z_tb, r => r_tb) ;
    
    seq: process
    begin
        S_tb <= "0000000000000000" ;
        wait for 10 ns ;
        
        S_tb <= "0000000000000001" ;
        wait for 10 ns ;
        
        for i in 0 to 15 loop
            S_tb <=to_stdlogicvector(to_bitvector(S_tb) sll 1);
            wait for 10 ns ;
        end loop ;
        
        wait;
    end process;
        
end architecture;