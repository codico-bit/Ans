module BCD_8421_to_2421_tb;

    reg [3:0] BCD_8421;
    wire [3:0] BCD_2421;

    // Instantiate the Unit Under Test (UUT)
    BCD_8421_to_2421 uut (
        .BCD_8421(BCD_8421),
        .BCD_2421(BCD_2421)
    );

    initial begin
        // Apply each valid BCD input (0-9)
        for (integer i = 0; i < 10; i = i + 1) begin
            BCD_8421 = i;
            #10; // Wait for 10 time units
            $display("Time=%0t: BCD_8421 = %b, BCD_2421 = %b", $time, BCD_8421, BCD_2421);
        end

        // Test invalid BCD inputs (10-15)
        for (integer i = 10; i < 16; i = i + 1) begin
            BCD_8421 = i;
            #10; // Wait for 10 time units
            $display("Time=%0t: BCD_8421 = %b (Invalid), BCD_2421 = %b", $time, BCD_8421, BCD_2421);
        end

        $finish; // End the simulation
    end

    // Optional: Generate VCD file for waveform viewing
    initial begin
        $dumpfile("BCD_8421_to_2421_tb.vcd");
        $dumpvars(0, BCD_8421_to_2421_tb);
    end

endmodule