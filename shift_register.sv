// Right shift register with arithmetic or logical shift modes
// CSE140L   Lab 1
module right_shift_register #(parameter width = 16)(
  input             clk,
  input             enable,		 // 0: do not shift; 1: enable shift
  input [width-1:0] in,          // data input to be shifted
  input             mode,        // arithmetic (0) or logical (1) shift
  output logic [width-1:0] out); // output = shifted or original input

	
	always @(posedge clk) 	begin
// fill in the guts	-- holds or shifts by 1 bit position
//    enable   mode      out  
//      0       0        hold
//		0       1	     hold
//		1       1	     logical right shift
//		1		0	     arithmetic right shift
    end

endmodule

/*
logic signed[7:0] a = 8'b11110000;	  -16		 10 = -2  110 = -2	 1110 = -8+4+2 = -2
logic signed[7:0] b;

assign b = a>>1;    logical	       8'b01111000	 128-8=120	 100000000-00001000
assign b = a>>>1; 	 arithmetic	   8'b11111000	 -16/2 = -8

 arithmetic shift:
    b = {a[7],a[7:1]};  
 logical right shift
    b = {1'b0,a[7:1]};

*/