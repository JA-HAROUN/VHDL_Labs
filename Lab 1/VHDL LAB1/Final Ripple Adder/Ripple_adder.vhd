library ieee;
use ieee.std_logic_1164.all ;

entity halfadder is
    port(A,B : in std_logic ; S,Cout : out std_logic) ;
    end halfadder ;
architecture implhalfadder of halfadder is
    begin 
    S <= A xor B ;
    Cout <= A and B ;
    end implhalfadder ;

library ieee;
use ieee.std_logic_1164.all ;

entity fulladder is 
    port(A,B,Cin : in std_logic ; S,Cout : out std_logic) ;
    end fulladder ;
architecture implfulladder of fulladder is 
    component halfadder port(A,B : in std_logic ; S,Cout : out std_logic) ;
    end component ;
    signal insum,incarry1,incarry2 : std_logic ;
    begin
        H1 : halfadder port map(A,B,insum,incarry1) ;
        H2 : halfadder port map(insum,Cin,S,incarry2) ;
        Cout <= incarry1  or incarry2 ;
    end implfulladder ;

library ieee;
use ieee.std_logic_1164.all ;

entity Rippleadder is
    port(A,B : in std_logic_vector(3 downto 0) ; Cin : in std_logic ; Sum : out std_logic_vector(3 downto 0) ; Cout : out std_logic) ;
end Rippleadder ;

architecture implRippleadder of Rippleadder is
    component fulladder port(A,B,Cin : in std_logic ; S,Cout : out std_logic) ;
    end component ;
    signal carry : std_logic_vector (3 downto 1) ;
    begin
        F1 : Fulladder port map (a(0),b(0),cin,sum(0),carry(1)) ; 
        F2 : Fulladder port map (a(1),b(1),carry(1),sum(1),carry(2)) ; 
        F3 : Fulladder port map (a(2),b(2),carry(2),sum(2),carry(3)) ; 
        F4 : Fulladder port map (a(3),b(3),carry(3),sum(3),cout) ;
    end implRippleadder ;