module clkDividerEven #(
  parameter divisor = 2
) (
  input logic iclk, rst,
  output logic oclk
);

localparam counterWidth = $clog2(divisor);
bit [counterWidth-1:0] counter;

always @(posedge iclk or posedge rst) begin
  if (rst) begin
    counter <= '0;
  end else begin
    if (counter == divisor - 1) begin
      counter <= '0;
    end else begin
      counter <= counter + 1;
    end 
  end
  oclk <= (counter < divisor/2)? 1'b 0: 1'b 1;
end

endmodule