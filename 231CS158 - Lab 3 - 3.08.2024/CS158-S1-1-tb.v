module CS158_S1_1_tb;
    reg A, B;
    wire Y1, Y2, Y3, Y4, Y5, Y6, Y7;

    CS158_S1_1 dut(.a(A),.b(B),.y1(Y1),.y2(Y2), .y3(Y3), .y4(Y4), .y5(Y5), .y6(Y6), .y7(Y7));

    initial 
	    begin
		    $dumpfile("CS158_S1_1.vcd");
		    $dumpvars(0, CS158_S1_1_tb);
	    end 
	
    initial 
        begin
            #10 A = 1'b0;   B = 1'b0;
            #10 A = 1'b0;   B = 1'b1;
            #10 A = 1'b1;   B = 1'b0;
            #10 A = 1'b1;   B = 1'b1;
            #10;
        end

    initial 
	    begin
		    $display("|                   CS158 Truth Table of the Logic Gates                           |");
		    $display("------------------------------------------------------------------------------------");
		    $display("|   A   |   B   |  AND  |  OR   |  NOT OF A  |  NAND  |  NOR  |  EX-OR  |  EX-NOR  |");
		    $display("------------------------------------------------------------------------------------");
		    $monitor("|   %b   |   %b   |   %b   |   %b   |     %b      |    %b   |   %b   |    %b    |    %b     |", A, B, Y1, Y2, Y3, Y4, Y5, Y6, Y7);
	    end
 
endmodule
