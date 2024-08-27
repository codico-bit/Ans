// Testbench for the Converter
module testbench;
    reg [3:0] in;
    wire [3:0] out_gate, out_dataflow;

    // Instantiate the gate-level model
    converter_gate_level uut_gate (
        .in(in),
        .out(out_gate)
    );

    // Instantiate the dataflow model
    converter_dataflow uut_dataflow (
        .in(in),
        .out(out_dataflow)
    );

    initial begin
        // Monitor the signals
        $monitor("Time = %0d, in = %b, out_gate = %b, out_dataflow = %b", $time, in, out_gate, out_dataflow);

        // Test cases
        in = 4'b0000; #10;
        in = 4'b0001; #10;
        in = 4'b0010; #10;
        in = 4'b0011; #10;
        in = 4'b0100; #10;
        in = 4'b0101; #10;
        in = 4'b0110; #10;
        in = 4'b0111; #10;
        in = 4'b1000; #10;
        in = 4'b1001; #10;
        in = 4'b1010; #10;
        in = 4'b1011; #10;
        in = 4'b1100; #10;
        in = 4'b1101; #10;
        in = 4'b1110; #10;
        in = 4'b1111; #10;

        // End simulation
        $finish;
    end
endmodule