LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY HALF_ADDER IS
    PORT (
        A_1 : IN STD_LOGIC;
        B_1 : IN STD_LOGIC;
        Sum_1 : OUT STD_LOGIC;
        Carry_1 : OUT STD_LOGIC
    );
END HALF_ADDER;

ARCHITECTURE ADD_HALF OF HALF_ADDER IS
BEGIN
    Sum_1 <= A_1 XOR B_1;
    Carry_1 <= A_1 AND B_1;
END ADD_HALF;