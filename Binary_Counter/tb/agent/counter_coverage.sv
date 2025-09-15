class counter_coverage; 

    covergroup cg;

        RESET: coverpoint tx_mntr.reset {
            bins RESETED = {0};
            bins ACTIVE = {1};
        }
        ENABLE: coverpoint tx_mntr.enable  {
            bins DISABLED = {0};
            bins ENABLED = {1};
        }
        LOAD: coverpoint tx_mntr.load {
            bins NOT_LOADING = {0};
            bins LOADING = {1};
        }
        COUNT: coverpoint tx_mntr.count {
            bins DOWN_COUNT = {0};
            bins UP_COUNT = {1};
        }
        DATA_IN: coverpoint tx_mntr.data_in {
            bins data[] = {[0:15]};
        }
        A_COUNT: coverpoint tx_mntr.A_count {
            bins ZERO_COUNT = {0};
            bins FULL_COUNT = {15};
            bins ONE_TO_FOURTEEN[] = {[1:14]};
        }
        C_OUT: coverpoint tx_mntr.C_out {
            bins ZERO = {0};
            bins ONE = {1};
        } 

        upcount_op: cross  RESET, ENABLE, LOAD, COUNT, A_COUNT, C_OUT {
            ignore_bins ib1 = binsof(RESET.RESETED); 
            ignore_bins ib2 = binsof(ENABLE.DISABLED);
            ignore_bins ib3 = binsof(LOAD.LOADING);
            ignore_bins ib4 = binsof(COUNT.DOWN_COUNT);
            ignore_bins carry1 = binsof(A_COUNT.ONE_TO_FOURTEEN) && binsof(C_OUT.ONE);       //when A_count=[1:14], C_out can never be 1 in case of up_count
            ignore_bins carry2 = binsof(A_COUNT.ZERO_COUNT) && binsof(C_OUT.ZERO);    //when A_count=0,C_out=1 for upcounting
            ignore_bins carry3 = binsof(A_COUNT.FULL_COUNT) && binsof(C_OUT.ONE);    //when A_count=15,C_out cannot be 1
        }    

       downcount_op: cross  RESET, ENABLE, LOAD, COUNT, A_COUNT, C_OUT {
            ignore_bins ib1 = binsof(RESET.RESETED); 
            ignore_bins ib2 = binsof(ENABLE.DISABLED);
            ignore_bins ib3 = binsof(LOAD.LOADING);
            ignore_bins ib4 = binsof(COUNT.UP_COUNT);
            ignore_bins carry1 = binsof(A_COUNT.ONE_TO_FOURTEEN) && binsof(C_OUT.ONE);     //when A_count=[1:14], C_out can never be 1 in case of up_count
            ignore_bins carry2 = binsof(A_COUNT.ZERO_COUNT) && binsof(C_OUT.ONE);  //when A_count=0,C_out=0 for downcounting
            ignore_bins carry3 = binsof(A_COUNT.FULL_COUNT) && binsof(C_OUT.ONE);  //when A_count=15,C_out cannot be 1
        }  
 
       load_op: cross LOAD,DATA_IN {
           ignore_bins ib1 = binsof(LOAD.NOT_LOADING);
       }

    endgroup

    mailbox mntr2cov;
    counter_transaction tx_mntr;
    string name = "counter_coverage";

    function new();
        cg = new();
        $display($time, "ns |%s| is created", this.name); 
    endfunction

    task run();
        forever begin 
            mntr2cov.get(tx_mntr);
            cg.sample();
        end
    endtask

endclass

