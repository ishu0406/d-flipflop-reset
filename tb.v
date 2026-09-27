module dff_reset_tb;

reg D;
reg clk;
reg reset;
wire Q;

dff_reset dut (
    .D(D),
    .clk(clk),
    .reset(reset),
    .Q(Q)
);

always #5 clk = ~clk;

initial begin

    $dumpfile("dff_reset_tb.vcd");
    $dumpvars(0, dff_reset_tb);

    $monitor("Time=%0t | clk=%b | reset=%b | D=%b | Q=%b",
             $time, clk, reset, D, Q);

    clk = 0;
    D = 0;
    reset = 1;

    #10;
    reset = 0;

    #10 D = 1;
    #10 D = 0;
    #10 D = 1;

    #10 reset = 1;
    #10 reset = 0;

    #10 D = 0;

    #10 $finish;

end

endmodule