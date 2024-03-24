----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.03.2024 16:50:42
-- Design Name: 
-- Module Name: proc - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity proc is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           z : in STD_LOGIC;
           res1 : out STD_LOGIC;
           res2 : out STD_LOGIC);
end proc;

architecture Behavioral of proc is
    signal sig_s1, sig_s2 : std_logic;
begin
    proc1:process(x,y,z) is
    variable var_s1, var_s2 : std_logic;
    begin
        L1:var_s1 := x and y;
        L2:var_s2 := var_s1 xor z;
        L3:res1 <= var_s1 nand var_s2;
    end process proc1;
    
    proc2:process(x,y,z) is
    begin
        L1:sig_s1 <= x and y;
        L2:sig_s2 <= sig_s1 xor z;
        L3:res2 <= sig_s1 nand sig_s2;
    end process proc2;
end Behavioral;
