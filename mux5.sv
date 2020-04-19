// 5:1 MULTIPLEXER
module mux5 (input      d0, d1, d2, d3, d4,	 // data in
              input      [2:0]       s, 	 // selector
              output logic y);				 // data out

// fill in guts
//  s      y
//  0	  d0
//  1	  d1
//  2	  d2
//  3	  d3
//  4	  d4
//  5	   0
//  6	   0
//  7	   0

always_comb begin

case(s)
	0:
		y = d0;
	1:
		y = d1;
	2:
		y = d2;
	3:
		y = d3;
	4:
		y = d4;
	5:
		y = 0;
	6:
		y = 0;
	7:
		y = 0;
endcase

end
endmodule
