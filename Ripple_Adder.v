module Ripple_Adder(
    input reset, Clock, 
    output [2:0] outputR
);
    wire [2:0] outputT;
    
    T_Flip_Flop TFF0(
        .T(1'b1), 
        .Clock(Clock),
        .Q(outputT[0])
    );
    
    T_Flip_Flop TFF1(
        .T(1'b1), 
        .Clock(outputT[0]),
        .Q(outputT[1])
    );
    
    T_Flip_Flop TFF2(
        .T(1'b1), 
        .Clock(outputT[1]),
        .Q(outputT[2])
    );
    
    assign outputR = outputT;
    
endmodule
