library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- The Hack CPU as described in
-- http://www.tuhh.de/t3resources/ict/dateien/Lehre/Hardware-Praktikum/Hack.pdf
--
-- Note that we only use 10 bits for memory addressing since we only have 1K
-- memory blocks.
entity Hack is
	Port(
		reset : in std_ulogic;
		clock : in std_ulogic
	);
end Hack;

architecture Behavioral of Hack is
	signal inM         : std_ulogic_vector(15 downto 0);
	signal instruction : std_ulogic_vector(15 downto 0);
	signal outM        : std_ulogic_vector(15 downto 0);
	signal writeM      : std_ulogic;
	signal addressM    : std_ulogic_vector(9 downto 0);
	signal pc          : std_ulogic_vector(9 downto 0);
begin
	CPU_inst : entity work.CPU(Behavioral)
		port map(
			inM          => inM,
			instruction  => instruction,
			reset        => reset,
			outM         => outM,
			writeM       => writeM,
			addressM_out => addressM,
			pc           => pc,
			clock        => clock
		);

	DataMemory_inst : entity work.DataMemory(Behavioral)
		port map(
			outM     => outM,
			writeM   => writeM,
			addressM => addressM,
			inM      => inM,
			clock    => clock
		);

	InstructionMemory_inst : entity work.InstructionMemory(Behavioral)
		port map(
			pc          => pc,
			instruction => instruction,
			clock       => clock
		);
end Behavioral;
