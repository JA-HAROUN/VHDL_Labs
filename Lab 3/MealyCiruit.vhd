LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mealySequential IS PORT (
    X : IN STD_LOGIC;
    Z : OUT STD_LOGIC;
    CLk : STD_LOGIC
);

END mealySequential;

ARCHITECTURE Implementation OF mealySequential IS

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

BEGIN

    FF1 : DFlipFLop PORT MAP(DA, CLk, A, OPEN);
    FF2 : DFlipFLop PORT MAP(DB, CLK, B, OPEN);
    FF3 : DFlipFLop PORT MAP(DC, CLK, C, OPEN);

    DA <= (NOT A AND B AND NOT X) OR (NOT A AND B AND C) OR (NOT A AND C AND X) OR (A AND NOT C) OR (A AND C AND NOT X);
    DB <= (A AND NOT C) OR (NOT C AND X) OR (A AND NOT B AND NOT X) OR (NOT A AND B AND C AND NOT X);
    DC <= (A AND NOT B AND C) OR (A AND C AND NOT X) OR (NOT A AND b AND X) OR (A AND B AND NOT C) OR (NOT A AND NOT b AND NOT C AND NOT X);
    Z <= (NOT X AND NOT A AND NOT B AND NOT C) OR (X AND A AND NOT B AND C);

END Implementation;