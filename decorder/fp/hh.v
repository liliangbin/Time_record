module hh(clkin,clkout);
input clkin;
output  clkout;
reg clkout ;
reg[3:0] count;
parameter N = 10;
always @ (posedge clkin)
	begin 
	 count <= count +1;
	 if(count==N/2 -1)
		begin 
			count<= 0;
			clkout <= ~clkout;
		end
	 end
endmodule
	