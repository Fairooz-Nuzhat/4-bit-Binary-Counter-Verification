class counter_driver;
    
    virtual counter_interface intf;
    mailbox gen2drvr;
    counter_transaction tx;
    semaphore sem;
    string name = "counter_driver";
    
    function new(virtual counter_interface intf);
            this.intf = intf;
        $display($time, "ns |%s| is created", this.name); 
    endfunction

    task run();
        forever begin
            gen2drvr.get(tx);
            intf.reset <= tx.reset;
            intf.enable <= tx.enable;
            intf.load <= tx.load;
            intf.count <= tx.count;
            intf.data_in <= tx.data_in;
            @(negedge intf.clk);
            sem.put(1);
        end
    endtask

    task delay();
        @(negedge intf.clk);
    endtask

endclass
