Lab 1

Haocheng Li (A15608864)
Vicente Montoya(A15561775)

Guide for the reader:

In the submission we have included the following files as required,

Screenshot of the ModelSim transcript: ModelSim transcript.jpg

Screenshot of ModelSim waveform viewer: ModelSim waveform viewer.png

Screenshot of top level schematic for the both control block and data path block: Top level (control block and data path block).jpg

Screenshot of top level schematic for the control block: Top level (control block).jpg

Screenshot of top level schematic for the data path block: Top level (data path block).jpg

Screenshot of threshold debugging: threshold_debug.jpg

Note: We have not included a "Screenshot of any remaining unresolved warning messages from ModelSim." as we did have any.



Additionally we included the answers to the required discussion questions:

5.1. Everything worked!

5.2. No errors in ModelSim transcript.

5.3 Quartus warnings:
	
Warning (18236): Number of processors has not been specified which may cause overloading on shared machines.  Set the global assignment NUM_PARALLEL_PROCESSORS in your QSF to an appropriate value for best performance.
Warning (10230): Verilog HDL assignment warning at upc_reg.sv(25): truncated value with size 32 to match size of target (5)
Warning (10030): Net "mem.data_a" at rom.sv(7) has no driver or initial value, using a default initial value '0'
Warning (10030): Net "mem.waddr_a" at rom.sv(7) has no driver or initial value, using a default initial value '0'
Warning (10030): Net "mem.we_a" at rom.sv(7) has no driver or initial value, using a default initial value '0'
Warning (10230): Verilog HDL assignment warning at robs_data_path.sv(38): truncated value with size 32 to match size of target (1)
Warning (10230): Verilog HDL assignment warning at robs_data_path.sv(39): truncated value with size 32 to match size of target (1)
Warning (10230): Verilog HDL assignment warning at counter_down.sv(20): truncated value with size 32 to match size of target (8)
Warning (10230): Verilog HDL assignment warning at counter_down.sv(22): truncated value with size 32 to match size of target (8)
Warning (18236): Number of processors has not been specified which may cause overloading on shared machines.  Set the global assignment NUM_PARALLEL_PROCESSORS in your QSF to an appropriate value for best performance.
Warning (292013): Feature LogicLock is only available with a valid subscription license. You can purchase a software subscription to gain full access to this feature.
Warning (15714): Some pins have incomplete I/O assignments. Refer to the I/O Assignment Warnings report for details
Warning (335093): The Timing Analyzer is analyzing 1 combinational loops as latches. For more details, run the Check Timing command in the Timing Analyzer or view the "User-Specified and Inferred Latches" table in the Analysis & Synthesis report.
Warning (18236): Number of processors has not been specified which may cause overloading on shared machines.  Set the global assignment NUM_PARALLEL_PROCESSORS in your QSF to an appropriate value for best performance.
Warning (18236): Number of processors has not been specified which may cause overloading on shared machines.  Set the global assignment NUM_PARALLEL_PROCESSORS in your QSF to an appropriate value for best performance.
Warning (335093): The Timing Analyzer is analyzing 1 combinational loops as latches. For more details, run the Check Timing command in the Timing Analyzer or view the "User-Specified and Inferred Latches" table in the Analysis & Synthesis report.
Warning (18236): Number of processors has not been specified which may cause overloading on shared machines.  Set the global assignment NUM_PARALLEL_PROCESSORS in your QSF to an appropriate value for best performance.

	Critical Warnings:

Critical Warning (127005): Memory depth (32) in the design file differs from memory depth (18) in the Memory Initialization File "C:/Users/Vicente/Desktop/CSE 140L/Lab1/db/toprobertsons.ram0_rom_1d582.hdl.mif" -- setting initial value for remaining addresses to 0
Critical Warning (169085): No exact pin location assignment(s) for 35 pins of 35 total pins. For the list of pins please refer to the I/O Assignment Warnings table in the fitter report.
Critical Warning (332012): Synopsys Design Constraints File file not found: 'toprobertsons.sdc'. A Synopsys Design Constraints File is required by the Timing Analyzer to get proper timing constraints. Without it, the Compiler will not properly optimize the design.
Critical Warning (332012): Synopsys Design Constraints File file not found: 'toprobertsons.sdc'. A Synopsys Design Constraints File is required by the Timing Analyzer to get proper timing constraints. Without it, the Compiler will not properly optimize the design.
Critical Warning (332148): Timing requirements not met
	Info (11105): For recommendations on closing timing, run Report Timing Closure Recommendations in the Timing Analyzer.
Critical Warning (332148): Timing requirements not met
	Info (11105): For recommendations on closing timing, run Report Timing Closure Recommendations in the Timing Analyzer.
Critical Warning (332148): Timing requirements not met
	Info (11105): For recommendations on closing timing, run Report Timing Closure Recommendations in the Timing Analyzer.

5.4  The pattern that we have identified is that each multiplier has a negative threshold multiplicant such that any product with a multiplicant more negative that the threshold will result in a bug. 
For example, when the multiplier is -1, the threshold is -63. The threshold seems to increase as the multiplier increases. 
We think this error occurs due to an incorrect handling of the sign extension as the leftmost digits of the computation are correct.
We reverted the modifications done to the testbench, but we include as screenshot that help us determine our conclusions.


	