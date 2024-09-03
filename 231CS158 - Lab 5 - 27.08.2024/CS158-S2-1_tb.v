module CS158_S2_1_tb;
    reg A,B,C,D,E;
    wire valid_gate, valid_beh;
    CS158_S2_1 test(A,B,C,D,E,valid_gate,valid_beh);

    initial begin
        {A,B,C,D,E} = 0;
        for(integer i = 1; i < 33; i++)
            begin
                #10 {A,B,C,D,E} = i;
            end;
        $finish;
    end


    initial begin
        $dumpfile("CS158-S2-1.vcd");
        $dumpvars(0,CS158_S2_1_tb);
        $display("---------------------------CS158 S1-2---------------------------");
        $display("-----------------6 3 1 -1 to 8 4 2 1 converter -----------------");
        $display("| Time | A B C D E | dataflow  O | gateflow O ");
        $monitor("| %4d | %1b %1b %1b %1b %1b | %10b | %10b |", $time,A,B,C,D,E,valid_gate,valid_beh);
        $display("----------------------------------------------------------------");
    end
endmodule