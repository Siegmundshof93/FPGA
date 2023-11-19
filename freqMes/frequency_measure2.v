
//equal Presision Frequency Method based on FPGA
module freq_measure2

(

input sample,
input reference,
input gate,
output reg [39:0] Nx,
output reg [39:0] Ns

);

reg [39:0] Nx_counter;
reg [39:0] Ns_counter;
reg gate_sync;



always @ (posedge sample)
  begin
  if(gate)
    begin
      gate_sync <= 1'b1;
    end
  else
    begin
      gate_sync <= 1'b0;
    end
  end


 always @ (posedge reference)
 begin
  if(gate_sync == 1'b1)
    begin
      Ns_counter <= Ns_counter + 1;
    end 
  else
    begin
      Ns_counter <= 40'b0;
    end
end


 always @ (posedge sample)
 begin
  if(gate_sync == 1'b1)
    begin
      Nx_counter <= Nx_counter + 1;

    end 
  else
    begin
      Nx_counter <= 40'b0;
    end
end

always @ (negedge gate_sync)
begin
  if(Nx_counter > 40'b0)
    begin
      Nx <= Nx_counter;
      Ns <= Ns_counter;
    end
end



endmodule
