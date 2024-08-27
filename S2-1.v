module VoteCircuit(
    input [3:0] in,
    output w_gate, t_gate,
    output reg w_beh, t_beh
);

    // Gate-level modeling
    wire [5:0] m;
    
    // Intermediate signals
    assign m[0] = in[0] & in[1];
    assign m[1] = in[0] & in[2];
    assign m[2] = in[0] & in[3];
    assign m[3] = in[1] & in[2];
    assign m[4] = in[1] & in[3];
    assign m[5] = in[2] & in[3];

    // W output (winner)
    assign w_gate = m[0] | m[1] | m[2] | m[3] | m[4] | m[5];

    // T output (tie)
    assign t_gate = (~in[0] & ~in[1] & in[2] & in[3]) | 
                    (~in[0] & in[1] & ~in[2] & in[3]) | 
                    (~in[0] & in[1] & in[2] & ~in[3]) | 
                    (in[0] & ~in[1] & ~in[2] & in[3]) | 
                    (in[0] & ~in[1] & in[2] & ~in[3]) | 
                    (in[0] & in[1] & ~in[2] & ~in[3]);

    // Behavioral modeling
    always @(*) begin
        case (in)
            4'b0000, 4'b0001, 4'b0010, 4'b0100, 4'b1000: begin
                w_beh = 1'b0;
                t_beh = 1'b0;
            end
            4'b0011, 4'b0101, 4'b0110, 4'b1001, 4'b1010, 4'b1100: begin
                w_beh = 1'b0;
                t_beh = 1'b1;
            end
            4'b0111, 4'b1011, 4'b1101, 4'b1110, 4'b1111: begin
                w_beh = 1'b1;
                t_beh = 1'b0;
            end
            default: begin
                w_beh = 1'bx;
                t_beh = 1'bx;
            end
        endcase
    end

endmodule