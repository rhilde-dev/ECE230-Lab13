module binary(
    input w,
    input clk,
    input reset,
    output z,
    output yzero,yone,ytwo
);

    wire [2:0] State;
    wire [2:0] Next;
    
    assign yzero = State[0];
    assign yone = State[1];
    assign ytwo = State[2];

    dff zero(
        .Default(1'b0),
        .reset(reset),
        .D(Next[0]),
        .clk(clk),
        .Q(State[0])
    );

    dff one(
        .Default(1'b0),
        .reset(reset),
        .D(Next[1]),
        .clk(clk),
        .Q(State[1])
    );
    
    dff two(
        .Default(1'b0),
        .reset(reset),
        .D(Next[2]),
        .clk(clk),
        .Q(State[2])
    );
    
    
    assign z = (~State[2] & State[1] & ~State[0])| (State[2] & ~State[1] & ~State[0]); //D or E 
    assign Next[0] = (~State[2] & ~State[1] & ~State[0]) | (~State[2] & ~State[0] & w) | (~State[2] & ~State[1] & w) | (State[2] & ~State[1] & ~State[0] & ~w) | (~State[2] & State[1] & State[0] & ~w);
    assign Next[1] = (~State[1] & State[0]) | (State[1] & ~State[0]) | (~State[2] & ~State[1] & w);
    assign Next[2] = (State[2] & State[0]) | (State[1] & State[0] & w);

endmodule