module ALU(
    input  [31:0] SrcA, SrcB,
    input  [2:0]  ALUControl,
    output reg [31:0] ALUResult,
    output reg zero
    );
    
    always @(*) begin
        case(ALUControl)
            3'b000: ALUResult = SrcA + SrcB ;           // add (lw , sw)
            3'b001: ALUResult = SrcA - SrcB ;           // sub (beq)
            3'b010: ALUResult = SrcA & SrcB ;           // and
            3'b011: ALUResult = SrcA | SrcB ;           // or
            3'b101: ALUResult = (SrcA < SrcB) ? 1 : 0 ; //slt      
                default: ALUResult = 32'b0 ;     
        endcase
    end 
    
    always @(*) begin
        if ( ALUResult == 0 )
            zero = 1 ;
        else
            zero = 0 ;
    end
    
endmodule
