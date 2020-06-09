module counter_pc_tb ();

  //..local parameters
  localparam PC_STOP = 511;

  //..regs and wires
  reg           clk;
  reg           rst;
  wire  [15:0]  pc;
  wire          done;
  wire          reached_max_pc;
  wire  [15:0]  pc_stop = PC_STOP;

  //..initialization
  initial begin
    clk = 0;
    rst = 1;
    $dumpfile("counter_pc.vcd");
    $dumpvars();
    $display("[+] Starting simulation");
    $monitor("  [+] PC: %d", pc);
  end

  //..clk signal
  always
    #1 clk = ~clk;

  //..rst signal
  always
    #10 rst = 0;

  //..pc timeout
  assign reached_max_pc = &pc;

  //..finish simulation
  wire finished_sim = reached_max_pc | done;

  //..simulation
  always @ (posedge clk) begin
    if(finished_sim) begin
      if(done)
        $display("[!] Reached PC: %d ==> Stop!", pc_stop);
      else
        $display("[!] Reached maximum PC ==> Timeout!");
      $display("[+] Ending simulation");
      $finish;
    end
  end

  //..dut
  counter_pc
    dut (
      .clk          (clk),
      .rst          (rst),
      .pc_stop      (pc_stop),
      .pc           (pc),
      .done         (done)
    );

endmodule // counter_pc_tb
