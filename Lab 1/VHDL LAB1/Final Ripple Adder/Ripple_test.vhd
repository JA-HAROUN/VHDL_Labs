library ieee;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all;

entity testforripple is
end testforripple ;

architecture test of testforripple is 

component Rippleadder port(A,B : in std_logic_vector(3 downto 0) ; Cin : in std_logic ; Sum : out std_logic_vector(3 downto 0) ; Cout : out std_logic) ;
end component ;
signal A ,B,S : std_logic_vector (3 downto 0 ) := "0000" ;
signal Cin,Cout : std_logic := '0' ;
signal check,int_Cin : integer := 0 ;
begin 
R : Rippleadder port map (A,B,Cin ,S ,Cout ) ;
process begin 
loop_0 : for j in 0 to 1 loop 
if Cin = '1' then
Int_Cin <= 1 ;
end if ;
loop_1 : for k in 0 to 15 loop 
wait for 10 ps ;
loop_2 :for i in 0 to 15 loop
A <= std_logic_vector(unsigned(A) + 1);
wait for 10 ps ;
check <= to_integer(unsigned(A)) + to_integer(unsigned(B))+Int_Cin ;
wait for 10 ps ;
if std_logic_vector(to_unsigned(check,4)) /= S then
report "Wrong Result" ;
end if ;
wait for 10 ps ;
end loop loop_2 ;
B <= std_logic_vector(unsigned(B) + 1);
end loop loop_1 ;
Cin <= '1' ;
wait for 10 ps ;
end loop loop_0 ;

end process ;
end test; 


