// this control unit implements the microcode required to control the datapath
// needed by a Robertson's multiplier described in toprobertsons.v.
// CSE140L
module robs_control_unit_micro(
  input clk, reset,
        zq, zy, zr,
  output[14:0] c,
  output logic done
	);
	
  wire        load_incr;
  wire [ 4:0] upc;
  wire [22:0] uinstr;
	
// micro-PC
  upcreg upc_reg(clk, reset, load_incr, uinstr[19:15], upc);
    
// condition select mux
  mux5 cs_mux(1'b0, zq, zr, zy, 1'b1, uinstr[22:20], load_incr);
    
// control memory
  rom control_memory(upc, uinstr);
    
// output logic
  assign c = uinstr[14:0];
    
  always_latch// @(upc)
    if(reset)          done = 0;
    else if(upc == 17) done = 1;
    
endmodule
