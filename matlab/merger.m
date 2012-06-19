function [ new ] = merger( new, old )
%merger merger of 2 structures to one

x=1;
for a= size(new,1) + 1 : size(old,1) + size(new,1) 
   new{a,1} = old{x,1};
    x = x+1;
end

end

