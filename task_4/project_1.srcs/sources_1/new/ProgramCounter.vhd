library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ProgramCounter is
	generic(
		WIDTH : integer := 16
	);
	Port(
		inval  : in  std_ulogic_vector(WIDTH - 1 downto 0);
		comp   : in  std_ulogic_vector(WIDTH - 1 downto 0);
		jump   : in  std_ulogic_vector(2 downto 0);
		reset  : in  std_ulogic;
		clock  : in  std_ulogic;

		outval : out std_ulogic_vector(WIDTH - 1 downto 0)
	);
end ProgramCounter;

architecture Behavioral of ProgramCounter is
begin
	process(clock, set)
	begin
		if reset = '1' then
			outval <= (others => '0');
		else
			if (j(0) = '1' and signed(comp) < 0) or
			   (j(1) = '1' and signed(comp) = 0) or
			   (j(2) = '1' and signed(comp) > 0) then
				outval <= inval;
			else
				outval <= outval + 1;
			end if;
		end if;
	end process;
end Behavioral;
