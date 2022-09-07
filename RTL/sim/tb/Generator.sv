class generator;

    transaction trans;

    mailbox gen2driv;
    mailbox gen2rdriv;
    mailbox gen2scb;
    
    event ended;

    function new(mailbox gen2driv, mailbox gen2rdriv, mailbox gen2scb, event ended);
        this.gen2driv    = gen2driv;
        this.gen2rdriv    = gen2rdriv;
        this.gen2scb    = gen2scb;
        this.ended    = ended;
    endfunction

    task run();
        integer readfile;
            integer    char;
            
        int i = 0;
        int line_num = 1;
         reg [63:0] temp0 [16];     // 128Byte -> 64bit, 16burst 
            reg [63:0] temp1 [16];
        reg [1024] temp;

        // input "features.txt" file
        readfile = $fopen("/home/kkh/AIDC/data/features.txt","r");    
        while(!$feof(readfile)) begin
            trans = new();
            char = $fscanf(readfile,"%b\n",temp);
            trans.valid   =  1;
            for(i=0;i<16;i++) begin
                    temp0[i] = (temp >>((15-i)*64));
                    trans.data[i] = temp0[i];
//                    if(i==0) $display("\nLINE_number = %0d\n",line_num);
//                    $display($time,"\t%0d - feat_%h",i, trans.data[i]);
            end
            gen2driv.put(trans);
            gen2rdriv.put(trans);
            gen2scb.put(trans);
            line_num++;
        end
        $fclose(readfile);
        $display("-----------------------------------------------------------------");                
        // input "FCL_weight.txt" file

        readfile = $fopen("/home/kkh/AIDC/data/FCL_weight.txt","r");
        while(!$feof(readfile)) begin
            trans = new();
            char = $fscanf(readfile,"%b\n",temp);
            trans.valid   =  1;
            for(i=0;i<16;i++) begin
                temp1[i] = (temp >> (15- i)*64);    
                trans.data[i] = temp1[i];
                if(i==0) $display("\nLINE_number = %0d\n",line_num);
                $display($time,"\t%0d - FCL_%h",i, trans.data[i]);
            end
            gen2driv.put(trans);
            gen2rdriv.put(trans);
            gen2scb.put(trans);
            line_num++;
        end
        $fclose(readfile);
        -> ended;
    endtask
endclass

