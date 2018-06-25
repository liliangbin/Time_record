module name(in4,hex0,hex1);
input [3:0] in4;
output reg[3:0] hex0,hex1;
wire[3:0] ge,shi;
assign ge =in4%(4'd10);
assign shi =(in4/10)%10;
BtoH b0(ge,hex0);
BtoH b1(shi,hex1);
endmodule

