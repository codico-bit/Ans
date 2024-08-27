module CS158_S1_2_tb;
    reg a,b,c,d;
    wire p,q,r,s,w,x,y,z;
    CS158_S1_2 test(a,b,c,d,w,x,y,z,p,q,r,s);

    initial begin
        {a,b,c,d} = 0;
        for(integer i = 1; i < 10; i++)
            begin
                #10 {a,b,c,d} = i;
            end;
        $finish;
    end


    initial begin
        $dumpfile("CS158_S1_2.vcd");
        $dumpvars(0,CS158_S1_2_tb);
        $display("---------------------------CS158 S1-2---------------------------");
        $display("-----------------6 3 1 -1 to 8 4 2 1 converter -----------------");
        $display("| Time | 6 3 1 -1 | dataflow 6 3 2 11 | gateflow 8 4 2 1");
        $monitor("| %4d | %1b %1b %1b %1b | %10b %1b %1b %1b | %10b %1b %1b %1b |", $time,a,b,c,d,w,x,y,z,p,q,r,s);
        $display("----------------------------------------------------------------");
    end
endmodule