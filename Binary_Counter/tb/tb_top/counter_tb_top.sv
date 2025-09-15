module tb_top;

    reg clk=0;

    always #5 clk =~clk;
    counter_interface intf(clk);

    Binary_Counter dut(
        .CLK(clk),
        .reset(intf.reset),
        .Load(intf.load),
        .Count(intf.count),
        .Enable(intf.enable),
        .Data_in(intf.data_in),
        .A_count(intf.A_count),
        .C_out(intf.C_out)
    );    

 
    counter_base_test tst;
    sync_reset_test rst_tst;
    up_counting_test up_cnt_tst;
    down_counting_test dwn_cnt_tst;
    enable_pin_test en_tst;
    load_value_test ld_tst;
    carry_out_test carry_tst;
    random_test rnd_tst;
      
    initial begin
         
        if ($test$plusargs("sync_reset_test")) begin
            rst_tst = new(intf);
            rst_tst.connect();
            rst_tst.run();
        end

        if ($test$plusargs("up_counting_test")) begin
            up_cnt_tst = new(intf);
            up_cnt_tst.connect();
            up_cnt_tst.run();
        end

        if ($test$plusargs("down_counting_test")) begin
            dwn_cnt_tst = new(intf);
            dwn_cnt_tst.connect();
            dwn_cnt_tst.run();
        end

        if ($test$plusargs("enable_pin_test")) begin
            en_tst = new(intf);
            en_tst.connect();
            en_tst.run();
        end

        if ($test$plusargs("load_value_test")) begin
            ld_tst = new(intf);
            ld_tst.connect();
            ld_tst.run();
        end  
     
        if ($test$plusargs("carry_out_test")) begin
            carry_tst = new(intf);
            carry_tst.connect();
            carry_tst.run();
        end

        if ($test$plusargs("random_test")) begin
            rnd_tst = new(intf);
            rnd_tst.connect();
            rnd_tst.run();
        end

        $finish;
    end


endmodule
