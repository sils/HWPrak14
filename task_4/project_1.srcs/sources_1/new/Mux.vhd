library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- A simple multiplexer
--
-- outval is val1 if switch is LOW ('0'), val2 otherwise.
entity Mux is
	generic(
		WIDTH : integer := 16
	);
	Port(
		val1   : in  std_ulogic_vector(WIDTH - 1 downto 0);
		val2   : in  std_ulogic_vector(WIDTH - 1 downto 0);
		switch : in  std_ulogic;
		outval : out std_ulogic_vector(WIDTH - 1 downto 0)
	);
end Mux;

architecture Behavioral of Mux is
begin
	outval <= val1 when switch = '0' else val2;
end Behavioral;
