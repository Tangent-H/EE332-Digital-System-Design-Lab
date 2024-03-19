library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity prior_enc42 is
    port (
        en42 : in std_logic;
        S42: in std_logic_vector(3 downto 0);
        Z42 : out std_logic_vector (1 downto 0);
        r42 : out std_logic;
        ys42 : out std_logic  
    );
end prior_enc42;

architecture behavioral of prior_enc42 is
    begin
    Z42 <= "11" when S42(3) = '1' and en42 = '1' else
        "10" when S42(2) = '1' and en42 = '1' else
        "01" when S42(1) = '1' and en42 = '1' else
        "00" when S42(0) = '1' and en42 = '1' else
        "00";
        r42 <= S42(3) or S42(2) or S42(1) or S42(0); --indicating that there is a 1 in the input
        ys42 <= (not (S42(3) or S42(2) or S42(1) or S42(0))) and en42;   --indicating that there is no 1 in the input and the enable is high, at this time, lower priority encoder should be enabled
    end architecture;