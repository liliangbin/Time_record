module cnt4e(clk,ena,cout,q);
input clk,ena;
output reg cout;
output reg [3:0] q;
always @ (posedge clk)
	begin 
		if(ena)
			q  = q+1;
			if(q == 9)
				cout = 1;
			else
				cout = 0;
	end
endmodule 