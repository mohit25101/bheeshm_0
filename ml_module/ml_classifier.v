module ml_classifier(
    input  [15:0] sbytes,
    input  [15:0] dbytes,
    input  [7:0]  sttl,
    input  [7:0]  dttl,
    output reg attack
);

always @(*) begin

    if(sttl <= 8'd61) begin
        if(sttl <= 8'd0) begin
            if(sbytes <= 16'd58)
                attack = 1'b0;
            else if(sbytes <= 16'd72)
                attack = 1'b1;
            else
                attack = 1'b0;
        end
        else begin
            attack = 1'b0;
        end
    end
    else begin
        if(sbytes <= 16'd90)
            attack = 1'b0;
        else begin
            if(dbytes <= 16'd84)
                attack = 1'b1;
            else if(dbytes <= 16'd87)
                attack = 1'b0;
            else
                attack = 1'b1;
        end
    end

end

endmodule
