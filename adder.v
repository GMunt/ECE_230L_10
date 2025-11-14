module adder(
    // Declare your A/B inputs
    input A, B,
    // Declare Y output
    // Declare carry output
    output Y, Carry
);

    // Enter logic equation here
    assign Y = A ^ B;
    assign Carry = A & B;
endmodule