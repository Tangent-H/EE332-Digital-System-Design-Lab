library ieee;
use ieee.std_logic_1164.all;

entity prior_tree is
    port (
        S : in std_logic_vector(15 downto 0) ;
        Z : out std_logic_vector(3 downto 0);
        r : out std_logic
      ) ;
end prior_tree;

architecture structure of prior_tree is
component prior_enc42 is
    port (
        S42: in std_logic_vector(3 downto 0);
        Z42 : out std_logic_vector (1 downto 0);
        r42 : out std_logic
    );
end component;
signal h_enc_in : std_logic_vector(3 downto 0);
signal l_enc3_out, l_enc2_out, l_enc1_out, l_enc0_out, h_enc_out: std_logic_vector(1 downto 0);
begin
    l_enc3: prior_enc42 port map (S42 => S(15 downto 12), Z42 => l_enc3_out, r42 => h_enc_in(3));
    l_enc2: prior_enc42 port map (S42 => S(11 downto 8), Z42 => l_enc2_out, r42 => h_enc_in(2));
    l_enc1: prior_enc42 port map (S42 => S(7 downto 4), Z42 => l_enc1_out, r42 => h_enc_in(1));
    l_enc0: prior_enc42 port map (S42 => S(3 downto 0), Z42 => l_enc0_out, r42 => h_enc_in(0));
    h_enc: prior_enc42 port map (S42 => h_enc_in, Z42 => h_enc_out, r42 => r);
    
    Z(3 downto 2) <= h_enc_out;
    with h_enc_out select
        Z(1 downto 0) <= l_enc3_out when "11",
                          l_enc2_out when "10",
                          l_enc1_out when "01",
                          l_enc0_out when "00",
                          "00" when others;
end architecture;