//test bench for d flip flop
//1. Declare module and ports

module dff_tb;
reg D, clk,reset;
wire Q, QBAR;

//2. Instantiate the module we want to test. We have instantiated the dff_behavior

dff dut(.q(Q), .qbar(QBAR), .clear(reset), .d(D), .clk(clk)); // instantiation by port name.

//3. Monitor TB ports
initial begin
$monitor("simtime = %t | CLK = %d | D = %d |reset = %d |Q = %d | QBAR = %d", $time, clk, D, reset, Q, QBAR);
$dumpfile("dff_result.vcd");
$dumpvars();
end
//4. apply test vectors
initial begin
  clk=0;
     forever #10 clk = ~clk;  
end 
initial begin 
 reset=1; D <= 0;
 #100; reset=0; D <= 1;
 #100; D <= 0;
 #100; D <= 1;
 #100; $finish;
end 
endmodule
