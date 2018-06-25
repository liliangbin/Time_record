module cnt4e(clk,clrn,ena,cout,q);
input clk,ena,clrn ;
output reg cout;
output reg [3:0] q;
always @ (posedge clk or negedge clrn)
	begin 
	if(~clrn)
		q =0;
	else 
		begin
			if(ena)
					q  = q+1;
				if(q == 10)
					begin
						q = 0;
						cout = 1;
					end
				else
					cout = 0;
			end 
	end
endmodule 