library ieee;
use ieee.std_logic_1164.all ;

entity EvenOddCounter is 
port
(	
    Load : in std_logic ;
    Clk : in std_logic ;
    Count : in std_logic ;
    EvenOdd : in std_logic ;
    Data : in std_logic_vector (3 downto 0) ;
    sequence : out std_logic_vector (3 downto 0)
) ;
end EvenOddCounter ;

architecture Implementation of EvenOddCounter is
    component DFlipFlop 
    port 
    (
        D : in std_logic ;
        Clk : in std_logic ;
        Q : buffer std_logic ;
        P : buffer std_logic
    ) ;
    end component ;
    component MUX4_1  
    port
    (
        O1 : in std_logic ;
        O2 : in std_logic ;
        O3 : in std_logic ;
        O4 : in std_logic ;
        Selector : in std_logic_vector (1 downto 0) ;
        SOUT : out std_logic
    ) ;
    end component ;
    component MUX2_1 is 
    port
    (
        O1 : in std_logic ;
        O2 : in std_logic ;
        Selector : in std_logic ;
        SOUT : out std_logic
    ) ;
    end component ;
    signal A : std_logic ;
    signal Anew : std_logic ;
    signal B : std_logic ;
    signal Beven : std_Logic ;
    signal Bodd : std_Logic ;
    signal Bnew : std_logic ;
    signal C : std_logic ;
    signal Ceven : std_Logic ;
    signal Codd : std_Logic ;
    signal Cnew : std_logic ;
    signal D : std_logic ;
    signal Deven : std_Logic ;
    signal Dodd : std_Logic ;
    signal Dnew : std_logic ;
    signal clk_1: std_logic ;
    signal LoadCount : std_logic_vector (1 downto 0) ;
    Signal FFinput : std_logic_vector (3 downto 1) ;
    begin
	Clk_1 <= CLK ;
        LoadCount <= Load & COUNT ;
        FF1 : DFlipFlop port map(A,clk_1,Anew,open) ;
        FF2 : DFlipFlop port map(FFinput(1),clk_1,Bnew,open) ;
        FF3 : DFlipFlop port map(FFinput(2),clk_1,Cnew,open) ;
        FF4 : DFlipFlop port map(FFinput(3),clk_1,Dnew,open) ;
        Bodd <= Bnew xor Anew  ;
        Beven <= not(Bnew) ;
        Codd <= (Cnew and not (Bnew) ) or (cnew and not (anew) ) or (bnew and anew and not(cnew)) ;
        Ceven <= Bnew xor Cnew ;
        Deven <= ((dnew and not(bnew)) or ( dnew and not(cnew) )or (not(dnew) and cnew and bnew )) ;
        Dodd <= (Dnew and not(Cnew)) or (Dnew and not(Anew)) or (not(Dnew) and Cnew and Bnew and Anew) or (Dnew and not (Bnew) ) ;
        M1 : MUX2_1 port map(Beven,Bodd,EvenOdd,B) ;
        M2 : MUX2_1 port map(Ceven,Codd,EvenOdd,C) ;
        M3 : MUX2_1 port map(Deven,Dodd,EvenOdd,D) ;
        M4 : MUX4_1 port map(Anew,EvenOdd,Data(0),Data(0),LoadCount,A) ;
        M5 : MUX4_1 port map(Bnew,B,data(1),Data(1),LoadCount,FFinput(1)) ;
        M6 : MUX4_1 port map(Cnew,C,Data(2),data(2),LoadCount,FFinput(2)) ;
        M7 : MUX4_1 port map(Dnew,D,data(3),data(3),LoadCount,FFinput(3)) ;
        sequence(0) <= Anew ;
        sequence(1) <= bnew ;
        sequence(2) <= cnew ;
        sequence(3) <= dnew ;
    end Implementation ;


