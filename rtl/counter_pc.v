module counter_pc (/*AUTOARG*/
   // Outputs
   pc, done,
   // Inputs
   clk, rst, pc_stop
   );

  input           clk;
  input           rst;
  input   [15:0]  pc_stop;
  output  [15:0]  pc;
  output          done;

  reg [15:0] pc_r;

  assign done = pc_r == pc_stop;

  always @ (posedge clk or posedge rst) begin
    if(rst) begin
      pc_r <= 16'd0;
    end
    else begin
      if(~done)
        pc_r <= pc_r + 16'd1;
    end
  end

  assign pc = pc_r;

endmodule // counter_pc
