module CS158_S1_2(
    a,b,c,d,w,x,y,z,p,q,r,s
);
    input a,b,c,d ;
    output w,x,y,z;
    output p,q,r,s;
    wire na,nb,nc,nd;
    wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12;
    wire f,g;

/*
    not (na, a);
    not (nb, b);
    not (nc, c);
    not (nd, d);

    // q
    and (w1, a, nb);
    and (w2, na, b, c);
    or (w3, w1, w2);

    // r
    and (w4,na,b);
    and (w5, b, nc);
    and (w6, a, nb, nc);
    or (w7, w4, w5, w6);

    // s
*/
    // Data Flow
    assign w = a&b&d;
    assign x = (a&~b&d) | (a&~b&c) | (~a&b&c&~d);
    assign y = (~a&b&~c) | (a&~b&c);
    assign z = (~a&b&~c&~d) | (~a&~b&c&~d) | (a&b&c&d) | (a&~b&~c&d) | (a&~b&c&~d);

    assign p = a&b&d;
    assign q = (a&~b&d) | (a&~b&c) | (~a&b&c&~d);
    assign r = (~a&b&~c) | (a&~b&c);
    assign s = (~a&b&~c&~d) | (~a&~b&c&~d) | (a&b&c&d) | (a&~b&~c&d) | (a&~b&c&~d);
endmodule



















    /*
    assign w = a;
    assign x = (a&~b) | (~a & b & c);
    assign y = (~a&b) | (b&~c) | (a&~b&~c);
    assign z = ~d;
    */
    


    