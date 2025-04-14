library ieee;
use ieee.std_logic_1164.all;

entity EvenOddCounter is 
port(
    Load    : in std_logic;
    Count   : in std_logic;
    EvenOdd : in std_logic;
    Data    : in std_logic_vector(3 downto 0);
    CLK     : in std_logic;
    sequence: out std_logic_vector(3 downto 0)
);
end EvenOddCounter;

architecture Implementation of EvenOddCounter is
    component DFlipFlop 
    port(
        D   : in std_logic;
        Clk : in std_logic;
        Q   : buffer std_logic;
        P   : buffer std_logic
    );
    end component;

    component MUX4_1  
    port(
        O1      : in std_logic;
        O2      : in std_logic;
        O3      : in std_logic;
        O4      : in std_logic;
        Selector: in std_logic_vector(1 downto 0);
        SOUT    : out std_logic
    );
    end component;

    component MUX2_1 is 
    port(
        O1      : in std_logic;
        O2      : in std_logic;
        Selector: in std_logic;
        SOUT    : out std_logic
    );
    end component;

    signal A      : std_logic;
    signal Anew   : std_logic;
    signal B      : std_logic;
    signal Beven  : std_logic;
    signal Bodd   : std_logic;
    signal Bnew   : std_logic;
    signal C      : std_logic;
    signal Ceven  : std_logic;
    signal Codd   : std_logic;
    signal Cnew   : std_logic;
    signal D      : std_logic;
    signal Deven  : std_logic;
    signal Dodd   : std_logic;
    signal Dnew   : std_logic;
    signal LoadShift : std_logic_vector(1 downto 0);
    signal FFinput   : std_logic_vector(3 downto 1);

begin
    LoadShift <= Load & Count;

    FF1: DFlipFlop port map(A, CLK, Anew, open);
    FF2: DFlipFlop port map(FFinput(1), CLK, Bnew, open);
    FF3: DFlipFlop port map(FFinput(2), CLK, Cnew, open);
    FF4: DFlipFlop port map(FFinput(3), CLK, Dnew, open);

    Bodd  <= Bnew xor Anew;
    Beven <= not(Bnew);
    Codd  <= (Cnew and not Bnew) or (Cnew and not Anew) or (Bnew and Anew and not Cnew);
    Ceven <= Bnew xor Cnew;
    Deven <= (Dnew and not Bnew) or (Dnew and not Cnew) or (not Dnew and Cnew and Bnew);
    Dodd  <= (Dnew and not Cnew) or (Dnew and not Anew) or (not Dnew and Cnew and Bnew and Anew) or (Dnew and not Bnew);

    M1: MUX2_1 port map(Beven, Bodd, EvenOdd, B);
    M2: MUX2_1 port map(Ceven, Codd, EvenOdd, C);
    M3: MUX2_1 port map(Deven, Dodd, EvenOdd, D);

    M4: MUX4_1 port map(Anew, EvenOdd, Data(0), Data(0), LoadShift, A);
    M5: MUX4_1 port map(Bnew, B, Data(1), Data(1), LoadShift, FFinput(1));
    M6: MUX4_1 port map(Cnew, C, Data(2), Data(2), LoadShift, FFinput(2));
    M7: MUX4_1 port map(Dnew, D, Data(3), Data(3), LoadShift, FFinput(3));

    sequence(0) <= Anew;
    sequence(1) <= Bnew;
    sequence(2) <= Cnew;
    sequence(3) <= Dnew;
end Implementation;