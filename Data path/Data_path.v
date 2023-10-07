module Data_path(
input clk, reset_n,
  input [1:0] ResultSrc, ImmSrc,
  input MemWrite, ALUSrc, RegWrite, PCSrc, 
  input [2:0] ALUControl,
  input [31:0] Instr, ReadData,
  output [31:0] PC,
  output [31:0] DataAdr,
  output [31:0] WriteData,
  output Zero
);

  
endmodule
