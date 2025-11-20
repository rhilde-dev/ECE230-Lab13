module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);

    // Hook up binary and one-hot state machines
    onehot one_hot (.w(sw), .clk(btnC), .reset(btnU), .z(led[0]), .a(led[2]), .b(led[3]), .c(led[4]), .d(led[5]), .e(led[6]));

    binary bin (.w(sw), .clk(btnC), .reset(btnU), .z(led[1]), .out(led[9:7]));

endmodule