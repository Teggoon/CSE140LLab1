// top level module of design itself
module toprobertsons(
  input        clk, reset, 
  input [ 7:0] multiplier,   // 8-bit data input to multiplier unit
               multiplicand, // 8-bit data input to multiplier unit
  output[15:0] product,      // 16-bit data output of multiplier unit
  output       done          // flag to signal multiplication is complete to testbench
    );

// instantiate Robertson's Multiplier
  robsmult mult(clk, reset, multiplier, multiplicand, product, done);
    
// alternative: instantiate "fake" signed multipler (used for testing testbench only)
//   signed_mult mult(product, clk, multiplier, multiplicand);

endmodule
