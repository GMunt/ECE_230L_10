module D_Flip_Flop(
    input D, 
    input Clock, reset,
    output reg Q,
    output nQ
);
    initial begin
        Q <= 0;
    end

    always @(posedge Clock) begin
        if (reset) begin 
            Q <= 1'b0;
        end
        
        else begin
            Q <= D;
        end
    end
    
    assign nQ = ~Q; 

endmodule