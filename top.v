module top(
    input btnU, btnC, 
    output [6:0] led
);
    Modulo_Counter modCount(
        .reset(btnU),
        .Clock(btnC),
        .compOut(led[6:3])
    );
    
    Ripple_Adder rAdder(
        .reset(btnU),
        .Clock(btnC),
        .outputR(led[2:0])
    );
endmodule
