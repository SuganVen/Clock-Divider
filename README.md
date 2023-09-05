Clock Divider
based on Divisor

Freq of output clk = Freq of input clk/divisor
For even divisor:
1. a counter is set for divisor width 
2. at each posedge input clk, counter is incremented


For even or odd divisor, 
1. a counter is set for twice the divisor width
2. at each pos and neg edge of input clk, counter is incremented
