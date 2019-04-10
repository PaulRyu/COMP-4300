LIBRARY work;
-------- IMPORTS --------
USE work.bv_arithmetic.ALL;
USE work.dlx_types.ALL;

-------- Add Four Initialization --------
entity add4 is
	
	-------- Standard propagation delay of 5 nanoseconds
	generic(
		prop_delay: Time := 5 ns
	);
	
	-------- Simple I/O variables for Add Four
	port(
		input	: in 	dlx_word; 
		output	: out 	dlx_word
	);
end entity add4;

-------- Add Four Implementation --------
architecture behavior of add4 is

begin
	
	-------- Generic behavior, pass in WORD
    	add4: process(input) is

		-------- Variables used for adding four and detecting
		-------- overflow errors
		variable num: dlx_word;
     	   	variable error: boolean := false;

   	 begin
		-------- Use a case system to simplify the method of
		-------- avoiding -flow errors.
		case(input) is
			
			-------- Standard 'dangerous' edge conditions
			when x"FFFFFFFF" =>
				output <= x"00000003" after prop_delay;
			when x"FFFFFFFE" =>
				output <= x"00000002" after prop_delay;
			when x"FFFFFFFD" =>
				output <= x"00000001" after prop_delay;
			when x"FFFFFFFC" =>
				output <= x"00000000" after prop_delay;
			
			-------- When not under edge conditions, add four
			-------- as desired for the implementation
			when others =>
				bv_addu(input, x"00000004", num, error);
				
				-------- Important to include propagation delay here.
				-------- Incorrect values with .do test files when not included.
				output <= num after prop_delay;
		end case;
    end process add4;

end architecture behavior;