N=200;
timeSteps=100; 
a1=-1; a2=-1; a3=-1;
b1=-1; b2=-1; b3=-1;

currentPlayer=zeros(N); 
tempPlayer=currentPlayer; 
payoff=zeros(N); 
change=zeros(N); 
rock=zeros(N);
paper=zeros(N);
sissor=zeros(N);

for i=1:N 
    for j=1:N 
            species = rand;
            if species<1/3 
                currentPlayer(i,j)=1; 
            elseif species<2/3 && species>=1/3
                currentPlayer(i,j)=2; 
            elseif species<1 && species>=2/3
                currentPlayer(i,j)=3;
            end
    end 
end 
  
figure; 
hold on 

percentageRock=zeros(1,timeSteps);
percentagePaper=zeros(1,timeSteps);
percentageSissor=zeros(1,timeSteps);

for t=1:timeSteps 
    Map = [1 0 0;1 1 0;0 0 1]; 
    colormap(Map); 
    imagesc(change); 
    pause(0.00001); 
    
    percentageRock(t)=sum(sum(rock))/N^2;
    percentagePaper(t)=sum(sum(paper))/N^2;
    percentageSissor(t)=sum(sum(sissor))/N^2;
    
    payoff = zeros(N); 
    for i=1:N 
        for j=1:N  
            for m = -1:1 
              for n = -1:1
                      direction = rand;
                      if direction <= 1/8
                          m = -1; n = -1;
                      elseif direction <= 1/4 && direction > 1/8
                          m = -1; n = 0;
                      elseif direction <= 3/8 && direction > 1/4
                          m = -1; n = 1; 
                      elseif direction <= 1/2 && direction > 3/8
                          m = 0; n = -1;
                      elseif direction <= 5/8 && direction > 1/2
                          m = 0; n = 1;
                      elseif direction <= 3/4 && direction > 5/8
                          m = 1; n = -1;
                      elseif direction <= 7/8 && direction > 3/4
                          m = 1; n = 0;
                      elseif direction >= 7/8
                          m = 1; n = 1;
                      end 
                      I = i + m;
                      J = j + n; 
  
                     if I>0 && I<=N && J>0 && J<=N  
                     
                        if currentPlayer(i, j)==2 && currentPlayer(I,J)==1 
                            payoff(i,j)= payoff(i,j) - a2; 
                        elseif currentPlayer(i, j)==3 && currentPlayer(I,J)==2 
                            payoff(i,j)= payoff(i,j) - a3; 
                        elseif currentPlayer(i, j)==1 && currentPlayer(I,J)==3 
                            payoff(i,j)= payoff(i,j) - a1;  
                        elseif currentPlayer(i, j)==1 && currentPlayer(I,J)==2 
                            payoff(i,j)= payoff(i,j) + b1; 
                        elseif currentPlayer(i, j)==2 && currentPlayer(I,J)==3 
                            payoff(i,j)= payoff(i,j) + b2; 
                        elseif currentPlayer(i, j)==3 && currentPlayer(I,J)==1 
                            payoff(i,j)= payoff(i,j) + b3; 
                        end  
                     
                     end 
                  
              end 
            end
        end 
    end 
     
    for k = 1:(N*N)
        i = randperm(N,1);
        j = randperm(N,1);
            
             for m = -1:1 
              for n = -1:1 
                  if ~(m==0 && n==0)
                    I = i + m;
                    J = j + n;  
                    
                      if I>0 && I<=N && J>0 && J<=N  
                 
                           if payoff(I,J)>payoff(i,j) 
                                tempPlayer(i,j)=currentPlayer(I,J); 
                                payoff(i,j)=payoff(I,J); 
                           elseif payoff(I,J)==payoff(i,j) && currentPlayer(I,J)==1 
                                tempPlayer(i,j)=currentPlayer(I,J); 
                           elseif payoff(I,J)==payoff(i,j) && currentPlayer(I,J)==2
                                tempPlayer(i,j)=currentPlayer(I,J);
                           elseif payoff(I,J)==payoff(i,j) && currentPlayer(I,J)==3
                                tempPlayer(i,j)=currentPlayer(I,J);
                           end 
                      end 
                  end 
               end 
             end
             currentPlayer(i,j) = tempPlayer(i,j);
    end 
    
         
    
    for i = 1:N 
        for j = 1:N 
            if tempPlayer(i, j) == 1 
                rock(i,j) = 1;paper(i,j) = 0;sissor(i,j) = 0;
                change(i, j) = 0; 
            elseif tempPlayer(i, j) == 2 
                rock(i,j) = 0;paper(i,j) = 1;sissor(i,j) = 0;
                change(i, j) = 1; 
            elseif tempPlayer(i, j) == 3 
                rock(i,j) = 0;paper(i,j) = 0;sissor(i,j) = 1;
                change(i, j) = 2; 
            end 
        end 
    end 
  
   
     
end 
figure;
plot(percentageRock);
figure;
plot(percentagePaper);
figure;
plot(percentageSissor);