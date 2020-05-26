module booth1(multiplier,multiplicand,prod,clk);
input [3:0] multiplier,multiplicand;
input clk;
output reg [7:0] prod;
integer count=0;
reg [3:0] a,q,m;
reg q0;

always @( posedge clk)
begin
	q = multiplier;
	m = multiplicand;
	prod = 8'b00000000;
	a = 4'b0000;
	q0 = 1'b0;
	for (count = 0; count < 4; count=count+1) begin
		case(q[0])
			1'b0 : a = a + 4'b0000;
			1'b1 : {q0,a} = a + m;
		endcase
		q = {a[0],q[3:1]};
		a = {q0,a[3:1]};
		q0 = 1'b0;
	end
prod = {a[3:0],q[3:0]};
end
endmodule