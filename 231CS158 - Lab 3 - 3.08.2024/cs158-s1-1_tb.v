module testBasicGates;
    reg A, B;
    wire AND, NAND, OR, NOR, XOR, XNOR, NOT;
    
    // Instantiate the basicGates module
    basicGates uut (
        .A(A),
        .B(B),
        .AND(AND),
        .NAND(NAND),
        .OR(OR),
        .NOR(NOR),
        .XOR(XOR),
        .XNOR(XNOR),
        .NOT(NOT)
    );
    
    initial begin
        A = 1'b0;
        B = 1'b0;
        #10 B = 1'b1;
        #10 A = 1'b1;
        #10 B = 1'b0;
        #10 $finish;
    end
    
    initial begin
        
        $dumpfile("BasicGates.vcd");
        $dumpvars(0, testBasicGates);
        $display("Time A B AND NAND OR NOR XOR XNOR NOT");
        $monitor("%4d   %d   %d   %d   %d   %d   %d  %d   %d", $time, A, B, AND, NAND, OR, NOR, XOR, XNOR, NOT);
    end
endmodule

