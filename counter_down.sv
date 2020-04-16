// Counter that decrements from WIDTH to 0 at every positive clock edge.
// CSE140L   Fall 2018   lab 1
module counter_down	#(parameter dw=8, parameter WIDTH=7)
(
  input               clk,
  input               reset,
  input               ena,
  output logic [dw-1:0] result);

  always @(posedge clk)	 begin
// fill in guts -- 
//reset   ena      result
//  1      1       WIDTH
//  1      0       WIDTH						 
//  0      1       decrease by 1				 
//  0      0       hold

case(reset)
	1:
		result = WIDTH;
	0:
		if (ena == 1) result = result - 1;
endcase
							 
  end
endmodule	