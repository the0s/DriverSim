function [ parameters ] = raw2modelCepstrum( raw, angle )
%RAW2MODEL Takes a user input and convert it to a model
%  RAW user input from RACE DATA
%  CLASS class of the user for classification
p1= (idct(log(abs(fft(raw(:,1))))));
p2= (idct(log(abs(fft(raw(:,2))))));
p3= (idct(log(abs(fft(raw(:,3))))));
p4= (idct(log(abs(fft(raw(:,4))))));
p5= (idct(log(abs(fft(raw(:,5))))));

%parameters(1,1) = mean(p1);
%parameters(1,2) = mean(p2);
%parameters(1,3) = mean(p3);
%parameters(1,4) = mean(p4);
%parameters(1,5) = mean(p5);


%parameters(1,6) = var(p1);
%parameters(1,7) = var(p2);
%parameters(1,8) = var(p3);
%parameters(1,9) = var(p4);
%parameters(1,10) = var(p5);

%parameters= [p1(1:40,1)' p2(1:40,1)' p3(1:40,1)' p4(1:40,1)' p5(1:40,1)' ];

%parameters(1,1:10)= p1(1:10);
%parameters(1,11:20)= p2(1:10);
%parameters(1,21:30)= p3(1:10);
%parameters(1,31:40)= p4(1:10);
%parameters(1,41:50)= p5(1:10);
parameters= [p1(1:40,1)' p2(1:40,1)' p3(1:40,1)' p4(1:40,1)' p5(1:40,1)' ];


for x = 1:size(parameters,2)
    if isnan(parameters(1,x)) == 1
        parameters(1,x)=0;
    end
    
    if isinf(parameters(1,x)) == 1
        parameters(1,x)=0;
    end
end



parameters(1,42) = angle(1,3);
parameters(1,43) = angle(1,2);
parameters(1,44) = angle(1,1);
%parameters(1,11) = class;
end

