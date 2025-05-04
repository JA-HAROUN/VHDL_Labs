LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mealySequntial IS PORT (
    X : IN STD_LOGIC;
    Reset : IN STD_LOGIC;
    Z : OUT STD_LOGIC;
    CLk : STD_LOGIC
);
END mealySequntial;

ARCHITECTURE Implementation OF mealySequntial IS

    COMPONENT DFlipFlop
        PORT (
            D : IN STD_LOGIC;
            Clk : IN STD_LOGIC;
            Reset : IN STD_LOGIC;
            Q : INOUT STD_LOGIC;
            P : INOUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL DA, DB, DC : STD_LOGIC := '0';
    SIGNAL A, B, C : STD_LOGIC := '0';

BEGIN

    FF1 : DFlipFLop PORT MAP(DA, CLk, Reset, A, OPEN);
    FF2 : DFlipFLop PORT MAP(DB, CLK, Reset, B, OPEN);
    FF3 : DFlipFLop PORT MAP(DC, CLK, reset, C, OPEN);

    DA <= (NOT A AND B AND NOT X) OR (NOT A AND B AND C) OR (NOT A AND NOT B AND NOT C AND X) OR (A AND NOT B AND C AND X) OR (B AND C AND NOT X) OR (A AND B AND NOT C AND X);

    DB <= (A AND NOT C AND NOT X) OR (B AND NOT C AND X) OR (A AND NOT B AND C) OR (NOT A AND B AND C AND NOT X) OR (NOT B AND C AND X);

    DC <= NOT C;

    Z <= (NOT X AND NOT A AND NOT B AND NOT C) OR (X AND A AND NOT B AND C);

END Implementation;