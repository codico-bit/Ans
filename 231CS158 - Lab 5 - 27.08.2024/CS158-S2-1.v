module CS158_S2_1(
    A,B,C,D,E,valid_gate, valid_beh
);

// Gate level modelling
input A,B,C,D,E;
output valid_gate;
output reg valid_beh;
wire cond1, cond2, cond3, cond4, cond5;

assign cond1 = A | B;
assign cond2 = (C&~E) | (~C&E);
assign cond3 = (A&C);
assign cond4 = ~D | E;
assign cond5 = ~B | ( A & D);

assign valid_gate = cond1 & cond2 & cond3 & cond4 & cond5;

// Behavorial modelling;;
always @(*) begin
    // valid_beh_reg = 1'b0;
    valid_beh=1'b0;
    if((A|B) && ((C&~E) | (~C&E)) && ((A&C) | (~A & ~ C)) && (~D | E) && ~B | ( A & D))
        valid_beh=1'b1;
end

endmodule