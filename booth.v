module booth(multiplier,multiplicand,prod,sign,clk);
input [3:0] multiplier,multiplicand;
input clk;
output reg sign;
output reg [7:0] prod;
integer count=0;
reg [3:0] a,q,m,mn;
reg q0;

always @( posedge clk)
begin
	q = multiplier;
	m = multiplicand;
	prod = 8'b00000000;
	a = 4'b0000;
	q0 = 1'b0;
	sign = 1'b0;
	mn = ~m + 1'b1;
	for (count = 0; count < 4; count=count+1) begin
		case({q[0],q0})
			2'b00 : a = a + 4'b0000;
			2'b11 : a = a + 4'b0000;
			2'b01 : a = a + m;
			2'b10 : a = a + mn;
		endcase
		q0 = q[0];
		q = {a[0],q[3:1]};
		a = {a[3],a[3:1]};
	end
prod = {a[3:0],q[3:0]};
if (prod[7]==1'b1) begin
	prod = ~prod + 1'b1;
	sign = 1'b1;
	end
end
endmodule