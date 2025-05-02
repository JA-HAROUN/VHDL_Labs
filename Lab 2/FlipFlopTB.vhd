library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

entity FFTB is 
end entity ;


architecture implementation of FFTB is 
component DFlipFlop
        port (
            D   : in std_logic;
            Clk : in std_logic;
            Q   : buffer std_logic;
            P   : buffer std_logic
             );
end component;
Signal DTB : std_logic := '0' ;
signal QTB : std_Logic := '0' ;
signal PTB : std_logic := '1' ;
signal CLK : std_logic := '0' ;
begin 
FF : DFlipFlop port map (DTB,CLK,QTB,PTB) ;

CLK_PROCESS : process
begin 
while true loop 
CLK <= '0';
wait for 5 ns;
CLK <= '1';
wait for 5 ns;
end loop ;
end process ;

Random_Toggle : process
variable Seed1, Seed2 : positive := 1;
variable Random_Value : real;
variable Toggle_Time : TIME ;
begin 
while true loop 
uniform(Seed1, Seed2, Random_Value);
Toggle_Time := integer(Random_Value * 8.0 ) * 1 ns;
wait for Toggle_Time  ;
DTB <= not(DTB) ;
wait for 1 ns ;
if QTB = DTB then 
report "Error" ;
end if ;
wait until rising_edge(Clk) ;
wait for 1 ns ;
if QTB/= DTB then 
report "Error" ;
end if ;
end loop ;
end process Random_Toggle ; 
end implementation ;





