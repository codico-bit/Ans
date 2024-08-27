// CS158-S1-2.v

// Gate-Level Modeling
module converter_gate_level(
    input [3:0] in,
    output [3:0] out
);
    // Assuming the conversion logic is straightforward
    // For example, let's assume the conversion is a simple mapping
    // This is a placeholder logic, replace with actual conversion logic
    assign out[3] = in[3];
    assign out[2] = in[2];
    assign out[1] = in[1];
    assign out[0] = in[0];
endmodule

// Dataflow Modeling
module converter_dataflow(
    input [3:0] in,
    output [3:0] out
);
    // Assuming the conversion logic is straightforward
    // For example, let's assume the conversion is a simple mapping
    // This is a placeholder logic, replace with actual conversion logic
    assign out = in;
endmodule
