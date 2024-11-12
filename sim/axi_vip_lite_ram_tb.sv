import axi_vip_pkg::*;
import axi_vip_0_pkg::*;      //axi_vip_0������ʱ��AXI VIPģ��������һ��

module axi_vip_lite_ram_tb;

  localparam RAM_ADDR = 1024;   //������IP�ǣ�32*1024
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
          mtestADDR  = 4*i;     //��ΪAXI�ĵ�ַ�ǰ��ֽڼ��㣬��������RAM��ַ��4�ֽڼ��㣬������һ����4����
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
