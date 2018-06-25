module cnt4e(clk,ena,cout,q);
input clk,ena;
output reg cout;
output reg [3:0] q;
always @ (posedge clk)
	begin 
		if(ena)
		begin
			q  = q+1;
			if(q == 9)
				begin 
					cout = 1;
					q = 0;
				end
			else
				cout = 0;
			
		end
		else 
			begin
				q = 0;
				cout = 0;
			end
	end
endmodule 