module fp9(clkin,clkout);
input clkin;
output  clkout;
reg clkout;
reg[30:0] count;
parameter N = 10;
always @(posedge clkin)
	begin 
	 count <= count +1;
	 if(count==N/2 -1)
		begin 
			count<= 0;
			clkout <= ~clkout;
		end
	 end
endmodule
	