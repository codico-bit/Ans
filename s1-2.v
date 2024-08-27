module BCD_8421_to_2421(
    input [3:0] BCD_8421,
    output [3:0] BCD_2421
);

    // Internal wires
    wire a, b, c, d;
    wire w, x, y, z;

    // Assign input bits to variables for readability
    assign {a, b, c, d} = BCD_8421;

    // Gate-level implementation
    assign w = (a | (b & c) | (b & d));
    assign x = ((~b & c) | (~b & d) | (b & ~c & ~d));
    assign y = ((c & d) | (~c & ~d));
    assign z = ~d;

    // Assign output
    assign BCD_2421 = {w, x, y, z};

endmodule