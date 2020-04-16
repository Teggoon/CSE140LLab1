// this control unit implements the FSM required to control the datapath
// needed by a Robertson's multiplier described in toprobertson.sv.
// This occupies the place of a program counter, instruction memory,
//   and instruction decoder in a conventional RISC processor
module robs_control_unit_fsm(
  input         clk, reset,
                zq, zy, zr,
  output[14:0]  c,
  output logic  done
);

	// FSM States
  parameter   S0  	= 5'b00000; // State 00
  parameter   S1  	= 5'b00001; // State 01
  parameter   S2  	= 5'b00010;	// State 02
  parameter   S3   	= 5'b00011;	// State 03
  parameter   S4   	= 5'b00100;	// State 04
  parameter   S5   	= 5'b00101;	// State 05
  parameter   S6    = 5'b00110;	// State 06
  parameter   S7    = 5'b00111;	// State 07
  parameter   S8   	= 5'b01000;	// State 08
  parameter   S9    = 5'b01001;	// State 09
  parameter   S10   = 5'b01010;	// state 0a
  parameter   S11   = 5'b01011;	// State 0b
  parameter   S12 	= 5'b01100; // State 0c
  parameter   S13 	= 5'b01101; // State 0d
  parameter   S14  	= 5'b01111;	// State 0f
  parameter   S15   = 5'b10010;	// State 12
  parameter   S16   = 5'b10011;	// State 13
  parameter   S17   = 5'b10100;	// State 14

  logic [4:0]  state, nextstate;
  logic [14:0] controls;	
	
// state register
  always @(posedge clk, posedge reset)			
	if (reset) state <= S0;
	else state <= nextstate;
	 
// next state logic
  always_comb begin// @( * )
    done = 0;
    nextstate = S0;
    case(state)
	  S0:  nextstate = S1;
	  S1:  nextstate = S2;
	  S2:  nextstate = S3;
	  S3:  case(zq)
	  	     0:       nextstate = S4;
	  	     1:       nextstate = S12;
	  	     default: nextstate = S0;  // should never happen
	  	   endcase
	  S4:  case(zr)
			 0:       nextstate = S5;
			 1:       nextstate = S6;
			 default: nextstate = S0; // should never happen
		   endcase
	  S5:  nextstate = S6;
	  S6:  case(zy)
		     0:       nextstate = S7;
			 1:       nextstate = S9;
			 default: nextstate = S0; // should never happen
		   endcase
	  S7:  nextstate = S8;		
	  S8:  nextstate = S10;	
	  S9:  nextstate = S10;
	  S10: nextstate = S11;
	  S11: nextstate = S3;
	  S12: case(zr)
		     0:      nextstate = S13;
		     1:      nextstate = S14;
		     default: nextstate = S0; // should never happen
		   endcase
      S13: nextstate = S14;
	  S14: nextstate = S15;
	  S15: nextstate = S16;
	  S16: nextstate = S17;
	  S17: begin nextstate = S17; done = 1; end
	endcase
  end	 
// output logic
  assign c = controls;
	 
	always_comb
	 case(state)
        S0:        	controls = 15'b000_0000_0000_0011;
		S1:       	controls = 15'b000_0000_0000_1100;
		S2:         controls = 15'b000_0011_0000_0000;
		S3:         controls = 15'b000_0000_0000_0000;
		S4:         controls = 15'b000_0000_0000_0000;
		S5:         controls = 15'b000_0101_0010_0000;
		S6:         controls = 15'b000_0000_0000_0000;
		S7:        	controls = 15'b001_0000_0000_0000;
		S8:   		controls = 15'b000_0000_0000_0000;
		S9:         controls = 15'b001_1000_0000_0000;
		S10:    	controls = 15'b010_0011_0101_0000;
		S11:  		controls = 15'b000_0000_0000_0000;
		S12:        controls = 15'b000_0000_0000_0000;   
		S13:       	controls = 15'b000_0001_0010_0000;
		S14:        controls = 15'b001_0000_0000_0000;
		S15:        controls = 15'b000_0011_0101_0000;
		S16:        controls = 15'b100_0000_1000_1000;	
		S17:        controls = 15'b000_0000_0000_0000;	
		default:    controls = 15'b000_0000_0000_0000; // should never happen
	 endcase
	 
endmodule
