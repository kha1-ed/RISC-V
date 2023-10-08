module RISC_V(
  input clk,
  input reset);
  
  wire zero;
  wire RegWrite;
  wire ImmSrc;
  wire ALUSrc;
  wire MemWrite;
  wire [1:0] ResultSrc;
  wire [2:0] ALUControl;
  wire  PCSrc;
  wire [31:0] PC;
  wire [31:0] Instr;
  wire [31:0] ReadData;
  wire [31:0] WriteData;
  wire [31:0] ALUResult;
  
  ControlUnit2 controll(
    .zero(zero),
    .op(Instr[6:0]),  
    .funct3(Instr[14:12]),
    .funct7(Instr[30:24]), //take care
    .RegWrite(RegWrite),
    .ImmSrc(ImmSrc),
    .ALUSrc(ALUSrc),
    .MemWrite(MemWrite),
    .ResultSrc(ResultSrc),
    .ALUControl(ALUControl),
    .PCSrc(PCSrc)
);
    
    
  Data_path dataPath(
    .clk(clk),
    .reset_n(reset),
    .ResultSrc(ResultSrc),
    .ImmSrc(ImmSrc),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite),
    .PCSrc(PCSrc), 
    .ALUControl(ALUControl),
    .Instr(Instr),
    .ReadData(ReadData),
    .PC(PC),
    .ALUResult(ALUResult),
    .WriteData(WriteData),
    .Zero(zero)
);
  
  Data_memory data_memory(
    .clk(clk),
    .reset_n(reset),
    .WE(MemWrite),
    .addr(ALUResult),
    .WD(WriteData),
    .RD(ReadData)
);

  Instruction_memory instuctionmem(
    .addr(PC),
    .data(Instr)
);


endmodule
