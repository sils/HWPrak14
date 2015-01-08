library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DataMemory is
	Port(
		writeM   : in  std_ulogic;
		outM     : in  std_ulogic_vector(15 downto 0);
		addressM : in  std_ulogic_vector(9 downto 0);
		inM      : out std_ulogic_vector(15 downto 0);
		clock    : in  std_ulogic
	);
end DataMemory;

architecture Behavioral of DataMemory is
begin
	BRAM_inst : entity work.BRAM
		generic map(MEM_ADDR_WIDTH => 10,
			        MEM_DATA_WIDTH => 16,
			        MEM_NAME       => "DataMemory")
		port map(Clock       => clock,
			     WriteEnable => WriteEnable,
			     Address     => Address,
			     WriteData   => WriteData,
			     ReadData    => ReadData);
end Behavioral;
