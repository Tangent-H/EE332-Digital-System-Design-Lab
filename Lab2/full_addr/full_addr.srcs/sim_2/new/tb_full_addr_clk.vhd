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

entity tb_full_addr_clk is
--  Port ( );
end tb_full_addr_clk;

architecture test of tb_full_addr_clk is
    component full_addr_clk is 
        port(A, B, Cin, clk : in std_logic;
             Sum, Cout : out std_logic);
    end component full_addr_clk;
    signal A_tb, B_tb, Cin_tb : std_logic;
    signal Sum_tb, Cout_tb : std_logic;         
    signal clk_tb: std_logic := '0';
begin
    -- Create an instance of the full_addr circuit
    UUT : full_addr_clk port map (A=>A_tb, B=>B_tb, Cin=>Cin_tb, Sum=>Sum_tb, Cout=>Cout_tb,clk=>clk_tb);
    -- Define stimulus signal
    process is
    begin
        wait for 3ns;
        clk_tb <= not clk_tb;
    end process;

process
begin
    A_tb <= '1';
    wait for 10 ns;
    A_tb <= '0';
    wait for 10 ns;
    A_tb <= '1';
    wait for 10 ns;
    A_tb <= '0';
    wait for 10 ns;
    A_tb <= '1';
    wait for 10 ns;
    A_tb <= '0';
    wait for 10 ns;
    A_tb <= '1';
    wait for 10 ns;
    A_tb <= '0';
    wait for 40ns;
end process;

process
begin
    B_tb <= '0';
    wait for 20 ns;
    B_tb <= '1';
    wait for 20 ns;
    B_tb <= '0';
    wait for 20 ns;
    B_tb <= '1';
    wait for 50ns;
end process;

process
begin
    Cin_tb <= '0';
    wait for 10 ns;
    Cin_tb <= '1';
    wait for 10 ns;
    Cin_tb <= '0';
    wait for 30 ns;
    Cin_tb <= '1';
    wait for 10 ns;
    Cin_tb <= '0';
    wait for 50ns;
end process;

end test;
