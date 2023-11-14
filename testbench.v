// Code your design here
`timescale 1ns / 1ps

module MULTI_32bit_tb;

   // Inputs
   reg clk, rst;
   reg [31:0] A;
   reg [31:0] B;

   // Outputs
   wire [31:0] F;

   // Instantiate the MULTI_32bit module
   MULTI_32bit uut (
      .clk(clk),
      .rst(rst),
      .A(A),
      .B(B),
      .F(F)
   );

   // Create a VCD file
   initial begin
      $dumpfile("MULTI_32bit_tb.vcd");
      $dumpvars(0, MULTI_32bit_tb);
   end

   // Clock Generation
   always begin
      clk = 1;
      #5;
      clk = 0;
      #5;
   end

   // Reset generation
   initial begin
      rst = 1;
      #10;
      rst = 0;
   end

   // Test stimulus
   initial begin
      // Test case 1
      A = 32'h40000000;
      B = 32'h40400000;
      #100; // Allow some time for computation

      // Test case 2
      A = 32'h40000000;
      B = 32'h40A00000;
      #100; // Allow some time for computation

      // Test case 3
      A = 32'h40000000;
      B = 32'h40E00000;
      #100; // Allow some time for computation

      // Test case 4
      A = 32'h40000000;
      B = 32'h41100000;
      #100;

     
      // Test case 5
      A = 32'h40000000;
      B = 32'h41300000;
      #100;

     
      // Test case 6     
      A = 32'h40000000;
      B = 32'h3FC00000;
      #100;
     
     
     
     
      // Test case 7
      A = 32'h3FC00000;
      B = 32'h40600000;
      #100;

     
      // Test case 8     
      A = 32'h3E000000;
      B = 32'h41000000;
      #100;
     
     // Test case 9     
      A = 32'h40000000;
      B = 32'h00000000;
      #100;

      // ... Add more test cases here ...

      // Finish simulation
      $finish;
   end

endmodule
