-----------------------------------------------------------------------------------
-- File		: Mips (Data) Memory 
-- Author	: Wolfgang Brandt / Fabian May
-- Company	: Technical University Hamburg Harburg Institute of Computer Technology
-----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;

entity BRAM is
	generic(
		MEM_ADDR_WIDTH 	: integer :=  8;
		MEM_DATA_WIDTH 	: integer := 32;
		EDGE_TYPE		: boolean := true; -- true = rising edge, false = falling edge
		MEM_NAME 		: string := "ram.mem"
	);
	port (
		Clock   	: in  std_logic;
		WriteEnable : in  std_logic;
		Address 	: in  std_logic_vector (MEM_ADDR_WIDTH-1 downto 0);
		WriteData   : in  std_logic_vector (MEM_DATA_WIDTH-1 downto 0);
		ReadData   	: out std_logic_vector (MEM_DATA_WIDTH-1 downto 0)
	);
end BRAM;

architecture Behavioral of BRAM is

	type MemType is array (0 to 2**MEM_ADDR_WIDTH-1) of bit_vector (MEM_DATA_WIDTH-1 downto 0); 
	
	impure function InitRamFromFile (RamFileName : in string) return MemType is
		file RamFile : text is in RamFileName;
		variable RamFileLine : line;
		variable RAM : MemType;
		begin
			for I in MemType'range loop
				readline (RamFile, RamFileLine);
				read (RamFileLine, RAM(I));
			end loop;
			return RAM;
		end function;
		
	signal Ram : MemType := InitRamFromFile(MEM_NAME);

begin
	
	process (Clock)
	begin
		if EDGE_TYPE then
			if rising_edge(Clock) then	--todo
				if (WriteEnable = '1') then
					Ram(conv_integer(Address)) <= to_bitvector(WriteData);	
				end if;	
				ReadData <= to_stdlogicvector(Ram(conv_integer(Address))); 
			end if;
		else
			if falling_edge(Clock) then	--todo
				if (WriteEnable = '1') then
					Ram(conv_integer(Address)) <= to_bitvector(WriteData);	
				end if;	
				ReadData <= to_stdlogicvector(Ram(conv_integer(Address))); 
			end if;
		end if;
	end process;

end Behavioral;
