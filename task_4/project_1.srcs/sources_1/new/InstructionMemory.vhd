library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity InstructionMemory is
	generic(
		WIDTH : integer := 16;
		ADDRESS_WIDTH : integer := 10
	);
	Port(
		instruction : out std_ulogic_vector(WIDTH-1 downto 0);
		pc          : in  std_ulogic_vector(ADDRESS_WIDTH-1 downto 0);
		clock       : in  std_ulogic
	);
end InstructionMemory;

architecture Behavioral of InstructionMemory is
	signal read_data_buffer : std_logic_vector(WIDTH-1 downto 0);
begin
	BRAM_inst : entity work.BRAM(Behavioral)
		generic map(MEM_ADDR_WIDTH => 10,
			        MEM_DATA_WIDTH => 16,
			        EDGE_TYPE      => false,
			        MEM_NAME       => "H:\hwprak\task_4\PWM1_short.hack")
		port map(Clock       => clock,
			     WriteEnable => '0',
			     Address     => std_logic_vector(pc),
			     WriteData   => "0000000000000000",
			     ReadData    => read_data_buffer);
			     
	instruction <= std_ulogic_vector(read_data_buffer);
end Behavioral;
