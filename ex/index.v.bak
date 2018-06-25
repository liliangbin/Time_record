module index(clk,sw0,sw1,key0,key1,key2,key3,hex0,hex1,hex2,hex3,hex4,hex5,clock);
input clk,sw0,sw1,key0,key1,key2,key3;
output hex0,hex1,hex2,hex3,hex4,hex5;
wire [3:0] hex0,hex1,hex2,hex3,hex4,hex5;
output  reg clock;
reg [7:0] year,month,day,hour,minutes,second;
reg [3:0] q1,q2,q3,q4,q5,q6;

//对应的是年月日，时分秒的高位和低位。

always @(posedge clk or negedge key0 or negedge key1 or key2 or negedge key3 )
begin

  if (sw0) 
  begin
    second = second+1;
  end 

  else if (!sw0) 
  begin
    if (sw1) 
	 begin
      if (key1==0)
		begin
        second = second + 1;
      end
		
      else if (key2==0) 
		begin
        minutes = minutes + 1;
      end
		
      else if (key3==0)
		begin
        hour  = hour +1;
      end
		
    end
	 
    else  begin
      if (key1==0) 
		begin
        day = day +1;
      end
		
      else if (key2==0)
		begin
        month = month +1;
      end
      
		else if (key3==0) 
		begin
        year = year+1;
      end
		
    end
  end
  
  else if(second == 60)
  begin
      second = 0;
      minutes = minutes+1;
  end

  else if (minutes==60)
  begin
      minutes = 0;
      hour = hour+1;
    end

  else if (hour==24) 
  begin
      hour = 0;
      day = day+1;
      clock = 1;
   end

  else if (month==2) 
  begin
      if ((2100+year)/4==0&&(2100+year)/100!=0||(2100+year)/400==0) 
		begin
          if (day==30) 
			 begin
            month = 3;
            day = 1;
          end
        end

       else begin
          if (day==29) 
			 begin
            month = 3;
            day = 1;
          end
        end
    
   end

  else if(month==1||month==3||month==5||month == 7||month==8||month==10||month==12)
  begin
        if (day==32) 
		  begin
          month = month+1;
          day = 1;
        end
    end

  else if (month == 4||month==6||month==9||month ==11)
  begin
      if (day==31)
		begin
        month=month+1;
        day = 1;
      end
    end

  else if (month==13) 
  begin
      month=1;
      year = year +1;
  end
  

  else if (sw1) 
  begin
    //当sw1为1时显示年月日
    q1 = day%10;
    q2 = day/10;
    q3 = month%10;
    q4 = month/10;
    q5 = year%10;
    q6 = year/10;
  end 
  
  else if(!sw1) 
  begin
    q1 = second%10;
    q2 = second/10;
    q3 = minutes%10;
    q4 = minutes/10;
    q5 = hour%10;
    q6 = hour/10;
  end 

  else if(second!=0)
  begin
    clock = 0;
  end

end

assign hex0 = q1;
assign hex1 = q2;
assign hex2 = q3;
assign hex3 = q4;
assign hex4 = q5;
assign hex5 = q6;

endmodule 
