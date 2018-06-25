module controller(clkin,sw0,clkout);
input clkin,sw0;
output reg clkout;
always @(clkin)
	begin
		if(sw0)
			clkout = clkin;
	end
endmodule 