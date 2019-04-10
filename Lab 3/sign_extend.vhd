-------- IMPORTS ---------
LIBRARY work;
USE work.bv_arithmetic.ALL;
USE work.dlx_types.ALL;

-------- Sign Extend Initialization --------
entity sign_extend is

	-------- Standard propagation delay of 5 nanoseconds
	generic(
		prop_delay : Time := 5 ns
	);
	
	-------- Variables used for sign extend
	port(
		input: in half_word; 
		output: out dlx_word
	);

end entity sign_extend;

-------- Sign Extend Implementation --------
architecture behavior of sign_extend is

begin
	
	-------- Generic behavior, pass in 1/2 word
	behavior2 : process(input) is
	begin
		-------- Used the pre-built sign extend function 
		-------- found in bv arithmetic 
		output <= bv_sext(input, 32) after prop_delay;
	end process behavior2;

end architecture behavior;