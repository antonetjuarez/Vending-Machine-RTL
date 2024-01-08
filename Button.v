`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2023 02:09:30 PM
// Design Name: 
// Module Name: Button
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


module Button(rst, Clk, A, S);
input Clk, A, rst;
output reg S;
parameter rise = 0, fall = 1, pulse = 2;

reg [1:0] state, nextstate;
///////////////////////////////////////
always @(posedge Clk) begin
//always @(state, A, S)begin
    if (rst == 1)begin
        state <= rise;
    end else begin
        state <= nextstate;
    end
 end
 ///////////////////////////////////
always @(state, A)begin
 
    case(state)
    //all lights off
    rise: begin
        S <= 0;
        if (~A) begin
            nextstate <= rise;
        end 
        else begin
            nextstate <= pulse;
        end
    end
    
    //all state will always go back to off
    fall: begin
        S <= 0;
        if (~A) begin
            nextstate <= rise;
        end
        else begin 
            nextstate <= fall;
        end
    end
    
    //R1 goes to R2 unless LR' which goes to R4
    pulse: begin
        S <= 1;
        if (A) begin
            nextstate <= fall;
        end else begin
            nextstate <= rise;
        end
    end
//    default: begin
//    S <= 0;
//    end
    endcase
    
end

endmodule