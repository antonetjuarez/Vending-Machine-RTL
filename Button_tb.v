`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2023 02:21:53 PM
// Design Name: 
// Module Name: Button_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Button_tb();
reg A, rst, clk;
wire S;

Button test(rst, clk, A,S);
//clock
always begin
    clk <= 0;
    #10;
    clk <= 1;
    #10;
end

initial begin
    rst <= 1;
    @(posedge clk);
    #10 rst <= 0;
    @(posedge clk);
    #10;
    A <= 0;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    #10;
    A <= 1;
    @(posedge clk);
    @(posedge clk);
    #10;
    A <= 1;
    @(posedge clk);
    #10;
    A <= 0;
    @(posedge clk);
    #10 rst <= 0;
    A <= 0;
    #10;
    @(posedge clk);
    #10 rst <= 0;
    @(posedge clk);
    #10;
    A <= 0;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    #10;
    A <= 1;
    @(posedge clk);
    @(posedge clk);
    #10;
    A <= 1;
    @(posedge clk);
    #10;
    A <= 0;
    @(posedge clk);
    #10 rst <= 0;
    A <= 0;
    #10;

end
endmodule
