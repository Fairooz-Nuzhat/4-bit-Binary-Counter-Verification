class sync_reset_test extends counter_base_test;

    string name = "sync_reset_test";

    function new(virtual counter_interface intf);
        super.new(intf);
        $display($time, "ns |%s| is created", this.name);
    endfunction

    task run();        
        super.run();
        gen.reset_seq(5);
        gen.load_seq(3);
        gen.reset_seq(3);
        gen.up_count_seq(6);
        gen.reset_seq(4);
        gen.down_count_seq(6);
        gen.reset_seq(5);
        $display($time, "ns |%s| reset tasks ended", this.name);
        env.scb.report();
    endtask

endclass

