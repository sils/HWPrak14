library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SimpleRegister is
	generic(
		WIDTH : integer := 16
	);
	Port(
		inval  : in  std_ulogic_vector(WIDTH - 1 downto 0);
		outval : out std_ulogic_vector(WIDTH - 1 downto 0);
		set    : in  std_ulogic;
		reset  : in  std_ulogic;
		clock  : in  std_ulogic
	);
end SimpleRegister;

architecture Behavioral of SimpleRegister is
begin
	process(clock, set)
	begin
		if reset = '1' then
			outval <= (others => '0');
		else
			if set = '1' and rising_edge(clock) then
				outval <= inval;
			end if;
		end if;
	end process;
end Behavioral;
