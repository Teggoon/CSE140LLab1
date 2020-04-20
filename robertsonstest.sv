// CSE140L   Fall 2018   Lab 1
module robertsonstest;

// stimuli to device inputs
  logic             clk;
  logic             reset;
  logic signed[7:0] multiplier;		   // incoming factors
  logic signed[7:0] multiplicand;

// wires from device outputs
  wire signed[15:0] product;
  wire done;				           // mpy takes multiple clock cycles
    
// keep track of execution status
  logic  [31:0]     cycle;
    
// expected results
  logic signed[15:0] expected_product;

// Instantiate the Unit Under Test (UUT)
  toprobertsons uut (
	.clk         (clk), 
	.reset       (reset), 
	.multiplier  (multiplier), 
	.multiplicand(multiplicand), 
	.product     (product),
	.done        (done)
	);
// SystemVerilog note: if port name and connection name are 
//  identical, including capitalization, one may omit the latter,
//  e.g.   .clk, is equiv. to .clk(clk),
// .clk() means something else -- no connection !!        
  initial begin
// Initialize Inputs
	clk           = 0;
	reset         = 0;
	multiplier    = 0;
	multiplicand  = 0;
	expected_product = multiplier*multiplicand;//0;
    cycle = 0;
// Add stimulus here
// 1.1 Positive Multiplicand and Positive Multiplier
/*        reset = 1; 
        #10 reset = 0;
		cycle++;
 	   #10 wait(done);
        if (product == expected_product) 
          $display("Simulation succeeded %h = %h * %h", product,multiplier,multiplicand);
        else 
          $display("Simulation failed %h != %h * %h", product,multiplier,multiplicand);
		#40	 */
   rslt_disp;			   // task call
   multiplier   = 5;
   multiplicand = 6;
   expected_product = multiplier*multiplicand;//30;
        // 1.2 Positive Multiplicand and Positive Multiplier
		//multiplier = 7;
		//multiplicand = 5;
		//expected_product = 35;
		// 2.1 Negative Multiplicand and Positive Multiplier
		//multiplier = 5;
		//multiplicand = -6;
		//expected_product = -30;
// 2.2 Negative Multiplicand and Positive Multiplier
        rslt_disp;
		multiplier   = 7;
		multiplicand = -5;
		expected_product = multiplier*multiplicand;// -35;
        rslt_disp;
// 3.1 Positive Multiplicand and Negative Multiplier
		multiplier   = -5;
		multiplicand = 6;
		expected_product = multiplier*multiplicand;//-30;
        rslt_disp;
// 3.2 Positive Multiplicand and Negative Multiplier
		multiplier   = -7;
		multiplicand = 8;
		expected_product = multiplier*multiplicand;//-56;
        rslt_disp;
// 4.1 Negative Multiplicand and Negative Multiplier
		multiplier   = -5;
		multiplicand = -6;
		expected_product = multiplier*multiplicand;//30;
		rslt_disp;
// 4.2 Negative Multiplicand and Negative Multiplier
		multiplier   = -9;
		multiplicand = -4;
		expected_product = multiplier*multiplicand;//36;
		rslt_disp;
// extreme neg * neg
      multiplier   = -128;
		multiplicand = -128;
		expected_product = multiplier*multiplicand;//16384;
		rslt_disp;
		#40 $stop;
	end
      
// generate clock to sequence tests
    always	 begin
	  #5  clk = 1; 
	  #5  clk = 0; 
      if(reset) cycle = 0; else cycle++;
    end

  task rslt_disp;
    reset = 1; 
    #10 reset = 0;
	cycle++;
 	#10 wait(done);
    if (product == expected_product) 
      $display("Simulation succeeded 0x%h = %d = 0x%h = 0x%h * 0x%h", 
         product,product,expected_product,multiplier,multiplicand);
    else 
      $display("Simulation failed %h != %h = %h * %h",
        product,expected_product,multiplier,multiplicand);
    #40;   // wait 4 clocks before launching next operation
  endtask
         
endmodule


