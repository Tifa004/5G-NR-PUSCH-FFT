module tb;
    reg clk;
    reg reset;
    localparam  width=18;
    reg [width-1:0] di_re,di_im;
    reg[width-1:0] in;
    reg enable=0;
    wire [width-1:0] do_re,do_im; 
    reg [width-1:0]	mem_r[1199:0];
	reg [width-1:0]	mem_i[1199:0];
  
    localparam stage=2'd2;
    reg [8:0] pow2=16;
    reg [7:0] pow3x5=75;
    reg Flag,done,fft_done;
    int x=0;
    wire do_en;
    wire[10:0] address;
    // Instantiate your FFT module here
    // FFT5 #(.WIDTH(width)) U0(clk,reset,enable,di_re,di_im,stage,done,do_re,do_im);
    // FFT5 #(.WIDTH(width)) U1(clk,reset,enable,data_re,data_im,stage,done,do_re,do_im);
    // memory1 #(.WIDTH(width)) U2(clk,reset,in,do_re,pow2,pow3x5,done,fft_done,read);
    Top #(.WIDTH(width)) Top(clk,reset,di_re,di_im,Flag,done,do_re,do_im,do_en,address);
    localparam N=1200;
    reg [width-1:0]	output_r [N-1:0]; 
    reg [width-1:0]	output_i [N-1:0];
    reg [width-1:0] mem_r_b4_top[N-1:0];
	reg [width-1:0]	mem_i_b4_top[N-1:0];
   reg out;
    // Clock generator
    always #4 clk = ~clk;
    
    // Reset generator
    initial begin
        reset = 0;
        #2 reset=1;
        #4 reset=0;
    end
    
    // Input data generation
    initial begin
        clk = 0;
        di_im = 0;
        di_re=0;
        Flag=0;
        done=0;
       $readmemb("in_r.txt", mem_r);
	   $readmemb("in_i.txt", mem_i);

		#40;

		

		for (int i = 0; i < N; i=i+1) begin
            repeat(4) begin
                @(posedge clk);
            end
			mem_r_b4_top[i] = mem_r[i];
			mem_i_b4_top[i] = mem_i[i];
            Flag=1;
            done=i==N-1?1:0;
            out=i==N-1?1:0;
            @(posedge clk);
            Flag=0;
            done=0;
		end

        for (int i=0; i<N; i=i+1)begin
            di_re=mem_r_b4_top[i];
            di_im=mem_i_b4_top[i];
            @(posedge clk);
        end
        di_re=0;
        di_im=0;
        repeat(pow3x5) begin
        wait(do_en==1);
        $display("%t FFT done",$time);
        for (int i = 0; i < pow2; i=i+1) begin
            @(negedge clk);
            $display("%t sampled",$time);
            output_r[address] = do_re;
            output_i[address] = do_im;   
        end
        x+=pow2;
        repeat(pow2) begin
            @(posedge clk);
        end
       
    end
    $finish; 
    end
endmodule