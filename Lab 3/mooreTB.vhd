LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_moore IS
END tb_moore;

ARCHITECTURE test OF tb_moore IS

    COMPONENT mooreSequntial
        PORT (
            X : IN STD_LOGIC;
            Reset : IN STD_LOGIC;
            Z : OUT STD_LOGIC;
            Clk : IN STD_LOGIC
        );
    END COMPONENT;

    SIGNAL X : STD_LOGIC := '0';
    SIGNAL R : STD_LOGIC := '1';
    SIGNAL Zout : STD_LOGIC;
    SIGNAL Clk : STD_LOGIC := '0';
    CONSTANT T : TIME := 10 ns;

BEGIN

    mooremachine : mooreSequntial PORT MAP(X, R, Zout, Clk);

    CLK_Process : PROCESS
    BEGIN
        WAIT FOR 1 ns;
        R <= '0';
        WHILE TRUE LOOP
            WAIT FOR 5 ns;
            CLk <= NOT CLk;
            WAIT FOR 5 ns;
            CLk <= NOT CLk;
        END LOOP;
    END PROCESS;

    PROCESS
    BEGIN

        -- make X change before the clock up edge
        WHILE TRUE LOOP
            WAIT FOR 2 ns;
            X <= NOT X;
            WAIT UNTIL rising_edge(Clk);
        END LOOP;

    END PROCESS;

END test;