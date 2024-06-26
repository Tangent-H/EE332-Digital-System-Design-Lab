library ieee ;
    use ieee.std_logic_1164.all ;

entity prior_enc is
  port (
    S : in std_logic_vector(15 downto 0) ;
    Z : out std_logic_vector(3 downto 0);
    r : out std_logic
  ) ;
end prior_enc ; 

architecture arch of prior_enc is
begin
    Z <= "1111" when S(15)='1' else
        "1110" when S(14)='1' else
        "1101" when S(13)='1' else
        "1100" when S(12)='1' else
        "1011" when S(11)='1' else
        "1010" when S(10)='1' else
        "1001" when S(9)='1' else
        "1000" when S(8)='1' else
        "0111" when S(7)='1' else
        "0110" when S(6)='1' else
        "0101" when S(5)='1' else
        "0100" when S(4)='1' else
        "0011" when S(3)='1' else
        "0010" when S(2)='1' else
        "0001" when S(1)='1' else
        "0000" when S(0)='1' else
        "0000" ;
    r <= (((S(15) or S(14)) or (S(13) or S(12))) or ((S(11) or S(10)) or (S(9) or S(8)))) or (((S(7) or S(6)) or (S(5) or S(4))) or ((S(3) or S(2)) or (S(1) or S(0)))) ;

  end architecture ; 