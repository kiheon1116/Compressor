class scoreboard;
    
    //creating mailbox handle
    mailbox romon2scb;
    mailbox gen2scb;
       
    //used to count the number of transactions
    int no_transactions;
    int i;
    int j;
              
    bit [63:0] mem [16][492];

    //constructor
    function new(mailbox romon2scb, mailbox gen2scb);
        //getting the mailbox handles from  environment
        this.romon2scb = romon2scb;
    this.gen2scb = gen2scb;
    foreach(mem[i][j]) mem[i][j] = 64'h0;
    endfunction
    
    //Compares the Actual result with the  expected result
    task run;
       transaction trans;
       transaction trans_gen;
       #20;
       for (j=1; j<493; j++) begin
           gen2scb.get(trans_gen);
        for (i=0; i<16; i++) begin
            mem[i][j] = trans_gen.data[i];
    //        $display($time,"\tmem[%0d][%0d] = %h",i,j,trans_gen.data[i]);
        end

       end
       j = 1;
       forever begin

        romon2scb.get(trans);
    /*    for (i=0; i<16; i++) begin
            $display($time,"\tmon2scb.data[%0d] = %h",i,trans.data[i]);
        end
*/
        for (i =0; i<16;i++) begin
        //    $display($time, "\tmon2data = %h" , trans.data[i]);
            if((mem[i][j] == trans.data[i]) && (j<496)) begin
        //            $display($time);
        //            $display("okay[%0d][%0d] - %h ",i,j, trans.data[i]);
        //            #10;
            end
            else begin
            //        $display($time);
            //        $error();
            //        $display("\tfile[%0d][%0d] - %h ",i,j, mem[i][j]);
            //        $display("\tdata[%0d] - %h ",i, trans.data[i]);
                    
            end
           end
        #10;
       j++;
           no_transactions++;
              end
    endtask                                                                                                           
endclass
