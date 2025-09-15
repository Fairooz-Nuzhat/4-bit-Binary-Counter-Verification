class up_counting_test extends counter_base_test;
    string name = "up_counting_test";

    function new(virtual counter_interface intf);
        super.new(intf);
        $display($time, "ns |%s| is created ", this.name);
    endfunction

    task run();
        super.run();
        gen.up_count_seq(18);
        $display($time," ns || up_counting tasks ended ",  this.name);
        env.scb.report();
    endtask

endclass
