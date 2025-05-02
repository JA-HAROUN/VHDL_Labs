LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_moore IS
END tb_moore;

ARCHITECTURE test OF tb_moore IS

    COMPONENT mooreSequential
        PORT (
            X : IN STD_LOGIC;
            Z : OUT STD_LOGIC;
            Clk : IN STD_LOGIC
        );
    END COMPONENT;

    SIGNAL X : STD_LOGIC := '0';
    SIGNAL Z : STD_LOGIC := '0';
    SIGNAL Clk : STD_LOGIC := '0';
    CONSTANT T : TIME := 10 ns;

BEGIN

    mooremachine : mooreSequential PORT MAP(X, Z, Clk);

    PROCESS
    BEGIN

        -- make X change before the clock up edge
        WHILE TRUE LOOP
            Clk <= '0';
            X <= '0';
            WAIT FOR T/2;
            Clk <= '1';
            WAIT FOR T/2;
        END LOOP;

    END PROCESS;

END test;