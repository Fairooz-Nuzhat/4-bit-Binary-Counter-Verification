class enable_pin_test extends counter_base_test;

    string name = "enable_pin_test";

    function new(virtual counter_interface intf);
        super.new(intf);
        $display($time, "ns |%s| is created", this.name);
    endfunction

    task run();
        super.run();
        gen.up_count_seq(10);
        gen.disable_seq(5);
        gen.up_count_seq(10);

        gen.down_count_seq(5);
        gen.disable_seq(3);
        gen.down_count_seq(5);

        gen.load_seq(8);
        gen.disable_seq(5);
        gen.load_seq(8);

        $display($time," ns || enable pin tasks ended ", this.name);
        env.scb.report();
    endtask

endclass
