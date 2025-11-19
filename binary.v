module binary(
    input w,
    input clk,
    input reset,
    output z
);

    wire [2:0] State;
    wire [2:0] Next;

    dff zero(
        .reset(reset),
        .D(Next[0]),
        .clk(clk),
        .Q(State[0])
    );

    dff one(
        .reset(reset),
        .D(Next[1]),
        .clk(clk),
        .Q(State[1])
    );
    
    dff two(
        .reset(reset),
        .D(Next[2]),
        .clk(clk),
        .Q(State[2])
    );
    
    assign z = State[1] & ~State[0];
    assign Next[0] = (~State[2] & ~State[1] & ~State[0]) | (~State[2] & ~State[0] & w) | (~State[2] & ~State[1] & w) | (State[2] & ~State[1] & ~State[0] & ~w) | (~State[2] & State[1] & State[0] & ~w);
    assign Next[1] = (~State[1] & State[0]) | (State[1] & ~State[0]) | (~State[2] & ~State[1] & w);
    assign Next[2] = (State[2] & State[0]) | (State[1] & State[0] & w);


endmodule