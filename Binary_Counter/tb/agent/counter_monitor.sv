class counter_monitor;

    virtual counter_interface intf;
    mailbox mntr2cov;
    mailbox mntr2scb;

   counter_transaction tx_mntr;
   string name = "counter_monitor";

    function new(virtual counter_interface intf);
        this.intf = intf;
        $display($time, "ns |%s| is created", this.name); 
    endfunction

    task run();
         tx_mntr = new();
         
         forever begin  
             @(negedge intf.clk);
             tx_mntr.reset = intf.reset;
             tx_mntr.enable = intf.enable;
             tx_mntr.load = intf.load;
             tx_mntr.count = intf.count;
             tx_mntr.data_in = intf.data_in;
             tx_mntr.A_count = intf.A_count;
             tx_mntr.C_out = intf.C_out;
             mntr2scb.put(tx_mntr);
             mntr2cov.put(tx_mntr);    
        end         
    endtask

endclass
