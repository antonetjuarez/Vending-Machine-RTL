`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2023 03:39:31 PM
// Design Name: 
// Module Name: Vending_tb
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


module Vending_tb();
reg Clk, rst, N, D, Q;
wire c;
wire [0:8] amt;
Vending testb(Clk, c, amt, rst, N, D, Q);

//clock
always begin
    Clk <= 0;
    #10;
    Clk <= 1;
    #10;
end

initial begin
    rst <= 1; N <= 0; D <= 0; Q <= 0;
    @(posedge Clk);
    #10 rst <= 0; N <= 0; D <= 0; Q <= 0;
    
    @(posedge Clk);
    #10;N <= 0;D <= 1;Q <= 0;
    @(posedge Clk);
    #10;N <= 1;D <= 1;Q <= 0;
    @(posedge Clk);
    #10;N <= 1;D <= 0;Q <= 0;
    @(posedge Clk);
    #10;N <= 1;D <= 0;Q <= 1;
    @(posedge Clk);
    #10;N <= 0;D <= 0;Q <= 1;
    
end

endmodule
