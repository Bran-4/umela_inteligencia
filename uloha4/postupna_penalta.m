function[Fit]=postupna_penalta(Pop)
 

[lpop,lstring]=size(Pop);
Fit=zeros(1,lpop);

for i=1:lpop
  pokuta=0;
  x=Pop(i,:);
  Fit(i)=0;	
  Fit(i)=-1*(x(1)*0.04+0.07*x(2)+0.11*x(3)+0.06*x(4)+0.05*x(5));   
  if x(1)+x(2)+x(3)+x(4)+x(5)>10000000
      pokuta=pokuta+x(1)+x(2)+x(3)+x(4)+x(5)-10000000;
  end
  if x(1)+x(2)>2500000
      pokuta=pokuta+x(1)+x(2)-2500000;
  end
  if -x(4)+x(5)>0
      pokuta=pokuta-x(4)+x(5);
  end
  if -0.5*x(1)-0.5*x(2)+0.5*x(3)+0.5*x(4)-0.5*x(5)>0
      pokuta=pokuta-0.5*x(1)-0.5*x(2)+0.5*x(3)+0.5*x(4)-0.5*x(5);
  end
  Fit(i)=Fit(i)+pokuta;
end