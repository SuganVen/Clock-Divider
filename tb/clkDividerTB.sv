
//`include "clkDividerEven.sv"

module  clkDividerTB;
logic clk, rst;
logic oclk;

clkDivider #(.divisor(3)) dut (.iclk(clk),.rst(rst), .oclk(oclk));

initial begin
    clk = 0;
    forever begin
       #10 clk = ~clk;
       $display("clk = %b, oclk = %b", clk, oclk);
    end    
end

initial begin
  rst = 1'b 1;
  #30 rst = 1'b 0;
  #400 $finish;
end

initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
end

endmodule





