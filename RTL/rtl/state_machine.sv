module traffic_control (input clk,
 input rst_n,
 input ta,
 input tb,
 output [1:0] la,
 output [1:0] lb
);

parameter [1:0]     StateA = 2'b00,
                    StateB = 2'b01,
                    StateC = 2'b10,
                    StateD = 2'b11;
parameter [1:0]     GREEN = 2'b00,
                    YELLOW = 2'b01,
                    RED = 2'b10;

// state register
reg [1:0] state, state_n;

always @(posedge clk) begin
     if (!rst_n) begin
     state <= StateA;
     end
     else begin
     state <= state_n;
     end
end

// next state logic
always @(*)  begin
     // by default, the next state is the current state
     state_n = state;
     case (state)
     StateA: begin
          if (!ta) state_n = StateB;
          end
     StateB: begin
          state_n = StateC;
          end
     StateC: begin
          if (!tb) state_n = StateD;
          end
     StateD: begin
          state_n = StateA;
          end
     endcase
end


// output logic
assign la =    (state==StateA) ? GREEN :
               (state==StateB) ? YELLOW:
                    RED;

assign lb =    (state==StateC) ? GREEN :
               (state==StateD) ? YELLOW:
                    RED;
endmodule