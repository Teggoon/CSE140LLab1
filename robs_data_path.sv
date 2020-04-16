// this datapath implements hardware required to perform signed
// Robertson's multiplication described in toprobertsons.v.
// CSE140L   
module robs_datapath #(parameter WIDTH = 8)
  (
  input clk, reset,
  input [WIDTH-1:0] multiplier, multiplicand,
  input[14:0]  c,
  output [WIDTH*2-1:0] product,
  output zq, zr
	);
	
// Internal signals of the datapath module
  wire [WIDTH-1:0] y, a, in_x, x, in_rh, in_rl, alu_out, q;
  wire [WIDTH*2-1:0] r, sr;
	
  register reg_y(clk, multiplicand, y, c[0], 1'b0);
  register reg_a(clk, r[WIDTH*2-1:WIDTH], a, c[14], c[2]);
  register reg_x(clk, in_x, x, c[3], 1'b0);
  register_hl reg_r(clk, in_rh, in_rl, c[8], c[9], 1'b0, r);
	
  right_shift_register sign_ext(clk, c[12], r, c[11], sr); 
	
  mux2 #(8) mux_x(.d0(multiplier), .d1(r[WIDTH-1:0]), .s(c[7]), .y(in_x));
  mux3 #(8) mux_rh(.d0(a), .d1(sr[WIDTH*2-1:WIDTH]), .d2(alu_out), .s(c[5:4]), .y(in_rh));
  mux2 #(8) mux_rl(.d0(x), .d1(sr[WIDTH-1:0]), .s(c[6]), .y(in_rl));
	
  addsub addsub(.dataa(r[WIDTH*2-1:WIDTH]), .datab(y), .add_sub(c[10]), .clk, .result(alu_out));
	
  counter_down decrement8(clk, c[1], c[13], q);
	
// External: signals to control unit and outbus
	assign product = {a,x};
// fill in guts
//    zr = 1 if r is even
//    zq = 1 if q is divisible by 8

endmodule
