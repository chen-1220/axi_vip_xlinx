import axi_vip_pkg::*;
import axi_vip_0_pkg::*;      //axi_vip_0与例化时的AXI VIP模块名保持一致

module axi_vip_lite_ram_tb;

  localparam RAM_ADDR = 1024;   //例化的IP是：32*1024
  bit aclk;
  bit areset;

  axi_vip_lite_ram u_axi_vip_axi_lite_ram(
    .aresetn  (areset),
    .aclk     (aclk)
  );
  initial begin
    areset <= 1'b0;
    #100
    @(posedge aclk)
    areset <= 1'b1;
  end
  initial begin
    aclk = 0;
    forever #5 aclk = ~aclk;
  end

  axi_vip_0_mst_t       mst_agent;
  bit [31:0]            mtestWData;
  bit [31:0]            mtestRData;
  xil_axi_ulong         mtestADDR;
  xil_axi_resp_t        mtestBresp;
  xil_axi_resp_t        mtestRresp;
  initial begin
      mst_agent = new("master vip agent",u_axi_vip_axi_lite_ram.u_axi_vip_0.inst.IF);
      mst_agent.start_master();
      for (int i=0; i<RAM_ADDR;i=i+1) begin
          mtestADDR  = 4*i;     //因为AXI的地址是按字节计算，而例化的RAM地址按4字节计算，所以有一个乘4操作
          mtestWData = i;
          mst_agent.AXI4LITE_WRITE_BURST(mtestADDR,0,mtestWData,mtestBresp);
      end
      for (int i=0; i<RAM_ADDR;i=i+1) begin
          mtestADDR  = 4*i;
          mst_agent.AXI4LITE_READ_BURST(mtestADDR,0,mtestRData,mtestRresp);
      end
      $finish;
  end
  
endmodule
