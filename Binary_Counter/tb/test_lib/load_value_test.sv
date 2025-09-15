class load_value_test extends counter_base_test;

    string name = "load_value_test";

    function new(virtual counter_interface intf);
        super.new(intf);
        $display($time, "ns |%s| is created", this.name);
    endfunction

    task run();
        super.run();
        gen.load_seq(10);
        gen.reset_seq(2);

        gen.up_count_seq(5);
        gen.load_seq(8);
        gen.up_count_seq(5);

        gen.down_count_seq(5);
        gen.load_seq(8);
        gen.down_count_seq(5);

        gen.disable_seq(3);
        gen.load_seq(7);
        gen.disable_seq(3);

        $display($time," ns || loading tasks ended ", this.name);
        env.scb.report();
    endtask

endclass 
