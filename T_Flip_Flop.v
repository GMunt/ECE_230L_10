module T_Flip_Flop(
    input T, Clock,
    output reg Q, 
    output nQ
);
    initial begin
        Q <= 0;
    end
    
    always @(posedge Clock) begin
        if (T) begin
            Q = ~Q;
        end
    end
    
    assign nQ = ~Q;
endmodule
