module index(clk,sw0,sw1,key0,key1,key2,key3,hex0,hex1,hex2,hex3,hex4,hex5,clock);
input clk,sw0,sw1,key0,key1,key2,key3; //输入信号，
output hex0,hex1,hex2,hex3,hex4,hex5;
wire [3:0] hex0,hex1,hex2,hex3,hex4,hex5; //7段管
output  reg clock; //整点报时功能，一个clock信号的实现
reg [7:0] year,month,day,hour,minutes,second;
reg [3:0] q1,q2,q3,q4,q5,q6;//中间变量，最后都赋值给hex0 -- hex5  可以删除掉直接用hex{}

//对应的是年月日，时分秒的高位和低位。

always @(posedge clk or negedge key0 )
begin 
  if (~key0)
	  begin//复位运算
		if(sw1)
			begin
				year = 16;
				month = 1;
				day = 1 ;
		   end
		else
			begin
		
					hour = 0;
					minutes = 0;
					second = 0;
			end
		  
	  end
  else//正式的测试
    begin

      if (sw0)//sw0为1的时候表示表示计数状态
         begin
          second = second + 1;
        end

      if(second == 60)//秒的满60进位
        begin
          second = 0;
          minutes = minutes+1;
        end

      if (minutes==60)//分钟的满60进位
        begin
          minutes = 0;
          hour = hour+1;
        end

      if (hour==24) //小时的满24进位，整点报时系统
        begin
          hour = 0;
          day = day+1;
          clock = 1;
        end

      if (month==2) 
        begin
          if ((2100+year)%4==0&&(2100+year)%100!=0||(2100+year)%400==0) //判断是否是瑞年，2月有29天
		        begin
                if (day==30) 
			            begin
                    month = 3;
                    day = 1;
                  end
            end

          else
       
            begin
                if (day==29) 
			            begin
                    month = 3;
                    day = 1;
                  end
            end
    
        end

      if(month==1||month==3||month==5||month == 7||month==8||month==10||month==12)
          begin
            if (day==32)
		          begin
                month = month+1;
                day = 1;
              end
          end

      if (month == 4||month==6||month==9||month ==11)
          begin
            if (day==31)
		          begin
                month=month+1;
                day = 1;
              end
          end
      if (month==13) //月份的改变
          begin
            month=1;
            year = year +1;
          end
    
      if (second!=0) 
          begin
            clock = 0;
          end
      if(!key1)
          begin
            if (sw1&&sw0==0) 
              begin
                day = day +  1;
              end
            else if (sw1==0&&sw0==0) 
              begin
                
					 second = second + 1;
              end
          end

      if(!key2)
          begin 
            
              if (sw1&&sw0==0) 
              begin
               month = month +1;
              end
            else if (sw1==0&&sw0==0) 
              begin
                
					 minutes = minutes + 1;
              end
             
          end
      if(!key3)
          begin
            if (sw1&&sw0==0)
              begin
					 year = year + 1;
              end
            else if(sw1==0&&sw0==0)
              begin
                 hour = hour + 1;

              end
          end

      
      if (sw1) 
          begin
            //当sw1为1时显示年月日
              q1 = day%10;
              q2 = day/10;
              q3 = month%10;
              q4 = month/10;
              q5 = year%10;
              q6 = year/10;
          end 
      else 
          begin
              q1 = second%10;
              q2 = second/10;
              q3 = minutes%10;
              q4 = minutes/10;
              q5 = hour%10;
              q6 = hour/10;
          end 

    end

end

assign hex0 = q1;
assign hex1 = q2;
assign hex2 = q3;
assign hex3 = q4;
assign hex4 = q5;
assign hex5 = q6;

endmodule 
