function [conf_matrix] = confusion_matrix(result,who, from, previous_cm)

if result == 1
previous_cm(from,from) = previous_cm(from,from) + 1;

else
previous_cm(from, who) =  previous_cm(from, who) +1;  
    
end

conf_matrix = previous_cm;
end