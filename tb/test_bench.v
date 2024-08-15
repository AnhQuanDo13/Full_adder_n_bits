module test_bench #(parameter N = 32);
    reg [N-1:0]  a,b;
    wire [N:0] sum;
  	reg [N:0] res;
    
    full_adder_advanced #(N) dut(.a(a), .b(b), .sum(sum[N:0]), .carry(sum[N]));

initial begin
    if (N < 1 | N > 32) begin
        $display("=======================================================");	
        $display(">>>>>>>>>>>>>>>>>>>>  OUT OF RANGE <<<<<<<<<<<<<<<<<<<<");
        $display(">>>>>>>>>>>>>>  N SHOULD IN RANGE [1:32] <<<<<<<<<<<<<<");
        $display("=======================================================");	
        #100;
        $finish;
    end else begin
        for( integer i = 0; i < 101; i++ ) begin
            if( i == 100) begin
                a = {N{1'b1}};
                b = {N{1'b1}};
            end else begin
                a = $urandom_range(0,{N{1'b1}});
                b = $urandom_range(0,{N{1'b1}});
            end
            #5;

    res = a + b;

        $display("=======================================================");	
        $display("Case:%d 	a = %d, b = %d",i,a,b);
  	    $display("Exp: %d 	Actual: %d", res, sum);
        if( res === sum) begin
            $display(">>>>>>>>>>>>>>>>>>>>>>>>  PASS <<<<<<<<<<<<<<<<<<<<<<<<");
        end else begin
            $display(">>>>>>>>>>>>>>>>>>>>>>>>  FAIL <<<<<<<<<<<<<<<<<<<<<<<<");
  	  	    $finish;
        end
    end
end
  	    $display("=======================================================");	
  	    #100; 
        $finish;
end

endmodule
