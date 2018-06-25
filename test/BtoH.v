module BtoH(i4,o7);
input[4:0] i4;
output reg[6:0] o7;
always@(i4)
begin
case(i4)
4'd0:o7=7'b1000000;
4'd1:o7=7'b1111001;
4'd2:o7=7'b0100100;
4'd3:o7=7'b0100000;
4'd4:o7=7'b0011001;
4'd5:o7=7'b0010010;
4'd6:o7=7'b0000010;
4'd7:o7=7'b1111000;
4'd8:o7=7'b0000000;
4'd9:o7=7'b0010000;
default:o7=7'b1111111;
endcase
end
endmodule
