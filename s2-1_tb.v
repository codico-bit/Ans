module VoteCircuit_tb;

    reg [3:0] in;
    wire w_gate, t_gate, w_beh, t_beh;

    // Instantiate the Unit Under Test (UUT)
    VoteCircuit uut (
        .in(in),
        .w_gate(w_gate),
        .t_gate(t_gate),
        .w_beh(w_beh),
        .t_beh(t_beh)
    );

    initial begin
        // Test all possible input combinations
        for (integer i = 0; i < 16; i = i + 1) begin
            in = i;
            #10; // Wait for 10 time units
            $display("Time=%0t: in=%b, w_gate=%b, t_gate=%b, w_beh=%b, t_beh=%b", 
                     $time, in, w_gate, t_gate, w_beh, t_beh);
            
            // Check if gate-level and behavioral outputs match
            if (w_gate !== w_beh || t_gate !== t_beh) begin
                $display("Mismatch detected at input %b", in);
            end
        end

        $finish; // End the simulation
    end

    // Optional: Generate VCD file for waveform viewing
    initial begin
        $dumpfile("VoteCircuit_tb.vcd");
        $dumpvars(0, VoteCircuit_tb);
    end

endmodule