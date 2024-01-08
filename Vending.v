`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2023 03:38:55 PM
// Design Name: 
// Module Name: Vending
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

module Vending(Clk, c, amt, rst, N, D, Q);

input Clk, rst, N, D, Q;
output reg c;
output reg [8:0] amt;
parameter start = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, C1 = 6, C2 = 7, C3 = 8, C4 = 9;

reg [8:0] state, nextstate;
///////////////////////////////////////
always @(posedge Clk) begin
    if (rst == 1)begin
        state <= start;
        amt <= 0;
        c <= 0;
    end else begin
        state <= nextstate;
    end
 end
 ///////////////////////////////////
 
always @(state, N, D, Q)begin
    case(state)
    start: begin
        amt <= 0;
        c <= 0;
        if (N&~D&~Q)begin
            nextstate <= S1;    //nickel
        end else if (~N&D&~Q)begin
            nextstate <= S2;    //dime
        end else if (~N&~D&Q)begin
            nextstate <= S5;    //quarter
        end else begin    //anything else
            nextstate <= start;
        end
    end
    
    S1: begin
        amt <= 5;
        c <= 0;
        if (N&~D&~Q)begin
            nextstate <= S2;    //nickel
        end else if (~N&D&~Q)begin
            nextstate <= S3;    //dime
        end else if (~N&~D&Q)begin
            nextstate <= C1;    //quarter
        end else begin    //anything else
            nextstate <= S1;
        end
    end
    
    S2: begin
        amt <= 10;
        c <= 0;
        if (N&~D&~Q) begin
            nextstate <= S3;    //nickel
        end else if (~N&D&~Q) begin
            nextstate <= S4;    //dime
        end else if (~N&~D&Q) begin
            nextstate <= C2;    //quarter
        end else begin    //anything else
            nextstate <= S2;
        end
    end
    
    S3: begin
        amt <= 15;
        c <= 0;
        if (N&~D&~Q) begin
            nextstate <= S4;    //nickel
        end else if (~N&D&~Q) begin
            nextstate <= S5;    //dime
        end else if (~N&~D&Q) begin
            nextstate <= C3;    //quarter
        end else begin    //anything else
            nextstate <= S3;
        end
    end
    
    S4: begin
        amt <= 20;
        c <= 0;
        if (N&~D&~Q) begin
            nextstate <= S5;    //nickel
        end else if (~N&D&~Q) begin
            nextstate <= C1;    //dime
        end else if (~N&~D&Q) begin
            nextstate <= C4;    //quarter
        end else begin    //anything else
            nextstate <= S4;
        end
    end
  
  
  
    S5: begin       //will only go to itself until reset
        amt <= 0;
        c <= 1;
        nextstate <= S5;
    end
    
    C1: begin
        amt <= 5;
        c <= 1;
        nextstate <= C1;
    end
  
    C2: begin
        amt <= 10;
        c <= 1;
        nextstate <= C2;
    end

    C3: begin
        amt <= 15;
        c <= 1;
        nextstate <= C3;
    end 
     
    C4: begin
        amt <= 20;
        c <= 1;
        nextstate <= C4;
    end

    endcase
end

endmodule
