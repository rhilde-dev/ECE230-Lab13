module binary(
    input w,
    input clk,
    input reset,
    output z
);

    wire [2:0] State;
    wire [2:0] Next;

    dff zero(
        .D(Next[0]),
        .clk(clk),
        .Q(State[0])
    );

    dff one(
        .D(Next[1]),
        .clk(clk),
        .Q(State[1])
    );
    
    dff two(
        .D(Next[2]),
        .clk(clk),
        .Q(State[2])
    );
    
    assign z = State[1] & ~State[0];
    assign Next[0] = w & ~State[1] & ~State[0];
    assign Next[1] = w & (State[1] | State[0]);

endmodule