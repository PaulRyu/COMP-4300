entity fullAdder is 
	generic(prop_delay: Time := 10 ns);
	port(a_in, b_in, carry_in : in bit;
             sum, carry_out : out bit);
end entity fullAdder; 


architecture test of fullAdder is
	signal xorOut : bit;
	signal firstAndOut : bit;
	signal secondAndOut : bit;
	
begin

	xorOut <= a_in XOR b_in;
	firstAndOut <= xorOut AND carry_in;
	secondAndOut <= a_in AND b_in;
	sum <= xorOut XOR carry_in;
	carry_out <= firstAndOut OR secondAndOut;

end architecture test;