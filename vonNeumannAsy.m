N=200; 
timeSteps=100; 
T=1.75; R=1; S=0; P=0.01; 
currentPlayer=zeros(N); 
tempPlayer=currentPlayer; 
payoff=zeros(N); 
change=zeros(N); 
    
for i=1:N 
    for j=1:N 
        if rand<0.9
            currentPlayer(i,j)=1; 
        end 
    end 
end 
  
figure; 
hold on 
percentage=zeros(1,timeSteps);
  
for t=1:timeSteps 
    Map = [0 0 1;0 1 0;1 1 0;1 0 0]; 
    colormap(Map); 
    imagesc(change); 
    pause(0.00001); 
    percentage(t)=sum(sum(currentPlayer))/N^2;
    
    payoff = zeros(N); 
    for i=1:N 
        for j=1:N  
            for m = -1:1 
              for n = -1:1
                  if (m==0 || n==0) && ~(m==0 && n==0)
                    I = i + m;
                    J = j + n; 
  
                     if I>0 && I<=N && J>0 && J<=N  
                     
                        if currentPlayer(i, j)==1 && currentPlayer(I,J)==1 
                            payoff(i,j)= payoff(i,j) + R; 
                        elseif currentPlayer(i, j)==1 && currentPlayer(I,J)==0 
                            payoff(i,j)= payoff(i,j) + S; 
                        elseif currentPlayer(i, j)==0 && currentPlayer(I,J)==1 
                            payoff(i,j)= payoff(i,j) + T;  
                        elseif currentPlayer(i, j)==0 && currentPlayer(I,J)==0 
                            payoff(i,j)= payoff(i,j) + P; 
                        end 
                     
                     end 
                  end 
              end 
            end
        end 
    end 
    
    for k = 1:(N*N)
        i = randperm(N,1);
        j = randperm(N,1);
            %tempPayoff = payoff(i,j); 
             for m = -1:1 
              for n = -1:1 
                 if (m==0 || n==0) && ~(m==0 && n==0)
                    I = i + m;
                    J = j + n;
  
                      if I>0 && I<=N && J>0 && J<=N  
                 
                           if payoff(I,J)>=payoff(i,j)
                                tempPlayer(i,j)=currentPlayer(I,J); 
                                payoff(i,j)=payoff(I,J); 
                           end 
                      end 
                  end 
               end 
             end 
         currentPlayer(i,j) = tempPlayer(i,j);    
    end
    
    for i = 1:N 
        for j = 1:N 
            if currentPlayer(i, j) == 1 && tempPlayer(i, j) == 1 
                change(i, j) = 0; 
            elseif currentPlayer(i, j) == 1 && tempPlayer(i, j) == 0 
                change(i, j) = 1; 
            elseif currentPlayer(i, j) == 0 && tempPlayer(i, j) == 1 
                change(i, j) = 2; 
            elseif currentPlayer(i, j) == 0 && tempPlayer(i, j) == 0 
                change(i, j) = 3; 
            end 
        end 
    end 
  
     
    currentPlayer = tempPlayer; 
     
end 
figure;
plot(percentage);
