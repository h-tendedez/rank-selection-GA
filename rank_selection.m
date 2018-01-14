function [selectedParent] = rank_selection(fitnessStorage, chrome, population)

% Temporarily storing fitnesses
tempStorage = fitnessStorage;

% Matrix to store rankings
rankings = zeros(population,1);

% Set the maximum rank as n
rank = length(tempStorage);

% Location of Selected Parent 
selectedParentLocation = 0;

% Random number generator (between 1 and n)
randomNum = randi(length(rankings));

for x = 1:population
    
    [M, I] = max(tempStorage);
    
    maxFitnessIndex = I;
    
    rankings(I) = rank;
    
    tempStorage(I) = -1;
    
    rank = rank - 1;
end

rankingOrder = sort(rankings);

for k = 1:length(rankings) 
  
     if(rankingOrder(k) >= randomNum) 
         
         selection = k;
         
         [i,j] = find(rankings == k);
         
         selectedParentLocation = i;
         
         selectedParent = chrome(selectedParentLocation, :);
        break
     
     end

end

%fprintf('Parent %i was chosen\n', selection)
