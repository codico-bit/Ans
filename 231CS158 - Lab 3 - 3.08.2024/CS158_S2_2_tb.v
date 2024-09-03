module CS158_S2_2_tb;
    reg X, Y, Z;
    wire F2_original_structure, F2_simplified_structure;
    wire F2_original_dataflow, F2_simplified_dataflow;
    wire F2_original_behavioural, F2_simplified_behavioural;

    initial 
	    begin
		    $dumpfile("CS158_S2_2.vcd");
		    $dumpvars(0, CS158_S2_2_tb);
	    end 

    //instantiate the modules
    CS158_S2_2_Structural U1 (X,Y,Z, F2_original_structure, F2_simplified_structure);
    CS158_S2_2_Dataflow U2 (X,Y,Z, F2_original_dataflow, F2_simplified_dataflow);
    CS158_S2_2_Behavioural U3 (X,Y,Z, F2_original_behavioural, F2_simplified_behavioural);

    initial begin
        $display("------------------------------------------------------------------------------------");
        $display("|     Input       |     Structural      |      Dataflow       |    Behavioural      |");
        $display("------------------------------------------------------------------------------------");
        $display("|  X  |  Y  |  Z  | Original | Boolean  | Original | Boolean  | Original | Boolean  |");
        $display("------------------------------------------------------------------------------------");
        $monitor("|  %b  |  %b  |  %b  |    %b     |    %b     |    %b     |    %b     |    %b     |    %b     |", X, Y, Z, F2_original_structure, F2_simplified_structure, F2_original_dataflow, F2_simplified_dataflow, F2_original_behavioural, F2_simplified_behavioural);
        

        //all possible combinations
        #10 X=0; Y=0; Z=0;
        #10 X=0; Y=0; Z=1;
        #10 X=0; Y=1; Z=0;
        #10 X=0; Y=1; Z=1;
        #10 X=1; Y=0; Z=0;
        #10 X=1; Y=0; Z=1;
        #10 X=1; Y=1; Z=0;
        #10 X=1; Y=1; Z=1;

        $finish;
        
    end

endmodule
