module ALUDecoder2(
    input  [2:0] funct3,
    input  [6:0] funct7,
    input  [1:0] ALUOp,
    input  [6:0] op, 
    output reg [2:0] ALUControl 
    );
    
     always @(*) begin
           case(ALUOp)      
               2'b00: ALUControl = 3'b000 ;     // (add) ------> lw , sw 
               2'b01: ALUControl = 3'b001 ;     // (sub) ------> beq 
                  
               2'b10: begin
                      
                   case(funct3)
                       010: ALUControl = 3'b101 ;    // slt
                       110: ALUControl = 3'b011 ;    // or
                       111: ALUControl = 3'b010 ;    // and 
                                               
                       000: begin
                          case( { op[5],funct7[5] } )
                              00: ALUControl = 3'b000 ;      // add
                              01: ALUControl = 3'b000 ;      // add
                              10: ALUControl = 3'b000 ;      // add 
                              11: ALUControl = 3'b001 ;      // sub 
                          endcase
                       end
                       default : ALUControl = 3'bxxx ; 
                   endcase 
               end  
               default : ALUControl = 3'bxxx ;
           endcase 
           
        end
       
   endmodule
