module testGate;

    reg X, Y, Z;
    wire original, simple;
    original testO (
        .X(X),
        .Y(Y),
        .Z(Z),
        .OUTPUT(original)
    );
    
    simplified testS (
        .X(X),
        .Y(Y),
        .Z(Z),
        .OUTPUT(simple)
    );

    initial begin
        $display("Time X Y Z Original Simplified");
        

        A = 1'b0;
        B = 1'b0;
        #10 B = 1'b1;
        #10 A = 1'b1;
        #10 B = 1'b0;
        #10 $finish;
        
        $finish;
    end
    
    initial begin
        $dumpfile("testGate.vcd"); 
        $dumpvars(0, testGate);   
        $monitor("%4d %b %b %b %b %b", $time, X, Y, Z, original, simple);
    end

endmodule
