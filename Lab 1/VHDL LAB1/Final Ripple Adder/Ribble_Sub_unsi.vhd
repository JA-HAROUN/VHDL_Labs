LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Ripplesub_unsin IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        diff : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        Bout : OUT STD_LOGIC);
END Ripplesub_unsin;

ARCHITECTURE implRipplesub_unsin OF Ripplesub_unsin IS
    COMPONENT fulladder PORT (A, B, Cin : IN STD_LOGIC;
        S, Cout : OUT STD_LOGIC);
    END COMPONENT;
    SIGNAL carry : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
    SIGNAL internal_Diff : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
    SIGNAL internal_A : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
BEGIN
    internal_A <= NOT A;
    F1 : Fulladder PORT MAP(internal_A(0), B(0), '0', internal_diff(0), carry(0));
    F2 : Fulladder PORT MAP(internal_A(1), B(1), carry(0), internal_diff(1), carry(1));
    F3 : Fulladder PORT MAP(internal_A(2), B(2), carry(1), internal_diff(2), carry(2));
    F4 : Fulladder PORT MAP(internal_A(3), B(3), carry(2), internal_diff(3), carry(3));
    Bout <= carry(3);
    diff <= NOT internal_diff;
END implRipplesub_unsin;