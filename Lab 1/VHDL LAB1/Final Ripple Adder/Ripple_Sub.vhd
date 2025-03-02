LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Ripplesub IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        diff : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        Overflow : OUT STD_LOGIC);
END Ripplesub;

ARCHITECTURE implRipplesub OF Ripplesub IS
    COMPONENT fulladder PORT (A, B, Cin : IN STD_LOGIC;
        S, Cout : OUT STD_LOGIC);
    END COMPONENT;
    SIGNAL carry : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
    SIGNAL Compl_B : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
    SIGNAL internal_diff : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
BEGIN
    Compl_B <= NOT B;
    F1 : Fulladder PORT MAP(a(0), Compl_B(0), '1', internal_diff(0), carry(0));
    F2 : Fulladder PORT MAP(a(1), Compl_B(1), carry(0), internal_diff(1), carry(1));
    F3 : Fulladder PORT MAP(a(2), Compl_B(2), carry(1), internal_diff(2), carry(2));
    F4 : Fulladder PORT MAP(a(3), Compl_B(3), carry(2), internal_diff(3), carry(3));
    diff <= internal_diff;
    Overflow <= (Compl_B(3) AND A(3) AND NOT internal_diff(3)) OR (NOT Compl_B(3) AND NOT A(3) AND internal_diff(3));
END implRipplesub;