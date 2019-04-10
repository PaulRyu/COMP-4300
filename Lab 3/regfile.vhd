-------- IMPORTS --------
LIBRARY work;
USE work.bv_arithmetic.ALL;
USE work.dlx_types.ALL;

-------- Regfile Initialization --------
entity regfile is
	
	-------- Standard propagation delay of 5 nanoseconds
	generic(
		prop_delay		: Time := 5 ns
	);

	-------- Variables used for regfile
	-------- regB mispelled as rebB in lab specifications.. just kept it though
	port (
		read_notwrite, clock 	: in bit;
		regA,rebB		: in register_index;
		data_in			: in dlx_word;
		dataA_out,dataB_out	: out dlx_word
	);
end entity regfile;

-------- Regfile Implementation
architecture behavior of regfile is
	
	-------- Use an array of size 32 and copy it over to a signal so that
	-------- data can be passed and written to it.
	type arr is array (0 to 31) of dlx_word;
	signal arr2 : arr;

begin
	-------- Non-generic, pass in all values from initialization
	reg: process(read_notwrite, clock, regA, rebB, data_in) is
	begin
		-------- Clock handled later in .do test files
		if (clock = '1') then
			-------- read only, extract information into data outputs
			if (read_notwrite = '1') then
				dataA_out <= arr2(bv_to_integer(regA)) after prop_delay;
				dataB_out <= arr2(bv_to_integer(rebB)) after prop_delay;
			-------- readNotWrite == 0, write information to the array
			else
				arr2(bv_to_integer(regA)) <= data_in after prop_delay;
			end if;
		end if;
	end process reg;
end architecture behavior;