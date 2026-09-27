module dff_reset (
    input D,
    input clk,
    input reset,
    output reg Q
);

always @(posedge clk)
begin
    if (reset)
        Q <= 0;
    else
        Q <= D;
end

endmodule