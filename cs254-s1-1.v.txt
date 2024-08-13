module basicGates (
    A, B, AND, NAND, OR, NOR, XOR, XNOR, NOT
);
    input  A, B;
    output AND, OR, NOR, XOR, XNOR, NOT, NAND;
    //GATE FLOW
    and(AND, A, B);
    nand(NAND, A, B);
    xor(XOR, A, B);
    xnor(XNOR, A, B);
    not(NOT, A);
    or(OR, A, B);
    nor(NOR, A, B);

    //DATA FLOW
    

endmodule