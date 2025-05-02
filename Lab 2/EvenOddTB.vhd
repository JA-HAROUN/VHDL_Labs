library ieee;
use ieee.std_logic_1164.all ;

Entity EvenOddTestbench is 
end entity ;

architecture implementation of EvenOddTestbench is
component EvenOddCounter port
(	
    Load : in std_logic ;
    Clk : in std_logic ;
    Count : in std_logic ;
    EvenOdd : in std_logic ;
    Data : in std_logic_vector (3 downto 0) ;
    sequence : out std_logic_vector (3 downto 0)
) ;
end component ; 
Signal Clk : std_logic := '1' ;
Signal Load : std_logic := '1' ;
Signal Count : std_logic := '1' ;
Signal EvenOdd : std_logic := '0' ;
Signal seq : std_logic_vector (3 downto 0) ;
signal data : std_logic_vector (3 downto 0) := "0000" ;
begin 
Counter : EvenOddCounter port map (load,Clk,count,EvenOdd,data,seq ) ;
intialization : process 
begin 
wait for 11 ns ;
load <= '0' ;
wait ;
end process ; 
ClkProcess : process
begin 
while true loop 
wait for 5 ns ; 
Clk <= '0' ;
wait for 5 ns ;
Clk <= '1' ;
end loop ;
end process ;
Test : process
begin
wait for 95 ns ;
EvenOdd <= '1' ;
wait for 90 ns ;
while true loop 
EvenOdd <= '0' ;
wait for 20 ns ;
EvenOdd <= '1' ;
wait for 20 ns ;
end loop ;
wait ;
end process ;

end implementation ;


