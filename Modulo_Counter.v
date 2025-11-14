module Modulo_Counter(
    input reset, Clock,
//    output [2:0] bits_out,
    output [3:0] compOut
);
    wire [2:0] outputA;
    wire [2:0] outputD;
    wire carryOut [1:0];
    wire shouldReset;
        
    // Modulo Divider 
    full_adder adder0(
        .A(outputD[0]),
        .B(1'b1), 
        .Cin(1'b0),
        .Y(outputA[0]),
        .Cout(carryOut[0])
    );
    
    full_adder adder1(
        .A(outputD[1]),
        .B(1'b0), 
        .Cin(carryOut[0]),
        .Y(outputA[1]),
        .Cout(carryOut[1])
    );
    
    full_adder adder2(
        .A(outputD[2]),
        .B(1'b0), 
        .Cin(carryOut[1]),
        .Y(outputA[2]),
        .Cout()
    );
    
    wire countReached;
    wire shouldReset;
    assign countReached = outputD[2] & outputD[0];
    assign shouldReset = countReached | reset;
    
    // D-FlipFlops
    D_Flip_Flop DFF0(
        .D(outputA[0]),
        .Clock(Clock), 
        .reset(shouldReset),
        .Q(outputD[0])
    );
    
    D_Flip_Flop DFF1(
        .D(outputA[1]),
        .Clock(Clock), 
        .reset(shouldReset),
        .Q(outputD[1])
    );
    
    D_Flip_Flop DFF2(
        .D(outputA[2]),
        .Clock(Clock), 
        .reset(shouldReset),
        .Q(outputD[2])
    );
    
    wire finalDff;
    assign finalDff = countReached ^ compOut[3];
    
    D_Flip_Flop DOUT(
        .D(finalDff),
        .Clock(Clock),
        .reset(reset),
        .Q(compOut[3])
    );
    
    assign compOut[2] = outputD[2];
    assign compOut[1] = outputD[1];
    assign compOut[0] = outputD[0];

endmodule
