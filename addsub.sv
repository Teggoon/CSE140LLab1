// N-bit Adder/Subtractor (active low subtract)
// CSE140L   Fall 2018   lab 1
module addsub #(parameter dw=8)
(
  input [dw-1:0] dataa,		     // incoming operand
  input [dw-1:0] datab,
  input          add_sub,	     // 1: add; 0: subtract
  input          clk,			 // red herring
  output logic [dw-1:0] result	 // sum or difference
);

// fill in guts        
//add_sub       result
//1             dataa + datab;
//0             dataa - datab;   

assign result = add_sub == 1 ? dataa + datab : dataa - datab;


endmodule
