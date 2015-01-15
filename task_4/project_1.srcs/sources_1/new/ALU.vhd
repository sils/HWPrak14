library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
	generic(
		WIDTH : integer := 16
	);
	Port(
		clock : in std_ulogic;
		register_D : in std_ulogic_vector(WIDTH-1 downto 0)
	);
end ALU;

architecture Behavioral of ALU is
begin
end Behavioral;
