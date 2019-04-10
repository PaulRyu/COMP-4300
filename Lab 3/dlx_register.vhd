-------- IMPORTS --------
LIBRARY work;
USE work.bv_arithmetic.ALL;
USE work.dlx_types.ALL;

-------- DLX Register Initalization --------
entity dlx_register is
	
	-------- Standard propagation delay of 5 nanoseconds
	generic(
		prop_delay : Time := 5 ns
	);

	port(
	     in_val	: 	in dlx_word;
	     clock	: 	in bit;
	     out_val	: 	out dlx_word
	);
	
end entity dlx_register;

architecture behavior of dlx_register is

begin
	dlx_register: process(in_val, clock) is

	begin

		if (clock = '1') then
			out_val <= in_val after prop_delay;
		end if;

	end process dlx_register;

end architecture behavior;