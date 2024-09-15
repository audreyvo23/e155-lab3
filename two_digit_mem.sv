// Audrey Vo
// avo@hmc.edu
// 9/12/2024
// This code stores the last 2 key digit values inputs.
module two_digit_mem (input logic clk, reset,
                        input logic [3:0] s,
                        output logic [3:0] s1, s2);

        always_ff @(posedge clk)
        if (reset)   begin
                s2 <= 4'b0000;
                s1 <= 4'b0000;
        end
		else       begin
                s2 <= s1;
                s1 <= s;
        end

endmodule
