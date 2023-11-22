module OV7670 (
    input clk_12MHz,
    input start,
    output SDA,
    output SCL,
    output led1 
    );
    
    parameter CLK_FREQ = 25000000;
    parameter SCCB_FREQ = 100000;
    reg [7:0] address = 8'h00; 
    reg [7:0] data = 8'hFF;

    wire SCCB_SIOC;
    wire SCCB_SIOD;

    

    SCCB_interface #(CLK_FREQ, SCCB_FREQ) s1 
    (clk_12MHz, start, address, data, led1, SCCB_SIOC, SCCB_SIOD);



    assign SCL = SCCB_SIOC ? 1'b0 : 1'bZ;
    assign SDA = SCCB_SIOD ? 1'b0 : 1'bZ;
    
endmodule