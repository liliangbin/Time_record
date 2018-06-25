module counter(clkin,key0,key1,low,high,co);
input clkin,key0,key1;
output reg[3:0] low,high;
output reg co;
reg [7:0] count;
always @ (posedge clkin)
	if(key0&&key1)
		begin
			count = count +1;
			low = count%10;
			high = count/10;
			if(count==60)
				begin
					low = 0;
					high = 0;
					count = 0;
					co = 1;
				end 
			else 
				begin
					co = 0;
				end
		end
	else 
		begin
			count = 0;
			low = 0;
			high  = 0;
			co = 0;
		end 
endmodule 