%function  udp_decision_tree(lport)
% UDP_PLOTTER_DEMO - Opens a figure and starts to listen for UDP packages to plot.
% Syntax: 
%   UDP_PLOTTER_DEMO
% or
%   UDP_PLOTTER_DEMO localport
%
% This script is a demo that listen for a UDP packet (default port 3333) and 
% uses PLOT to dplay the sequence of doubles in the packet.
%
% (C) 2002 Peter Rydesäter
  load('lapInfo.mat')
  plotting = 'n';
  % Add default argument
  lport=7012;
  %if nargin<1, lport=7012; end
  % Write help message
  disp ' ';
  disp 'To send packages to be plotted use e.g.';
  disp(sprintf('   Use:   udp_send_demo sin(0:0.1:6)  '));
  disp 'or';
  disp(sprintf('   Use:   udp_send_demo sin(0:0.1:6)  HOSTNAME'));
  disp ' ';
  disp 'To send a package to be plotted';
  % Open figure window
  %fg=figure;
  %clf; axis; drawnow;
  % Open  udpsocket and bind udp port adress to it.
  udp=pnet('udpsocket',lport);
  % Use timeout to not block forever, makes it possible to update resized window.
 p=1;
 f=1;
 g=1;
 s=1;
  %try
    while 1,
      % Wait/Read udp packet to reed buffer
      len=pnet(udp,'readpacket');
      if len>0,
	% if packet larger then 1 byte then read maximum of 1000 doubles in network byte order
	data=pnet(udp,'read',1000,'string');
	%figure(fg);
	% .... and plot doubles in axis.
    %hold on
    data = strsplit(';',data);
    
    %Text file data:Speed,brakes,gas,clutch,gear,distance,time, x, y ,z, x-acc, y-acc,z-acc,steering
    for a=1:size(data,2)
        dataplot(a,p)= str2double(data(a));
    end
    p=p+1;
    
      end
      try
      if mod(p,400) == 0
            display('Predicting...');
           [ Indexa2 ] = user_structure( dataplot, 20,12,plotting,'y'); 
           [Indexa_new] = assing_angles_using_means(Indexa,Indexa2,plotting);  
           [User_Cell, User_Cell_Bad] = ModelCreation(Indexa_new);
           if size(User_Cell{1},1) ~= 0 
               for l=1:size(User_Cell,2)
                   angle_var= User_Cell{3,l};
                   instance= raw2model(User_Cell{2,l});          
                   good = decisionTree(angle_var,'good',instance)
                   prediction_good(f) = good;
                   ugly = decisionTree(angle_var,'ugly',instance)
                   prediction_ugly_G(s)= ugly;
                   s=s+1;
                   f=f+1;
               end          
           end
           if size(User_Cell_Bad{1},1) ~= 0 
               for l=1:size(User_Cell_Bad,2)
                   angle_var= User_Cell_Bad{3,l};
                   instance= raw2model(User_Cell_Bad{2,l});          
                   bad = decisionTree(angle_var,'bad',instance)
                   prediction_bad(f)= bad;
                   g=g+1;
                   ugly = decisionTree(angle_var,'ugly',instance)
                   prediction_ugly_B(s)= ugly;
                   s=s+1;
               end          
           end                         
           dataplot=[];
           p=1;
      end 
      catch err
          display(err);
      end
    %if p==10000
   %     p=5000;
   %     dataplot(:,1:5000)= dataplot(:,5000:10000);
   %     dataplot(:,5000:10000) = 0;
   % end
     
    end
  %catch err
  %   pnet(udp,'close');
  %   delete(fg); 
  %   display(err)
    % udp_plotter_demo;
  %end
  % On break or error close udpconnection and figure window.
  pnet(udp,'close');
  delete(fg);
  return;
