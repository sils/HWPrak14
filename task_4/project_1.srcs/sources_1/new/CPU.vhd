library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU is
	generic(
		WIDTH : integer := 16  ,
		ADDRESS_WIDTH : integer := 10
	);
	Port(
		inM         : in  std_ulogic_vector(WIDTH-1 downto 0);
		instruction : in  std_ulogic_vector(WIDTH-1 downto 0);
		reset       : in  std_ulogic;
		outM        : out std_ulogic_vector(WIDTH-1 downto 0);
		writeM      : out std_ulogic;
		addressM    : out std_ulogic_vector(ADDRESS_WIDTH-1 downto 0);
		pc          : out std_ulogic_vector(ADDRESS_WIDTH-1 downto 0);
		clock       : in  std_ulogic
	);
end CPU;

		architecture Behavioral of CPU is
			signal ALU_out : std_ulogic_vector(WIDTH - 1 downto 0) 
begin
	register_A : entity work.SimpleRegister(Behavioral)
		generic map(
			WIDTH => WIDTH
		)
		port map(
			inval  => ,
			outval => ,
			set    => ,
			clock  => clock
		);
	register_D : 

entity work .SimpleRegister(Behavioral)
		generic map(
			WIDTH => WIDTH
		)
		port map(
			inval  => ,
			outval => ,
			set    => ,
			clock  => clock
		);
	register_PC :  entity work .SimpleRegister(Behavioral)
		generic map(
			WIDTH => WIDTH
		)
		port map(
			inval  => ,
			outval => pc,
			set    => ,
			clock  => clock
		);

	ALU_instruction_MUX :  entity work .Mux(Behavioral)
		generic map(
			WIDTH => WIDTH
		)
		port map(val1   => ALU_out,
			     val2   => instruction,
			     switch => ,
			     outval => outval);
end Behavioral;
