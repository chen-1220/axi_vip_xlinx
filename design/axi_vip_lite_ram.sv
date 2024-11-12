/*
 * 	文件名 ： axi_vip_lite_ram.sv
 * 	模块名 ： axi_vip_lite_ram.sv
 * 	作者   ： Will Chen
 * 	日期   ： 
 *		-- 2024-11-11：完成代码的编写和仿真验证
 *
 * 	模块功能 ：使用AXI VIP的Lite接口的主机模块读写AXI Lite的RAM从机
 *
 * 	模块接口 ：AXI Lite
 *
 * 	说明 ：
 *		-- 仅用于仿真验证
 */
module axi_vip_lite_ram(
    input   logic aclk      ,
    input   logic aresetn   
);

    wire [31:0] axi_awaddr;
    wire        axi_awvalid;
    wire        axi_awready;
    wire [31:0] axi_wdata;
    wire [3:0]  axi_wstrb;
    wire        axi_wvalid;
    wire        axi_wready;
    wire [1:0]  axi_bresp;
    wire        axi_bvalid;
    wire        axi_bready;
    wire [31:0] axi_araddr;
    wire        axi_arvalid;
    wire        axi_arready;
    wire [31:0] axi_rdata;
    wire [1:0]  axi_rresp;
    wire        axi_rvalid;
    wire        axi_rready;

    axi_vip_0 u_axi_vip_0 (
    .aclk(aclk),                    // input wire aclk
    .aresetn(aresetn),              // input wire aresetn
    .m_axi_awaddr(axi_awaddr),    // output wire [31 : 0] m_axi_awaddr
    .m_axi_awvalid(axi_awvalid),  // output wire m_axi_awvalid
    .m_axi_awready(axi_awready),  // input wire m_axi_awready
    .m_axi_wdata(axi_wdata),      // output wire [31 : 0] m_axi_wdata
    .m_axi_wstrb(axi_wstrb),      // output wire [3 : 0] m_axi_wstrb
    .m_axi_wvalid(axi_wvalid),    // output wire m_axi_wvalid
    .m_axi_wready(axi_wready),    // input wire m_axi_wready
    .m_axi_bresp(axi_bresp),      // input wire [1 : 0] m_axi_bresp
    .m_axi_bvalid(axi_bvalid),    // input wire m_axi_bvalid
    .m_axi_bready(axi_bready),    // output wire m_axi_bready
    .m_axi_araddr(axi_araddr),    // output wire [31 : 0] m_axi_araddr
    .m_axi_arvalid(axi_arvalid),  // output wire m_axi_arvalid
    .m_axi_arready(axi_arready),  // input wire m_axi_arready
    .m_axi_rdata(axi_rdata),      // input wire [31 : 0] m_axi_rdata
    .m_axi_rresp(axi_rresp),      // input wire [1 : 0] m_axi_rresp
    .m_axi_rvalid(axi_rvalid),    // input wire m_axi_rvalid
    .m_axi_rready(axi_rready)    // output wire m_axi_rready
    );

    blk_mem_gen_0 u_blk_mem_gen_0 (
    .rsta_busy(rsta_busy),          // output wire rsta_busy
    .rstb_busy(rstb_busy),          // output wire rstb_busy
    .s_aclk(aclk),                // input wire s_aclk
    .s_aresetn(aresetn),          // input wire s_aresetn
    .s_axi_awaddr(axi_awaddr),    // input wire [31 : 0] s_axi_awaddr
    .s_axi_awvalid(axi_awvalid),  // input wire s_axi_awvalid
    .s_axi_awready(axi_awready),  // output wire s_axi_awready
    .s_axi_wdata(axi_wdata),      // input wire [31 : 0] s_axi_wdata
    .s_axi_wstrb(axi_wstrb),      // input wire [3 : 0] s_axi_wstrb
    .s_axi_wvalid(axi_wvalid),    // input wire s_axi_wvalid
    .s_axi_wready(axi_wready),    // output wire s_axi_wready
    .s_axi_bresp(axi_bresp),      // output wire [1 : 0] s_axi_bresp
    .s_axi_bvalid(axi_bvalid),    // output wire s_axi_bvalid
    .s_axi_bready(axi_bready),    // input wire s_axi_bready
    .s_axi_araddr(axi_araddr),    // input wire [31 : 0] s_axi_araddr
    .s_axi_arvalid(axi_arvalid),  // input wire s_axi_arvalid
    .s_axi_arready(axi_arready),  // output wire s_axi_arready
    .s_axi_rdata(axi_rdata),      // output wire [31 : 0] s_axi_rdata
    .s_axi_rresp(axi_rresp),      // output wire [1 : 0] s_axi_rresp
    .s_axi_rvalid(axi_rvalid),    // output wire s_axi_rvalid
    .s_axi_rready(axi_rready)    // input wire s_axi_rready
);

endmodule