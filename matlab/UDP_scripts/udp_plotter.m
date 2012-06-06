function udp_plotter(lport)
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
  
  % Add default argument
  if nargin<1, lport=7012; end
  % Write help message
  disp ' ';
  disp 'To send packages to be plotted use e.g.';
  disp(sprintf('   Use:   udp_send_demo sin(0:0.1:6)  '));
  disp 'or';
  disp(sprintf('   Use:   udp_send_demo sin(0:0.1:6)  HOSTNAME'));
  disp ' ';
  disp 'To send a package to be plotted';
  % Open figure window
  fg=figure;
  clf; axis; drawnow;
  % Open  udpsocket and bind udp port adress to it.
  udp=pnet('udpsocket',lport);
  % Use timeout to not block forever, makes it possible to update resized window.
 p=1;
  try
    while p=<1001,
      % Wait/Read udp packet to reed buffer
      len=pnet(udp,'readpacket');
      if len>0,
	% if packet larger then 1 byte then read maximum of 1000 doubles in network byte order
	data=pnet(udp,'read',1000,'string');
	figure(fg);
	% .... and plot doubles in axis.
    %hold on
    data = strsplit(';',data);
    
    %Text file data:Speed,brakes,gas,clutch,gear,distance,time, x, y ,z, x-acc, y-acc,z-acc,steering
    for a=1:size(data,2)
        dataplot(a,p)= str2double(data(a));
    end
    p=p+1;
    
      end
      
      if mod(p,100) == 10010
        subplot(3,3,1)
        plot(dataplot(1,:));
        drawnow; 
        subplot(3,3,2)
        plot(dataplot(2,:));
        drawnow; 
        subplot(3,3,3)
        plot(dataplot(3,:));
        drawnow;  
                subplot(3,3,4)
        plot(dataplot(4,:));
        drawnow;  
                subplot(3,3,5)
        plot(dataplot(5,:));
        drawnow;  
                subplot(3,3,6)
        plot(dataplot(6,:));
        drawnow;  
         subplot(3,3,7)
        plot(dataplot(7,:));
        drawnow;
         subplot(3,3,8)
        plot(dataplot(8,:));
        drawnow;
         subplot(3,3,9)
        plot(dataplot(9:11,:)');
        drawnow;
        
        
    end 
    
    %if p==10000
   %     p=5000;
   %     dataplot(:,1:5000)= dataplot(:,5000:10000);
   %     dataplot(:,5000:10000) = 0;
   % end
     
    end
  catch err
     pnet(udp,'close');
     delete(fg); 
     display(err)
    % udp_plotter_demo;
  end
  % On break or error close udpconnection and figure window.
  pnet(udp,'close');
  delete(fg);
  return;
