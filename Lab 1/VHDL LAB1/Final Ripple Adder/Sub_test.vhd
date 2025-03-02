library ieee;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all;

entity testforripplesub is
end testforripplesub ;

architecture test of testforripplesub is 

component Ripplesub port(A,B : in std_logic_vector(3 downto 0) ; diff : out std_logic_vector(3 downto 0); Overflow : out std_logic) ;
end component ;
signal A ,B,diff : std_logic_vector (3 downto 0 ) := "0000" ;
signal Overflow : std_logic := '0' ;
signal check: integer := 0 ;
begin 
R : Ripplesub port map (A,B,diff ,Overflow ) ;
process begin  
loop_1 : for k in 0 to 15 loop 
wait for 10 ps ;
loop_2 :for i in 0 to 15 loop
A <= std_logic_vector(unsigned(A) + 1);
wait for 10 ps ;
check <= to_integer(signed(A)) - to_integer(signed(B)) ;
wait for 10 ps ;
if std_logic_vector(to_signed(check,4)) /= diff then
report "Wrong Result" ;
end if ;
wait for 10 ps ;
end loop loop_2 ;
B <= std_logic_vector(unsigned(B) + 1);
end loop loop_1 ;
wait for 10 ps ;
end process ;
end test; 


