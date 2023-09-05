/* clk divider
based on Divisor
Freq of output clk = Freq of input clk/divisor
For even divisor:
1. a counter is set for divisor width 
2. at each posedge input clk, counter is incremented
For even or odd divisor, 
1. a counter is set for twice the divisor width
2. at each pos and neg edge of input clk, counter is incremented
*/


module clkDivider #(
    parameter divisor = 3
) (
    input  logic iclk, rst,
    output logic oclk
);
  localparam twiceDivisor = divisor << 1;
  localparam counterWidth = $clog2(twiceDivisor);
  bit [counterWidth-1:0] counter;

  always @(posedge iclk or negedge iclk or posedge rst) begin
    if (rst) begin
      counter <= '0;
    end else begin
      if (counter == twiceDivisor - 1) begin
        counter <= '0;
      end else begin
        counter <= counter + 1;
      end
    end
    oclk <= (counter < divisor)? 1'b 0: 1'b 1;
  end
 
endmodule
