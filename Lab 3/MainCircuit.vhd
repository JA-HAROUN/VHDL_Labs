LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mooreSequential IS PORT (
    X : IN STD_LOGIC;
    Z : OUT STD_LOGIC;
    CLK : IN STD_LOGIC
);

END mooreSequential;

ARCHITECTURE Implementation OF mooreSequential IS

    COMPONENT DFlipFlop
        PORT (
            D : IN STD_LOGIC;
            Clk : IN STD_LOGIC;
            Q : BUFFER STD_LOGIC;
            P : BUFFER STD_LOGIC
        );
    END COMPONENT;

    SIGNAL DA, DB, DC : STD_LOGIC := '0';
    SIGNAL A, B, C : STD_LOGIC := '0';
    SIGNAL P1, P2, P3 : STD_LOGIC := '0';

BEGIN

    FF1 : DFlipFlop PORT MAP(DA, CLK, A, P1);
    FF2 : DFlipFlop PORT MAP(DB, CLK, B, P2);
    FF3 : DFlipFlop PORT MAP(DC, CLK, C, P3);
    
    DA <= (NOT A AND B AND NOT X) OR (NOT A AND B AND C) OR (NOT A AND C AND X) OR (A AND NOT C) OR (A AND C AND NOT X);
    
    DB <= (A AND NOT C) OR (NOT C AND X) OR (A AND NOT B AND NOT X) OR (NOT A AND B AND C AND NOT X);
    
    DC <= (A AND NOT B AND C) OR (A AND C AND NOT X) OR (NOT A AND B AND X) OR (A AND B AND NOT C) OR (NOT A AND NOT B AND NOT C AND NOT X);
    
    Z <= NOT A AND NOT B AND C;

END implementation;