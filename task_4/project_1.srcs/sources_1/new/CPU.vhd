library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU is
	Port(
		inM         : in  std_ulogic_vector(15 downto 0);
		instruction : in  std_ulogic_vector(15 downto 0);
		reset       : in  std_ulogic;
		outM        : out std_ulogic_vector(15 downto 0);
		writeM      : out std_ulogic;
		addressM    : out std_ulogic_vector(9 downto 0);
		pc          : out std_ulogic_vector(9 downto 0);
		clock       : in  std_ulogic
	);
end CPU;

architecture Behavioral of CPU is
begin
end Behavioral;
