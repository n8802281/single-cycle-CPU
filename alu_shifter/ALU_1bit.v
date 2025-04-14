module ALU_1bit( result, carryOut, a, b, invertA, invertB, operation, carryIn, less );

  output wire result;
  output wire carryOut;

  input wire a;
  input wire b;
  input wire invertA;
  input wire invertB;
  input wire[1:0] operation;
  input wire carryIn;
  input wire less;

  reg cotemp,retemp;

  always@ (a or b or operation or carryIn or invertA or invertB)
  begin
    case (operation)
      2'b00:
      begin
        if(invertA == 1'b0 && invertB == 1'b0)
        begin
          cotemp=1'b0;
          retemp=a|b;
        end
        else if(invertA == 1'b1 && invertB == 1'b1)
        begin
          cotemp=1'b0;
          retemp=~(a&b);
        end
      end
      2'b01:
      begin
        if(invertA == 1'b0 && invertB == 1'b0)
        begin
          cotemp=1'b0;
          retemp=a&b;
        end
        else if(invertA == 1'b1 && invertB == 1'b1)
        begin
          cotemp=1'b0;
          retemp=~(a|b);
        end
      end
      2'b10:
      begin
        if(invertA == 1'b0 && invertB == 1'b0)
        begin
          cotemp=(carryIn&(a^b))|(a&b);
          retemp=(carryIn^(a^b));
        end
        else if(invertA == 1'b0 && invertB == 1'b1)
        begin
          cotemp=(carryIn&~(a^b))|(~a&b);
          retemp=(carryIn^(a^b));
        end
      end
      2'b11:
      begin
        if(invertA == 1'b0 && invertB == 1'b1)
        begin
          cotemp=(carryIn&(~a^b))|(~a&b);
          retemp=less;
        end
      end
    endcase
  end
  assign result=retemp;
  assign carryOut=cotemp;
endmodule

module ALU_1bit_num31( result, carryOut, a, b, invertA, invertB, operation, carryIn, less, overflow, set );

  output wire result;
  output wire carryOut;
  output wire overflow;
  output wire set;

  input wire a;
  input wire b;
  input wire invertA;
  input wire invertB;
  input wire[1:0] operation;
  input wire carryIn;
  input wire less;

  reg cotemp,retemp,setemp;

  always@ (a or b or operation or carryIn or invertA or invertB)
  begin
    case (operation)
      2'b00:
      begin
        if(invertA == 1'b0 && invertB == 1'b0)
        begin
          cotemp=1'b0;
          retemp=a|b;
        end
        else if(invertA == 1'b1 && invertB == 1'b1)
        begin
          cotemp=1'b0;
          retemp=~(a&b);
        end
      end
      2'b01:
      begin
        if(invertA == 1'b0 && invertB == 1'b0)
        begin
          cotemp=1'b0;
          retemp=a&b;
        end
        else if(invertA == 1'b1 && invertB == 1'b1)
        begin
          cotemp=1'b0;
          retemp=~(a|b);
        end
      end
      2'b10:
      begin
        if(invertA == 1'b0 && invertB == 1'b0)
        begin
          cotemp=(carryIn&(a^b))|(a&b);
          retemp=(carryIn^(a^b));
        end
        else if(invertA == 1'b0 && invertB == 1'b1)
        begin
          cotemp=(carryIn&~(a^b))|(~a&b);
          retemp=(carryIn^(a^b));
        end
      end
      2'b11:
      begin
        if(invertA == 1'b0 && invertB == 1'b1)
        begin
          cotemp=(carryIn&(~a^b))|(~a&b);
          retemp=less;
          setemp=(carryIn^(a^b));
        end
      end
    endcase
  end
  assign result=retemp;
  assign carryOut=cotemp;
  assign overflow=carryIn^cotemp;
  assign set=setemp;
endmodule
