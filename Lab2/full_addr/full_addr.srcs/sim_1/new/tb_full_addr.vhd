----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.02.2024 17:16:07
-- Design Name: 
-- Module Name: tb_full_addr - Behavioral
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

entity tb_full_addr is
--  Port ( );
end tb_full_addr;

architecture test of tb_full_addr is
    component full_addr is 
        port(A, B, Cin : in std_logic;
             Sum, Cout : out std_logic);
    end component full_addr;
    signal A_tb, B_tb, Cin_tb : std_logic;
    signal Sum_tb, Cout_tb : std_logic;         
begin
    -- Create an instance of the full_addr circuit
    UUT : full_addr port map (A=>A_tb, B=>B_tb, Cin=>Cin_tb, Sum=>Sum_tb, Cout=>Cout_tb);
    -- Define stimulus signal
    A_tb <= '1', '0' after 100ns, '1' after 200ns,'0' after 300ns, '1' after 400ns,'0' after 500ns, '1' after 600ns,'0' after 700ns;
    B_tb <= '0', '1' after 200ns, '0' after 400ns, '1' after 600ns;
    Cin_tb <= '0', '1' after 100ns, '0' after 200ns, '1' after 500ns, '0' after 600ns;
end test;
