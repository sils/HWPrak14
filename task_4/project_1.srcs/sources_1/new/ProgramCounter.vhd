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
	signal outval_s : std_ulogic_vector(WIDTH - 1 downto 0);
	
begin
	outval <= outval_s;
	process(clock, reset)
	begin
		if reset = '1' then
			outval_s <= (others => '0');
		else
			if (jump(0) = '1' and signed(comp) < 0) or
			   (jump(1) = '1' and signed(comp) = 0) or
			   (jump(2) = '1' and signed(comp) > 0) then
				outval_s <= inval(WIDTH-1 downto 0);
			else
				outval_s <= std_ulogic_vector(unsigned(outval_s) + 1);
			end if;
		end if;
	end process;
end Behavioral;
