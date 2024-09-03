module original (X,Y,Z, OUTPUT);
    input X,Y,Z;
    output OUTPUT;

    //gate flow
    wire x1,x2,x3,x4;
    and(x1,X,Y);
    not(x2,X);
    and(x3,x2,Z);
    and(x4,Y,Z);
    or(OUTPUT,x1,x3,x4);

    // //data flow
    //assign OUTPUT = (X & Y) | (~X & Z) | (Y & Z)

    // //behavioural modelling
    // reg OUTPUT;
    // always@(X or Y or Z) begin
    //     if(X==1 && Y==1)
    //         OUTPUT = 1;
    //     else if(X==0 && Z==1)
    //         OUTPUT = 1;
    //     else if(Y==1 && Z==1)
    //         OUTPUT = 1;
    //     else    
    //         OUTPUT = 0;
    // end

end module

module simplified(X,Y,Z,OUTPUT);
    input X,Y,Z;
    output OUTPUT;

    //GATE LEVEL
    wire x1, x2, x3;
    and(x1, X, Y);
    not(x2, X);
    and(x3, Z, x2);
    or(OUTPUT, x1, x3);

    /// // data flow
    // assign OUTPUT = (X & Y) | (~X & Z)

    // //behavioural
    // reg OUTPUT;
    // always@(X or Y or Z) begin
    //     if(X == 1 && Y == 1)
    //         OUTPUT = 1;
    //     else if (X == 0 && Z == 1)
    //         OUTPUT = 1;
    //     else
    //         OUTPUT = 0;
    // end

end module