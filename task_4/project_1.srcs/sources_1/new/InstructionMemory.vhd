library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity InstructionMemory is
	Port(
		instruction : out std_ulogic_vector(15 downto 0);
		pc          : in  std_ulogic_vector(9 downto 0);
		clock       : in  std_ulogic
	);
end InstructionMemory;

architecture Behavioral of InstructionMemory is
begin
	BRAM_inst : entity work.BRAM
		generic map(MEM_ADDR_WIDTH => 10,
			        MEM_DATA_WIDTH => 16,
			        MEM_NAME       => "InstructionMemory")
		port map(Clock       => clock,
			     WriteEnable => WriteEnable,
			     Address     => Address,
			     WriteData   => WriteData,
			     ReadData    => ReadData);
end Behavioral;
